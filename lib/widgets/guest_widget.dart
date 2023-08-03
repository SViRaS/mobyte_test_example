import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobyte_first_example/const/colors.dart';
import 'package:mobyte_first_example/const/styles.dart';

class GuestWidget extends StatelessWidget {
  final String avatar;
  final String name;
  final String years;
  final String activity;

  const GuestWidget({
      super.key,
      required this.avatar,
      required this.name,
      required this.years,
      required this.activity,
      });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 64.r,
          width: 64.r,
          child: Image.asset(avatar, fit: BoxFit.fill,)),
          SizedBox(width: 12.w,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text(name, style: AppStyles().guestTileName),
            Text(years, style: AppStyles().guestTileYears),
            Text(activity, style: AppStyles().guestTileJob),
            
          ],),
      ],
    );
  }
}
