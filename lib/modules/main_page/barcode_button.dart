import 'package:barcode/barcode.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:medlike/domain/app/cubit/user/user_cubit.dart';
import 'package:medlike/themes/colors.dart';
import 'package:medlike/utils/helpers/barcode_helper.dart';
import 'package:medlike/widgets/icon_with_bottom_label/icon_with_bottom_label.dart';
import 'package:medlike/widgets/user_profiles_list/user_profiles_list.dart';

class BarcodeButton extends StatelessWidget {
  const BarcodeButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () {
        showModalBottomSheet(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            context: context,
            builder: (context) => SafeArea(
                  child: Wrap(children: [
                    Container(
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(12),
                              topLeft: Radius.circular(12)),
                          color: Theme.of(context).backgroundColor,
                        ),
                        child: BlocBuilder<UserCubit, UserState>(
                          builder: (context, state) {
                            return Column(
                              children: [
                                const UserProfilesList(selectableItems: true),
                                const Divider(),
                                const SizedBox(height: 24),
                                SvgPicture.string(buildBarcode(
                                  Barcode.gs128(),
                                  state.selectedUserId as String,
                                  filename: '',
                                  width:
                                      MediaQuery.of(context).size.width * 0.8,
                                  height: 90,
                                )),
                                const SizedBox(height: 16),
                                Text(
                                  '${state.userProfiles?.firstWhere((element) => element.id == state.selectedUserId).firstName}, покажите данный штрих-код\nмедицинскому сотруднику',
                                  style: Theme.of(context)
                                      .textTheme
                                      .labelSmall
                                      ?.copyWith(
                                        color: AppColors.lightText,
                                      ),
                                  textAlign: TextAlign.center,
                                ),
                                const SizedBox(height: 16),
                              ],
                            );
                          },
                        )),
                  ]),
                ));
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
      child: IconWithBottomLabel(
        icon: SvgPicture.asset(
            'assets/icons/bottom_nav_bar/ic_barcode_outline.svg'),
        label: 'Штрихкод',
      ),
    );
  }
}
