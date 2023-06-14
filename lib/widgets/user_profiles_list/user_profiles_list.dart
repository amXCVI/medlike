import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:medlike/data/models/user_models/user_models.dart';
import 'package:medlike/domain/app/cubit/user/user_cubit.dart';
import 'package:medlike/widgets/user_profiles_list/user_profile_item.dart';
import 'package:medlike/widgets/user_profiles_list/user_profile_skeleton.dart';

class UserProfilesList extends StatefulWidget {
  const UserProfilesList({Key? key, this.selectableItems = false})
      : super(key: key);

  /// Если нужна возможность переключать выбранного пользователя или
  /// отображать текущего выбранного пользователя
  final bool selectableItems;

  @override
  State<UserProfilesList> createState() => _UserProfilesListState();
}

class _UserProfilesListState extends State<UserProfilesList> {
  @override
  void initState() {
    context.read<UserCubit>().getUserProfiles(false);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    void handleTapOnUserProfile(String userId) {
      context.read<UserCubit>().setSelectedUserId(userId);
    }

    void handleLoadAvatar(String userId) async {
      if (widget.selectableItems) {
        return;
      }
      try {
        List<PlatformFile>? _paths;

        _paths = (await FilePicker.platform.pickFiles(
          type: FileType.custom,
          allowMultiple: false,
          allowedExtensions: ['jpg', 'jpeg', 'png'],
        ))
            ?.files;

        context.read<UserCubit>().uploadUserAvatar(
              file: SupportAttachedFileModel(
                fileBytes: _paths!.first.bytes!,
                fileName: _paths.first.name,
                size: _paths.first.size,
                fileType: _paths.first.extension!,
              ),
              userId: userId,
              fileName: _paths.first.name,
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
                      .map((item) => InkWell(
                            onTap: () {
                              widget.selectableItems
                                  ? handleTapOnUserProfile(item.id)
                                  : {};
                            },
                            child: UserProfileItem(
                              userProfileDate: item,
                              isSelectedItem: widget.selectableItems
                                  ? state.selectedUserId == null ||
                                          state.selectedUserId!.isEmpty
                                      ? state.userProfiles![0].id == item.id
                                      : state.userProfiles
                                                  ?.firstWhere((element) =>
                                                      element.id ==
                                                      state.selectedUserId)
                                                  .id as String ==
                                              item.id
                                          ? true
                                          : false
                                  : false,
                              onLoadAvatar: () {
                                handleLoadAvatar(item.id);
                              },
                              isLoadingAvatar: item.avatar == 'loading',
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
