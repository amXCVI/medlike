import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medlike/domain/app/cubit/medcard/medcard_cubit.dart';

class AttachFilesFunctionsList extends StatefulWidget {
  const AttachFilesFunctionsList({Key? key, required this.userId})
      : super(key: key);

  final String userId;

  @override
  State<AttachFilesFunctionsList> createState() =>
      _AttachFilesFunctionsListState();
}

class _AttachFilesFunctionsListState extends State<AttachFilesFunctionsList> {
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
      ImagePicker _picker = ImagePicker();
      try {
        XFile? xFile;
        FilePickerResult? filePickerResult;
        if (fileType == FileType.media) {
          xFile = await _picker.pickImage(
            source: ImageSource.camera,
          );
        } else {
          filePickerResult = (await FilePicker.platform.pickFiles(
            type: fileType,
            allowMultiple: false,
            onFileLoading: (FilePickerStatus status) => {},
          ));
        }

        context
            .read<MedcardCubit>()
            .uploadFileFromDio(
              file: filePickerResult != null
                  ? filePickerResult.files.first
                  : null,
              photoFile: xFile != null ? File(xFile.path) : null,
              userId: widget.userId,
              fileName: filePickerResult!.files.first.name,
            )
            .then((value) => {Navigator.pop(context)});
      } catch (e) {
        rethrow;
      }
      if (!mounted) return;
    }

    return ListView(
        shrinkWrap: false,
        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 0),
        children: [
          //! Не работает. Не понятны причины. Разобраться
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
            fileType: FileType.any,
            onTap: () {
              _pickFiles(FileType.any);
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
      color: Theme.of(context).backgroundColor,
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
