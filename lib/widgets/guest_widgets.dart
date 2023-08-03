import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobyte_first_example/const/colors.dart';
import 'package:mobyte_first_example/const/styles.dart';

class GuestWidget extends StatelessWidget {
  // final String? avatar;
  final String name;
  final String years;
  final String activity;
  final String surname;
  final String phone;
  const GuestWidget({
    super.key,
    //  this.avatar,
    required this.name,
    required this.years,
    required this.activity,
    required this.surname,
    required this.phone,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(bottom: 8.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // SizedBox(
          //   height: 64.r,
          //   width: 64.r,
          //   child: Image.asset(avatar!, fit: BoxFit.fill,)),
          SizedBox(
            width: 12.w,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(name, style: AppStyles().guestTileName),
                  SizedBox(
                    width: 2.w,
                  ),
                  Text(surname, style: AppStyles().guestTileName),
                ],
              ),
              Text(years, style: AppStyles().guestTileYears),
              Text(activity, style: AppStyles().guestTileJob),
              Text(phone, style: AppStyles().guestTilePhone),
            ],
          ),
        ],
      ),
    );
  }
}
