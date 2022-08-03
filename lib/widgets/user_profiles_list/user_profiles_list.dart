import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/domain/app/cubit/user/user_cubit.dart';
import 'package:medlike/widgets/user_profiles_list/user_profile_item.dart';
import 'package:medlike/widgets/user_profiles_list/user_profile_skeleton.dart';

class UserProfilesList extends StatelessWidget {
  const UserProfilesList({Key? key, this.selectableItems = false})
      : super(key: key);

  /// Если нужна возможность переключать выбранного пользователя или
  /// отображать текущего выбранного пользователя
  final bool selectableItems;

  @override
  Widget build(BuildContext context) {
    context.read<UserCubit>().getUserProfiles(false);

    void handleTapOnUserProfile(String userId) {
      context.read<UserCubit>().setSelectedUserId(userId);
    }

    void handleLoadAvatar(String userId) async {
      if (selectableItems) {
        return;
      }
      try {
        FilePickerResult? filePickerResult =
            (await FilePicker.platform.pickFiles(
          type: FileType.image,
          allowMultiple: false,
          onFileLoading: (FilePickerStatus status) => {},
        ));

        context.read<UserCubit>().uploadUserAvatar(
              file: filePickerResult?.files.first,
              userId: userId,
              fileName: filePickerResult!.files.first.name,
            );
      } catch (e) {
        rethrow;
      }
    }

    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
            topRight: Radius.circular(12), topLeft: Radius.circular(12)),
        color: Theme.of(context).backgroundColor,
      ),
      height: 76.0,
      width: MediaQuery.of(context).size.width,
      child: BlocBuilder<UserCubit, UserState>(
        builder: (context, state) {
          switch (state.getUserProfileStatus) {
            case GetUserProfilesStatusesList.failure:
              return const Text('');
            case GetUserProfilesStatusesList.success:
              return ListView(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  children: state.userProfiles!
                      .map((item) => GestureDetector(
                            onTap: () {
                              selectableItems
                                  ? handleTapOnUserProfile(item.id)
                                  : {};
                            },
                            child: UserProfileItem(
                              userProfileDate: item,
                              isSelectedItem: selectableItems &&
                                      state.selectedUserId == item.id
                                  ? true
                                  : false,
                              onLoadAvatar: () {
                                handleLoadAvatar(
                                    state.selectedUserId as String);
                              },
                            ),
                          ))
                      .toList());
            default:
              return const Center(child: UserProfileSkeleton());
          }
        },
      ),
    );
  }
}
