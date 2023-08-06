import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobyte_first_example/widgets/buttons.dart';
import 'package:mobyte_first_example/widgets/text_field_widget.dart';

class BottomSheetBody extends StatelessWidget {
  final controller_name;
  final controller_surname;
  final controller_date_birthday;
  final controller_phone;
  final controller_job;
  final VoidCallback onSave;
  const BottomSheetBody({
      required this.controller_name,
      required this.controller_surname,
      required this.controller_date_birthday,
      required this.controller_phone,
      required this.controller_job,
      required this.onSave,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
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
              TextFieldWidget(
                label: 'Имя',
                controller: controller_name,
              ),
              SizedBox(
                height: 8.h,
              ),
              TextFieldWidget(
                label: 'Фамилия',
                controller: controller_surname,
              ),
              SizedBox(
                height: 8.h,
              ),
              TextFieldWidget(
                label: 'Дата рождения',
                controller: controller_date_birthday,
                icon: Icon(
                  Icons.calendar_today_outlined,
                  size: 24.r,
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              TextFieldWidget(
                label: 'Телефон',
                controller: controller_phone,
              ),
              SizedBox(
                height: 8.h,
              ),
              TextFieldWidget(
                label: 'Профессия',
                controller: controller_job,
              ),
              SizedBox(
                height: 24.h,
              ),
               CustomGreenButton(onPressed: onSave,)
            ],
          ),
        ),
      ),
    );
  }
}
