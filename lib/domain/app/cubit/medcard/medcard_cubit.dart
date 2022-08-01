import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:medlike/data/models/medcard_models/medcard_models.dart';
import 'package:medlike/data/repository/medcard_repository.dart';
import 'package:medlike/widgets/fluttertoast/toast.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';

part 'medcard_state.dart';

class MedcardCubit extends Cubit<MedcardState> {
  MedcardCubit(this.medcardRepository) : super(const MedcardState());

  final MedcardRepository medcardRepository;

  /// Получает список мед.документов пользователя
  //! Нужно будет добавить фильтры, сеййчас загружаются просто все документы
  void getMedcardDocsList(
      {required bool isRefresh, required String userId}) async {
    if (state.getMedcardDocsListStatus == GetMedcardDocsListStatuses.loading) {
      return;
    }
    emit(state.copyWith(
      getMedcardDocsListStatus: GetMedcardDocsListStatuses.loading,
    ));
    try {
      final List<MedcardDocsModel> response;
      response = await medcardRepository.getMedcardDocsList(userId: userId);
      emit(state.copyWith(
        getMedcardDocsListStatus: GetMedcardDocsListStatuses.success,
        medcardDocsList: response,
        filteredMedcardDocsList: response,
      ));
    } catch (e) {
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
      var response = await medcardRepository.downloadFile(url: fileUrl);
      var bytes = await consolidateHttpClientResponseBytes(response);
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/$fileName.pdf");

      await file.writeAsBytes(bytes, flush: true);
      completer.complete(file);
      OpenFile.open(
        "${dir.path}/$fileName.pdf",
      );
      emit(state.copyWith(
        downloadMedcardDocumentStatus: DownloadMedcardDocumentStatuses.success,
        downloadingFileId: '',
      ));
    } catch (e) {
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
  }) async {
    Completer<File> completer = Completer();
    try {
      emit(state.copyWith(downloadingFileId: fileId));
      var response = await medcardRepository.downloadFile(url: fileUrl);
      var bytes = await consolidateHttpClientResponseBytes(response);
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/$fileName");

      await file.writeAsBytes(bytes, flush: true);
      completer.complete(file);
      OpenFile.open(
        "${dir.path}/$fileName",
      );
      emit(state.copyWith(downloadingFileId: ''));
    } catch (e) {
      AppToast.showAppToast(
          msg:
              'Произошла непредвиденная ошибка\nНе удается открыть файл $fileName');
      emit(state.copyWith(downloadingFileId: ''));
      rethrow;
    }
    return completer.future;
  }

  uploadFileFromDio(
      {required File file,
      required String userId,
      required String fileName}) async {
    // formData.add("user_id", userProfile.userId);
    // formData.add("name", userProfile.name);
    // formData.add("email", userProfile.email);

    // if (file != null &&
    //     file.path != null &&
    //     file.path.isNotEmpty) {
    // Create a FormData
    // String fileName = basename(photoFile.path);
    Map<String, dynamic> requestFormDataBody = <String, dynamic>{
      'field1': file,
    };
    FormData formData = FormData.fromMap(requestFormDataBody);

    // }
    var response =
        await medcardRepository.uploadFile(userId: userId, formData: formData);
    print("Response status: ${response.statusCode}");
  }
}
