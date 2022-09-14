import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/domain/app/cubit/user/user_cubit.dart';
import 'package:medlike/modules/login/unauth_support/unauth_support_form.dart';
import 'package:medlike/widgets/default_scaffold/default_scaffold.dart';

class UnauthSupportPage extends StatelessWidget {
  const UnauthSupportPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();

    late final TextEditingController _controllerMessage =
        TextEditingController(text: '');
    late final TextEditingController _controllerEmail =
        TextEditingController(text: '');

    void sendingEmail() {
      if (_formKey.currentState!.validate()) {
        context.read<UserCubit>().sendUnauthEmailToSupport(
              email: _controllerEmail.text,
              message: _controllerMessage.text,
            );
      } else {
        return;
      }
    }

    return DefaultScaffold(
      appBarTitle: 'Тех. поддержка',
      isChildrenPage: true,
      child: UnauthSupportForm(
        controllerEmail: _controllerEmail,
        formKey: _formKey,
        controllerMessage: _controllerMessage,
      ),
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
      bottomNavigationBar: const SizedBox(height: 56),
    );
  }
}
