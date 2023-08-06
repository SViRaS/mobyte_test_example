import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../resources/colors.dart';
import '../../../../resources/styles.dart';

class OrangeButton extends StatelessWidget {
  final String text;
  final String? nameRoute;
  const OrangeButton({
    super.key,
    required this.text,
    this.nameRoute,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, nameRoute!);
      },
      child: Container(
        width: 156.w,
        height: 50.h,
        decoration: BoxDecoration(
            color: AppColors.orangeColor,
            borderRadius: BorderRadius.all(Radius.circular(15.r))),
        child: Center(child: Text(text, style: AppStyles().buttonTextStyle)),
      ),
    );
  }
}


