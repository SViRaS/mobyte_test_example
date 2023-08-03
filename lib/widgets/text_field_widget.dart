import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobyte_first_example/const/styles.dart';

import '../const/colors.dart';

class TextFieldWidget extends StatelessWidget {
  final String label;
  final Icon? icon;
  const TextFieldWidget({
    super.key,
    required this.label,
     this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 58.h,
      child: TextFormField(  
        style: AppStyles().textTextFieldStyle,
        decoration: InputDecoration(
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            label: Text(label),
            fillColor: AppColors.textFieldColor,
            suffixIcon: icon,
            iconColor: AppColors.brownColor,
            suffixIconColor: AppColors.brownColor,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(4.r)),
              borderSide: const BorderSide(color: Colors.transparent, width: 0),
            ),
            focusColor: AppColors.brownColor,
            labelStyle: AppStyles().labelTextFieldStyle,
            
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.transparent, width: 0)
            ),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(4.r)),
                borderSide:
                    const BorderSide(color: Colors.transparent, width: 0))),
      ),
    );
  }
}
