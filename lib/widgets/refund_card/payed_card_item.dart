import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PayedCardItem extends StatelessWidget {
  const PayedCardItem({super.key, required this.amount});

  final int amount;

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(
                "assets/icons/subscribe/ic_payment_card_active_outline.svg"),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Оплачено онлайн",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                const SizedBox(
                  height: 8,
                ),
                Text("Скачать чек на",
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall
                        ?.copyWith(fontSize: 12)),
                Text(amount.toString(),
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                        fontSize: 12,
                        color: Theme.of(context).colorScheme.primary)),
              ],
            ),
          ],
        ),
      );
}
