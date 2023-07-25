import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';

class AttachFilesFunctionsList extends StatefulWidget {
  const AttachFilesFunctionsList({
    Key? key,
    required this.attachPickedFile,
    required this.attachFilePickerResult,
  }) : super(key: key);
  final void Function({required PickedFile pickedFile}) attachPickedFile;
  final void Function({required FilePickerResult filePickerResult})
      attachFilePickerResult;

  @override
  State<AttachFilesFunctionsList> createState() =>
      _AttachFilesFunctionsListState();
}

class _AttachFilesFunctionsListState extends State<AttachFilesFunctionsList> {
  final ImagePicker _picker = ImagePicker();

  @override
  void initState() {
    super.initState();
  }

  void _resetState() {
    if (!mounted) {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    void _pickFiles(FileType fileType) async {
      _resetState();
      try {
        FilePickerResult? filePickerResult;
        if (fileType == FileType.media) {
          var image = await _picker.pickImage(source: ImageSource.camera);
          if (image != null) {
            widget.attachPickedFile(pickedFile: PickedFile(image.path));
          }
        } else {
          filePickerResult = await FilePicker.platform.pickFiles(
            allowedExtensions: fileType == FileType.custom
                ? ['jpg', 'jpeg', 'png', 'pdf', 'doc', 'docx', 'rtf', 'txt']
                : [],
            type: fileType,
            allowMultiple: false,
            onFileLoading: (FilePickerStatus status) => {},
          );
          if (filePickerResult != null) {
            widget.attachFilePickerResult(filePickerResult: filePickerResult);
          }
        }
        Navigator.pop(context);
      } catch (e) {
        rethrow;
      }
      if (!mounted) return;
    }

    return ListView(
        shrinkWrap: false,
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
        children: [
          AttachFileItem(
            label: 'Сделать фото',
            iconPath: 'assets/icons/bottom_nav_bar/ic_camera_files_outline.svg',
            fileType: FileType.media,
            onTap: () {
              _pickFiles(FileType.media);
            },
          ),
          AttachFileItem(
            label: 'Галерея',
            iconPath: 'assets/icons/bottom_nav_bar/ic_image_outline.svg',
            fileType: FileType.image,
            onTap: () {
              _pickFiles(FileType.image);
            },
          ),
          AttachFileItem(
            label: 'Проводник',
            iconPath: 'assets/icons/bottom_nav_bar/ic_file_outline.svg',
            fileType: FileType.custom,
            onTap: () {
              _pickFiles(FileType.custom);
            },
          ),
        ]);
  }
}

class AttachFileItem extends StatelessWidget {
  const AttachFileItem({
    Key? key,
    required this.label,
    required this.iconPath,
    required this.onTap,
    required this.fileType,
  }) : super(key: key);

  final String label;
  final String iconPath;
  final FileType fileType;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Theme.of(context).colorScheme.background,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 22),
          child: Row(
            children: [
              SvgPicture.asset(iconPath),
              const SizedBox(width: 30.0),
              Text(label, style: Theme.of(context).textTheme.titleMedium),
            ],
          ),
        ),
      ),
    );
  }
}
