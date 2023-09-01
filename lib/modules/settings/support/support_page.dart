import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:medlike/domain/app/cubit/user/user_cubit.dart';
import 'package:medlike/modules/settings/support/attach_files_list.dart';
import 'package:medlike/modules/settings/support/support_form.dart';
import 'package:medlike/utils/helpers/file_constraints_helper.dart';
import 'package:medlike/widgets/attach_files_button/attach_file_button.dart';
import 'package:medlike/widgets/default_scaffold/default_scaffold.dart';
import 'package:tap_canvas/tap_canvas.dart';

@RoutePage()
class SupportPage extends StatefulWidget {
  const SupportPage({Key? key}) : super(key: key);

  @override
  State<SupportPage> createState() => _SupportPageState();
}

class _SupportPageState extends State<SupportPage> {
  final _formKey = GlobalKey<FormState>();

  late final TextEditingController _controllerTheme =
      TextEditingController(text: '');
  late final TextEditingController _controllerMessage =
      TextEditingController(text: '');
  late final TextEditingController _controllerEmail =
      TextEditingController(text: '');

  List<File> filesList = [];

  @override
  void initState() {
    super.initState();
  }

  void handleDeleteFile(File file) {
    setState(() {
      filesList.remove(file);
    });
  }

  @override
  Widget build(BuildContext context) {
    void sendingEmail() {
      if (_formKey.currentState!.validate()) {
        context
            .read<UserCubit>()
            .sendEmailToSupport(
              email: _controllerEmail.text,
              subject: _controllerTheme.text,
              message: _controllerMessage.text,
              files: filesList,
            )
            .then((value) => {context.router.pop()});
      } else {
        return;
      }
    }

    void attachPickedFile({required PickedFile pickedFile}) {
      File attachedFile = File(pickedFile.path);
      if (!checkConstraints(attachedFile)) {
        return;
      }
      setState(() {
        filesList.add(attachedFile);
      });
    }

    void attachFilePickerResult({required FilePickerResult filePickerResult}) {
      File attachedFile = File(filePickerResult.files.first.path as String);
      if (!checkConstraints(attachedFile)) {
        return;
      }
      setState(() {
        filesList.add(attachedFile);
      });
    }

    return TapCanvas(
      child: DefaultScaffold(
        appBarTitle: 'Тех. поддержка',
        isChildrenPage: true,
        needToResize: false,
        actionButton: BlocBuilder<UserCubit, UserState>(
          builder: (context, state) {
            return FloatingActionButton.extended(
              onPressed: sendingEmail,
              label: state.sendingEmailToSupportStatus ==
                      SendingEmailToSupportStatuses.loading
                  ? const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      child: CircularProgressIndicator(
                        color: Colors.white,
                      ),
                    )
                  : Text(
                      'Отправить'.toUpperCase(),
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
            );
          },
        ),
        rightBottomWidget: AttachFileButton(
          attachPickedFile: attachPickedFile,
          attachFilePickerResult: attachFilePickerResult,
        ),
        child: ListView(
          children: [
            SupportForm(
              formKey: _formKey,
              controllerTheme: _controllerTheme,
              controllerMessage: _controllerMessage,
              controllerEmail: _controllerEmail,
            ),
            AttachFilesList(
                filesList: filesList, handleDeleteFile: handleDeleteFile),
            SizedBox(height: 30,)
          ],
        ),
      ),
    );
  }
}
