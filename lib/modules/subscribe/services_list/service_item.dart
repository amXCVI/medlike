import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:medlike/data/models/docor_models/doctor_models.dart';
import 'package:medlike/modules/subscribe/services_list/get_service_icon.dart';
import 'package:medlike/widgets/subscribe_row_item/subscribe_row_item.dart';

class ServiceItem extends StatelessWidget {
  const ServiceItem({Key? key, required this.serviceItem, required this.onTap})
      : super(key: key);

  final NavigationItem serviceItem;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return SubscribeRowItem(
      title: serviceItem.name.toString(),
      isFirstSymbolForIcon: false,
      customIcon: CircleAvatar(
        backgroundColor: Colors.white,
        child: SvgPicture.asset(getServiceIconById(serviceItem.id)),
      ),
      onTap: onTap,
    );
  }
}
