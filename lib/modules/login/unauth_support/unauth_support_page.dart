import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/constants/app_constants.dart';
import 'package:medlike/domain/app/cubit/user/user_cubit.dart';
import 'package:medlike/modules/login/unauth_support/unauth_support_form.dart';
import 'package:medlike/utils/helpers/project_determiner.dart';
import 'package:medlike/widgets/default_scaffold/default_scaffold.dart';
import 'package:medlike/widgets/default_scaffold/web_auth_pages_body_container.dart';
import 'package:tap_canvas/tap_canvas.dart';

@RoutePage()
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
        context
            .read<UserCubit>()
            .sendUnauthEmailToSupport(
              email: _controllerEmail.text,
              message: _controllerMessage.text,
            )
            .then((value) => context.router.pop());
      } else {
        return;
      }
    }

    return TapCanvas(
      child: DefaultScaffold(
        appBarTitle: 'Тех. поддержка',
        isChildrenPage: true,
        isAuth: false,
        isBottomIndent: false,
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
        bottomNavigationBar: const SizedBox(height: 56),
        child: ProjectDeterminer.getProjectType() == Projects.WEB
            ? WebAuthPagesBodyContainer(
                child: UnauthSupportForm(
                  controllerEmail: _controllerEmail,
                  formKey: _formKey,
                  controllerMessage: _controllerMessage,
                ),
              )
            : UnauthSupportForm(
                controllerEmail: _controllerEmail,
                formKey: _formKey,
                controllerMessage: _controllerMessage,
              ),
      ),
    );
  }
}
