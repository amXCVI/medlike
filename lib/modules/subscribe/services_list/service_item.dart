import 'package:flutter/material.dart';
import 'package:medlike/data/models/docor_models/doctor_models.dart';
import 'package:medlike/widgets/subscribe_row_item/subscribe_row_item.dart';

class ServiceItem extends StatelessWidget {
  const ServiceItem({Key? key, required this.serviceItem}) : super(key: key);

  final NavigationItem serviceItem;

  @override
  Widget build(BuildContext context) {
    return SubscribeRowItem(title: serviceItem.name.toString());
  }
}
