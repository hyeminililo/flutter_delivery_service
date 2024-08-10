//게시물에 연결되는 카드같은 것을 모아놓음
import 'package:flutter/material.dart';
import 'package:flutter_delivery_app/common/const/colors.dart';

class RestaurantCard extends StatelessWidget {
  final Widget image;
  final String name;
  // 레스토랑 태그
  final List<String> tags;
  final int ratingsCount;
  final int deliveryTime;
  final int deliveryFee;
  final double ratings;

  const RestaurantCard(
      {required this.image,
      required this.name,
      required this.tags,
      required this.ratingsCount,
      required this.deliveryTime,
      required this.deliveryFee,
      required this.ratings,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 테두리를 깎을 수 있는 위젯 ( child안에 있는 것을 깎을 수 있음 = 이미지)
        ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: image,
        ),
        const SizedBox(height: 16.0),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              name,
              style:
                  const TextStyle(fontSize: 20.0, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 16.0),
            Text(
              // tags에 있는 리스트들을 join이나 toString으로 표현할 수 있음
              tags.join('·'),
              style: const TextStyle(color: BODY_TEXT_COLOR, fontSize: 14.0),
            ),
            const SizedBox(height: 8.0),
            Row(
              children: [
                _IconText(
                  icon: Icons.star,
                  label: ratings.toString(),
                ),
                renderDot(),
                _IconText(
                  icon: Icons.receipt,
                  label: ratingsCount.toString(),
                ),
                renderDot(),
                _IconText(
                  icon: Icons.timelapse_outlined,
                  label: '$deliveryTime 분',
                ),
                renderDot(),
                _IconText(
                  icon: Icons.monetization_on,
                  label: deliveryFee == 0 ? '무료' : deliveryFee.toString(),
                ),
              ],
            )
          ],
        )
      ],
    );
  }

  Widget renderDot() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 4.0),
      child: Text(
        'dd',
        style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.w500),
      ),
    );
  }
}

class _IconText extends StatelessWidget {
  final IconData icon;
  final String label;

  const _IconText({required this.icon, required this.label, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(
          icon,
          color: PRIMARY_COLOR,
          size: 14.0,
        ),
        const SizedBox(height: 8.0),
        Text(
          label,
          style: const TextStyle(fontSize: 12.0, fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}
