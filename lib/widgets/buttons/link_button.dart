import 'package:flutter/material.dart';

class LinkButton extends StatelessWidget {
  const LinkButton({
    Key? key,
    required this.label,
    required this.onTap,
    this.disabled = false,
    this.padding = const EdgeInsets.all(16),
  }) : super(key: key);

  final Widget label;
  final void Function() onTap;
  final bool disabled;
  final EdgeInsets padding;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: disabled ? () {} : onTap,
      child: Container(
        padding: padding,
        width: MediaQuery.of(context).size.width,
        child: label,
      ),
    );
  }
}
