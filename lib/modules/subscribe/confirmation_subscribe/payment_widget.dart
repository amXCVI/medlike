import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:medlike/constants/app_constants.dart';
import 'package:medlike/domain/app/cubit/subscribe/subscribe_cubit.dart';
import 'package:medlike/modules/subscribe/confirmation_subscribe/appointment_info_item.dart';
import 'package:medlike/themes/colors.dart';

class PaymentWidget extends StatelessWidget {
  const PaymentWidget({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    void _handleSelectPayType(String payType) {
      context.read<SubscribeCubit>().setPayType(payType: payType);
    }

    return BlocBuilder<SubscribeCubit, SubscribeState>(
      builder: (context, state) {

        return state.appointmentInfoData != null &&
                state.appointmentInfoData!.payType.toLowerCase() !=
                    AppConstants.noPayedPayType
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: AppointmentInfoSubtitle(title: 'Способ оплаты'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 8.0, right: 8.0, bottom: 16.0),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: InkWell(
                            onTap: () {
                              _handleSelectPayType(AppConstants.noPayedPayType);
                            },
                            child: PaymentItem(
                              isSelected: state.selectedPayType ==
                                  AppConstants.noPayedPayType,
                              title: 'Клиника',
                              subtitle: 'Регистратура',
                              icon: SvgPicture.asset(
                                  'assets/icons/subscribe/ic_payment_clinic_normal_outline.svg'),
                              activeIcon: SvgPicture.asset(
                                  'assets/icons/subscribe/ic_payment_clinic_active_outline.svg'),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: InkWell(
                            onTap: () {
                              _handleSelectPayType(AppConstants.cardPayType);
                            },
                            child: PaymentItem(
                              isSelected: state.selectedPayType ==
                                  AppConstants.cardPayType,
                              title: 'Карта',
                              price: state.appointmentInfoData!.price,
                              icon: SvgPicture.asset(
                                  'assets/icons/subscribe/ic_payment_card_normal_outline.svg'),
                              activeIcon: SvgPicture.asset(
                                  'assets/icons/subscribe/ic_payment_card_active_outline.svg'),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              )
            : const SizedBox();
      },
    );
  }
}

class PaymentItem extends StatelessWidget {
  const PaymentItem(
      {Key? key,
      required this.isSelected,
      required this.title,
      this.subtitle,
      this.price,
      required this.icon,
      required this.activeIcon})
      : super(key: key);

  final bool isSelected;
  final String title;
  final String? subtitle;
  final int? price;
  final Widget icon;
  final Widget activeIcon;

  @override
  Widget build(BuildContext context) {
    var rublesFormat =
        NumberFormat.currency(locale: "ru_RU", symbol: 'P', decimalDigits: 0);

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Container(
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: Theme.of(context).backgroundColor,
            border: Border.all(
                color: isSelected
                    ? Theme.of(context).primaryColor
                    : Theme.of(context).backgroundColor),
            borderRadius: const BorderRadius.all(Radius.circular(12)),
            boxShadow: const [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 20,
                offset: Offset(0, 8),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  isSelected ? activeIcon : icon,
                  const SizedBox(width: 10),
                  Text(
                    title,
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(fontWeight: FontWeight.w500),
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
              const SizedBox(height: 4),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(width: 34),
                  Flexible(
                    child: Text(
                      subtitle ?? '',
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(color: AppColors.lightText),
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                    ),
                  ),
                  Text(
                    price != null ? rublesFormat.format(price! / 100) : '',
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall
                        ?.copyWith(color: AppColors.lightText),
                  )
                ],
              )
            ],
          )),
    );
  }
}
