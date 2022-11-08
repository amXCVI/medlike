import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medlike/widgets/attach_files_button/attach_files_functions_list.dart';
import 'package:medlike/widgets/icon_with_bottom_label/icon_with_bottom_label.dart';

class AttachFileButton extends StatelessWidget {
  const AttachFileButton({
    Key? key,
    required this.attachPickedFile,
    required this.attachFilePickerResult,
    required this.attachFile,
  }) : super(key: key);

  final void Function({required PickedFile pickedFile}) attachPickedFile;
  final void Function({required FilePickerResult filePickerResult})
      attachFilePickerResult;
  final void Function({
    required Uint8List fileBytes,
    required String fileName,
    required int size,
    required String fileType,
  }) attachFile;

  void pickFilesWeb() async {
    List<PlatformFile>? _paths;

    try {
      _paths = (await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowMultiple: false,
        allowedExtensions: [
          'jpg',
          'jpeg',
          'png',
          'pdf',
          'doc',
          'docx',
          'rtf',
          'txt'
        ],
      ))
          ?.files;
    } on PlatformException catch (e) {
      print('Unsupported operation' + e.toString());
    } catch (e) {
      print(e.toString());
    }

    attachFile(
      fileBytes: _paths!.first.bytes!,
      fileName: _paths.first.name,
      size: _paths.first.size,
      fileType: _paths.first.extension!,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        kIsWeb
            ? pickFilesWeb()
            : showModalBottomSheet(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
                context: context,
                builder: (context) => Container(
                      height: 48 * 3 + 16 + 24,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(12),
                            topLeft: Radius.circular(12)),
                        color: Theme.of(context).backgroundColor,
                      ),
                      child: AttachFilesFunctionsList(
                        attachPickedFile: attachPickedFile,
                        attachFilePickerResult: attachFilePickerResult,
                      ),
                    ));
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      child: IconWithBottomLabel(
        icon: SvgPicture.asset(
            'assets/icons/bottom_nav_bar/ic_attach_outline.svg'),
        label: 'Добавить',
      ),
    );
  }
}
