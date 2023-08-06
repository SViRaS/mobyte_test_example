import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../guest_list_screen/widgets/buttons.dart';
import '../../guest_list_screen/widgets/text_field_widget.dart';

class BottomSheetGiftBody extends StatelessWidget {
  final controller_giftName;
  final controller_urlName;
  final VoidCallback onSave;
  const BottomSheetGiftBody({
      required this.controller_giftName,
      required this.controller_urlName,
      required this.onSave,
      super.key,
      });

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
                label: 'Название',
                controller: controller_giftName,
              ),
              SizedBox(
                height: 8.h,
              ),
              TextFieldWidget(
                label: 'Ссылка',
                controller: controller_urlName,
              ),
              SizedBox(
                height: 24.h,
              ),
              CustomGreenButton(
                onPressed: onSave,
                text: 'Добавить подарок',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
