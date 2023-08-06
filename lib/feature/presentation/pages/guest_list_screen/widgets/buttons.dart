import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../resources/colors.dart';
import '../../../../resources/styles.dart';

class GreenButton extends StatelessWidget {
  final VoidCallback onPressed;
  const GreenButton({
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 84.w,
        height: 84.h,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: AppColors.greenColor,
        ),
        child: Center(
          child: SvgPicture.asset(
            'assets/icons/add.svg',
            width: 42.w,
            height: 42.h,
          ),
        ),
      ),
    );
  }
}

class CustomGreenButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const CustomGreenButton({
    super.key,
    required this.onPressed,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: 156.w,
        height: 50.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15.r)),
          color: AppColors.greenColor,
        ),
        child: Center(
          child: Text(
            text,
            style: AppStyles().greenButtonTextStyle,
          ),
        ),
      ),
    );
  }
}
