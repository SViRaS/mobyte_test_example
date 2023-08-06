import 'package:flutter/material.dart';
import 'package:mobyte_first_example/const/styles.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Приглашаю своих дорогих друзей отметить мой день\nрождения в замечательном месте с множеством\nразвлечений, вкусных блюд и хорошим\nнастроением!',
        style: AppStyles().titleStyle,
        softWrap: false,
        maxLines: 4,
      ),
    );
  }
}

class CustomText extends StatelessWidget {
  final String text;
  const CustomText({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Text(text, style: AppStyles().mainTextStyle);
  }
}

class MapText extends StatelessWidget {
  const MapText({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Центральная ул., 84, хутор Седых',
          style: AppStyles().placeStyle),
    );
  }
}
