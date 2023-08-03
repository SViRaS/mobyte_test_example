import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobyte_first_example/const/images_name.dart';
import 'package:mobyte_first_example/widgets/text_field_widget.dart';

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
        child: Center(child: Text(text, style: AppStyles().buttonTextStyle)),
      ),
    );
  }
}

class GreenButton extends StatelessWidget {
  const GreenButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showModalBottomSheet(
          isScrollControlled: true,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
          context: context,
          builder: (context) {
            return Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: SizedBox(
                height: 633.h,
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 12.h,
                      ),
                      SvgPicture.asset(
                        'assets/icons/indicator.svg',
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      const TextFieldWidget(
                        label: 'Имя',
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      const TextFieldWidget(
                        label: 'Фамилия',
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      TextFieldWidget(
                        label: 'Дата рождения',
                        icon: Icon(
                          Icons.calendar_today_outlined,
                          size: 24.r,
                        ),
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      const TextFieldWidget(
                        label: 'Телефон',
                      ),
                      SizedBox(
                        height: 8.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: MediaQuery.of(context).viewInsets.bottom),
                        child: const TextFieldWidget(
                          label: 'Профессия',
                        ),
                      ),
                      SizedBox(height: 24.h,),
                      CustomGreenButton()

                    ],
                  ),
                ),
              ),
            );
          },
        );
      },
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
  const CustomGreenButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 156.w,
      height: 50.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(15.r)),
        color: AppColors.greenColor,
        
      ),
      child: Center(
        child: Text('Записаться', style: AppStyles().greenButtonTextStyle,),
      ),
    );
  }
}