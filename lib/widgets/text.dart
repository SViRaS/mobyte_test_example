import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../const/colors.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
            'Приглашаю своих дорогих друзей отметить мой день\nрождения в замечательном месте с множеством\nразвлечений, вкусных блюд и хорошим\nнастроением!',
            style: TextStyle(
                fontFamily: 'Jost',
                fontWeight: FontWeight.w400,
                fontSize: 14.sp,
                height: 1.2.h,
                color: AppColors.semiBlackColor),
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
    return Text(
          text,
          style: TextStyle(
              fontFamily: 'YesevaOne',
              fontWeight: FontWeight.w400,
              fontSize: 24.sp,
              color: AppColors.blackColor),
        );
  }
}