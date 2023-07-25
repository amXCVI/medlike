import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/domain/app/cubit/user/user_cubit.dart';
import 'package:medlike/navigation/router.dart';
import 'package:medlike/themes/colors.dart';
import 'package:medlike/utils/user_secure_storage/user_secure_storage.dart';
import 'package:medlike/widgets/circular_loader/circular_loader.dart';
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
        context.read<UserCubit>().forceLogout();
        context.router
            .replaceAll([StartPhoneNumberRoute(isDeletingProfile: true)]);
      });
    }

    return AlertDialog(
      contentPadding: const EdgeInsets.all(0),
      actionsAlignment: MainAxisAlignment.spaceAround,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(12.0))),
      title: Text(
        'Вы уверены. что хотите удалить учетную запись?',
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.titleLarge,
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
              style: Theme.of(context)
                  .textTheme
                  .titleSmall
                  ?.copyWith(color: AppColors.mainText),
            ),
          ),
        ),
        BlocBuilder<UserCubit, UserState>(
          builder: (context, state) {
            return InkWell(
              onTap: () {
                if (state.deletingUserAccountStatus ==
                    DeletingUserAccountStatuses.loading) {
                  return;
                }
                confirmDeleteAccount(state.selectedUserId as String);
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 20.0),
                child: state.deletingUserAccountStatus ==
                        DeletingUserAccountStatuses.loading
                    ? const CircularLoader(radius: 12)
                    : Text(
                        'Удалить'.toUpperCase(),
                        style: Theme.of(context)
                            .textTheme
                            .titleSmall
                            ?.copyWith(color: AppColors.mainError),
                      ),
              ),
            );
          },
        )
      ],
    );
  }
}
