import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:mobyte_first_example/feature/resources/styles.dart';

import '../../../../resources/colors.dart';



class WishWidget extends StatefulWidget {
  final String giftName;
  final String urlName;
  // final Function(bool?)? onChanged;
  final VoidCallback onChanged;
  // final bool onTaskCompleted;
  final Function(BuildContext)? onDelete;
  const WishWidget({
    required this.giftName,
    required this.urlName,
    required this.onChanged,
    // required this.onTaskCompleted,
    required this.onDelete,
    super.key});

  @override
  State<WishWidget> createState() => _WishWidgetState();
}

class _WishWidgetState extends State<WishWidget> {
   bool taskCompleted = false;
  @override
  Widget build(BuildContext context) {
    
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Slidable(
         endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: widget.onDelete,
              icon: Icons.delete,
              backgroundColor: Colors.redAccent,
              )
          ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
         Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text(widget.giftName, style: AppStyles().nameGiftStyle,),
          Text(widget.urlName, style: AppStyles().urlGiftStyle),
          
         ],),
        //  Checkbox(value: onTaskCompleted, onChanged: onChanged,),
         GestureDetector(
          onTap: () {
          setState(() {
           taskCompleted =! taskCompleted;
          });
          },
           child: Container(
            width: 20.w,
            height: 20.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: taskCompleted ? AppColors.brownColor : AppColors.greyColor
            ),
           ),
         )
          
        ],),
      ),
    );
  }
}