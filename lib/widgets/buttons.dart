import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../const/colors.dart';
import '../const/styles.dart';

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
        child: Center(
            child: Text(
          text,
          style: AppStyles().buttonTextStyle
        )),
      ),
    );
  }
}

class GreenButton extends StatelessWidget {
  const GreenButton({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
                width: 84.w,
                height: 84.h,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.greenColor,
                ),
                child: Center(
                  child: SvgPicture.asset('assets/icons/add.svg', width: 42.w, height: 42.h,),),
              );
  }
}