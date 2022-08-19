import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/domain/app/cubit/user/user_cubit.dart';
import 'package:medlike/navigation/router.gr.dart';
import 'package:medlike/utils/user_secure_storage/user_secure_storage.dart';
import 'package:medlike/widgets/dividers/default_divider.dart';

class DeleteProfileDialog extends StatelessWidget {
  const DeleteProfileDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void confirmDeleteAccount(String selectedUserId) {
      context
          .read<UserCubit>()
          .deleteUserAccount(userId: selectedUserId)
          .then((value) {
        UserSecureStorage.cleanStorage();
        context.read<UserCubit>().signOut();
        context.router.replaceAll([StartPhoneNumberRoute(isDeletingProfile: true)]);
      });
    }

    return AlertDialog(
      contentPadding: const EdgeInsets.all(0),
      actionsAlignment: MainAxisAlignment.spaceAround,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.0))),
      title: const Text(
        'Вы уверены. что хотите удалить учетную запись?',
        textAlign: TextAlign.center,
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: const [
          SizedBox(height: 24),
          DefaultDivider(),
        ],
      ),
      actions: [
        InkWell(
          onTap: () => Navigator.pop(context),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
            child: Text(
              'Отмена'.toUpperCase(),
            ),
          ),
        ),
        BlocBuilder<UserCubit, UserState>(
          builder: (context, state) {
            return InkWell(
              onTap: () {
                confirmDeleteAccount(state.selectedUserId as String);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 20.0),
                child: Text(
                  'Удалить'.toUpperCase(),
                ),
              ),
            );
          },
        )
      ],
    );
  }
}
