import 'dart:async';
import 'dart:io';
import 'package:http_parser/http_parser.dart';
import 'dart:html' as html;

import 'package:flutter/foundation.dart';
import 'package:medlike/constants/app_constants.dart';
import 'package:medlike/data/models/medcard_models/medcard_models.dart';
import 'package:medlike/data/repository/medcard_repository.dart';
import 'package:medlike/domain/app/cubit/user/user_cubit.dart';
import 'package:medlike/domain/app/mediator/base_mediator.dart';
import 'package:medlike/domain/app/mediator/user_mediator.dart';
import 'package:medlike/widgets/fluttertoast/toast.dart';
import 'package:mime/mime.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

part 'medcard_state.dart';

class MedcardCubit extends MediatorCubit<MedcardState, UserMediatorEvent>
    with RefreshErrorHandler<MedcardState, UserCubit> {
  MedcardCubit(this.medcardRepository, mediator)
      : super(const MedcardState(), mediator) {
    mediator.register(this);
  }

  @override
  void receive(String from, UserMediatorEvent event) {
    throw UnimplementedError();
  }

  final MedcardRepository medcardRepository;

  /// Получает список мед.документов пользователя
  void getMedcardDocsList(
      {required bool isRefresh, required String userId}) async {
    if (state.getMedcardDocsListStatus == GetMedcardDocsListStatuses.loading) {
      return;
    }
    emit(state.copyWith(
      getMedcardDocsListStatus: GetMedcardDocsListStatuses.loading,
    ));
    try {
      String? filtersStr = state.medcardSelectedFilters != null
          ? state.medcardSelectedFilters?.entries
              .map((e) => e.value.value)
              .join('&')
              .toString()
          : '';

      final List<MedcardDocsModel> response;
      response = await medcardRepository.getMedcardDocsList(
          userId: userId, filters: filtersStr as String);
      emit(state.copyWith(
        getMedcardDocsListStatus: GetMedcardDocsListStatuses.success,
        medcardDocsList: response,
        filteredMedcardDocsList: response,
      ));
    } catch (e) {
      addError(e);
      emit(state.copyWith(
          getMedcardDocsListStatus: GetMedcardDocsListStatuses.failed));
    }
  }

  void filterMedcardDocsList(String filterStr) {
    final List<MedcardDocsModel> filteredList;
    filteredList = state.medcardDocsList!
        .where((element) =>
            element.nameDoc.toLowerCase().contains(filterStr.toLowerCase()))
        .toList();

    emit(state.copyWith(
      filteredMedcardDocsList: filteredList,
    ));
  }

  /// Получает файлы, загруженные пользователем в систему
  void getUserFilesList(
      {required bool isRefresh, required String userId}) async {
    emit(state.copyWith(
      getMedcardUserFilesListStatus: GetMedcardUserFilesListStatuses.loading,
    ));
    try {
      final List<MedcardUserFileModel> response;
      response = await medcardRepository.getUserFilesList(userId: userId);
      emit(state.copyWith(
        getMedcardUserFilesListStatus: GetMedcardUserFilesListStatuses.success,
        medcardUserFilesList: response,
        filteredMedcardUserFilesList: response,
      ));
    } catch (e) {
      addError(e);
      emit(state.copyWith(
          getMedcardUserFilesListStatus:
              GetMedcardUserFilesListStatuses.failed));
    }
  }

  void filterUserFilesList(String filterStr) {
    final List<MedcardUserFileModel> filteredList;
    filteredList = state.medcardUserFilesList!
        .where((element) =>
            element.filename.toLowerCase().contains(filterStr.toLowerCase()))
        .toList();

    emit(state.copyWith(
      filteredMedcardUserFilesList: filteredList,
    ));
  }

  /// Загрузка и открытие файлов из медкарты
  /// Работает только для .pdf файлов
  Future<File> downloadAndOpenPdfFileByUrl({
    required String fileUrl,
    required String fileName,
    required String fileId,
  }) async {
    Completer<File> completer = Completer();
    try {
      emit(state.copyWith(
        downloadMedcardDocumentStatus: DownloadMedcardDocumentStatuses.loading,
        downloadingFileId: fileId,
      ));
      if (kIsWeb) {
        final response = await medcardRepository.downloadFile(url: fileUrl);
        final bytes = response.bodyBytes;
        final blob = html.Blob([bytes], 'application/pdf');
        final url = html.Url.createObjectUrlFromBlob(blob);
        final anchor = html.document.createElement('a') as html.AnchorElement
          ..href = url
          ..style.display = 'none'
          ..download = fileName;
        html.document.body?.children.add(anchor);
        anchor.click();
        html.document.body?.children.remove(anchor);
        html.Url.revokeObjectUrl(url);
      } else {
        var response = await medcardRepository.downloadFile(url: fileUrl);
        var bytes = await consolidateHttpClientResponseBytes(response);
        var dir = await getApplicationDocumentsDirectory();
        File file = File("${dir.path}/$fileName.pdf");

        await file.writeAsBytes(bytes, flush: true);
        completer.complete(file);
        OpenFile.open(
          "${dir.path}/$fileName.pdf",
        );
      }
      emit(state.copyWith(
        downloadMedcardDocumentStatus: DownloadMedcardDocumentStatuses.success,
        downloadingFileId: '',
      ));
    } catch (e) {
      addError(e);
      AppToast.showAppToast(
          msg:
              'Произошла непредвиденная ошибка\nНе удается открыть файл $fileName');
      emit(state.copyWith(
        downloadMedcardDocumentStatus: DownloadMedcardDocumentStatuses.failed,
        downloadingFileId: '',
      ));
      rethrow;
    }
    return completer.future;
  }

  /// Загрузка и открытие пользовательских файлов
  Future<File> downloadAndOpenUserFileByUrl({
    required String fileUrl,
    required String fileName,
    required String fileId,
    required String fileType,
  }) async {
    Completer<File> completer = Completer();
    try {
      emit(state.copyWith(downloadingFileId: fileId));
      final response = await medcardRepository.downloadFile(url: fileUrl);
      if (kIsWeb) {
        final bytes = response.bodyBytes;
        final blob = html.Blob([bytes], fileType);
        final url = html.Url.createObjectUrlFromBlob(blob);
        final anchor = html.document.createElement('a') as html.AnchorElement
          ..href = url
          ..style.display = 'none'
          ..download = fileName;
        html.document.body?.children.add(anchor);
        anchor.click();
        html.document.body?.children.remove(anchor);
        html.Url.revokeObjectUrl(url);
      } else {
        var bytes = await consolidateHttpClientResponseBytes(response);
        var dir = await getApplicationDocumentsDirectory();
        File file = File("${dir.path}/$fileName");
        await file.writeAsBytes(bytes, flush: true);
        completer.complete(file);
        OpenFile.open(
          "${dir.path}/$fileName",
        );
      }
      emit(state.copyWith(downloadingFileId: ''));
    } catch (e) {
      addError(e);
      AppToast.showAppToast(
          msg:
              'Произошла непредвиденная ошибка\nНе удается открыть файл $fileName');
      emit(state.copyWith(downloadingFileId: ''));
      rethrow;
    }
    return completer.future;
  }

  Future<void> uploadFileFromDio({
    required File file,
    required String userId,
    required String fileName,
  }) async {
    emit(state.copyWith(
      uploadMedcardDocumentStatus: UploadMedcardDocumentStatuses.loading,
      filteredMedcardUserFilesList: [
        ...?state.medcardUserFilesList,
        MedcardUserFileModel(
          type: MediaType.parse(lookupMimeType(file.path) as String).type,
          hasPreview: false,
          id: AppConstants.uploadingFileId,
          length: file.lengthSync(),
          uploadDate: DateTime.now(),
          filename: fileName,
        )
      ].toList(),
      downloadingFileId: AppConstants.uploadingFileId,
    ));
    try {
      MedcardUserFileModel response = await medcardRepository.uploadFile(
        userId: userId,
        file: file,
        fileName: fileName,
        fileType: MediaType.parse(lookupMimeType(file.path) as String).type,
      );
      emit(state.copyWith(
        uploadMedcardDocumentStatus: UploadMedcardDocumentStatuses.success,
        medcardUserFilesList:
            [...?state.medcardUserFilesList, response].toList(),
        filteredMedcardUserFilesList: [
          ...?state.filteredMedcardUserFilesList
              ?.where((e) => e.id != AppConstants.uploadingFileId),
          response
        ].toList(),
        downloadingFileId: '',
      ));
    } catch (e) {
      addError(e);
      emit(state.copyWith(
        uploadMedcardDocumentStatus: UploadMedcardDocumentStatuses.failed,
        downloadingFileId: '',
      ));
      rethrow;
    }
  }

  Future<void> uploadFileFromDioForWeb({
    required Uint8List fileBytes,
    required String userId,
    required String fileName,
    required int size,
    required String fileType,
  }) async {
    emit(state.copyWith(
      uploadMedcardDocumentStatus: UploadMedcardDocumentStatuses.loading,
      filteredMedcardUserFilesList: [
        ...?state.medcardUserFilesList,
        MedcardUserFileModel(
          type: MediaType(fileType, fileType).type,
          hasPreview: false,
          id: AppConstants.uploadingFileId,
          length: size,
          uploadDate: DateTime.now(),
          filename: fileName,
        )
      ].toList(),
      downloadingFileId: AppConstants.uploadingFileId,
    ));
    try {
      MedcardUserFileModel response = await medcardRepository.uploadFile(
        userId: userId,
        fileBytes: fileBytes,
        fileName: fileName,
        fileType: fileType,
      );
      emit(state.copyWith(
        uploadMedcardDocumentStatus: UploadMedcardDocumentStatuses.success,
        medcardUserFilesList:
            [...?state.medcardUserFilesList, response].toList(),
        filteredMedcardUserFilesList: [
          ...?state.filteredMedcardUserFilesList
              ?.where((e) => e.id != AppConstants.uploadingFileId),
          response
        ].toList(),
        downloadingFileId: '',
      ));
    } catch (e) {
      addError(e);

      /// Если попытались загрузить неверный тип файла, или еще какая-то ошибка
      /// дергаем список всех файлов заново
      getUserFilesList(isRefresh: true, userId: userId);
      emit(state.copyWith(
        uploadMedcardDocumentStatus: UploadMedcardDocumentStatuses.failed,
        downloadingFileId: '',
      ));
      rethrow;
    }
  }

  /// Изменить фильтры в медкарте
  void changeMedcardFilters({
    required MedcardFilterItemModel filterItem,
    required String categoryValue,
  }) {
    Map<String, MedcardFilterItemModel> medcardFilters =
        state.medcardSelectedFilters as Map<String, MedcardFilterItemModel>;
    medcardFilters.remove(categoryValue);
    medcardFilters[categoryValue] = filterItem;

    emit(state.copyWith(
      medcardSelectedFilters: medcardFilters,
    ));
  }

  /// Сбросить фильтры в медкарте
  void resetMedcardFilters({required String userId}) {
    emit(state.copyWith(
      medcardSelectedFilters: <String, MedcardFilterItemModel>{},
    ));
    getMedcardDocsList(userId: userId, isRefresh: true);
  }

  /// Удалить файл
  void deleteUserFile({
    required String fileId,
    required String userId,
  }) async {
    emit(state.copyWith(
      deletingUserFile: fileId,
      filteredMedcardUserFilesList: state.filteredMedcardUserFilesList
          ?.where((e) => e.id != fileId)
          .toList(),
    ));
    try {
      final DeleteUserFileResponseModel response;
      response = await medcardRepository.deleteUserFile(
          fileId: fileId, userId: userId);

      emit(state.copyWith(
        deletingUserFile: '',
        medcardUserFilesList:
            state.medcardUserFilesList?.where((e) => e.id != fileId).toList(),
      ));
      AppToast.showAppToast(msg: response.information ?? 'Файл успешно удален');
    } catch (e) {
      addError(e);
      emit(state.copyWith(deletingUserFile: ''));
    }
  }
}
