import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobyte_first_example/const/images_name.dart';
import 'package:mobyte_first_example/models/entertainments_item.dart';

import '../const/colors.dart';

class EntertainmentsWidget extends StatefulWidget {
  const EntertainmentsWidget({super.key});

  @override
  State<EntertainmentsWidget> createState() => EentertainmentsWidgetState();
}

class EentertainmentsWidgetState extends State<EntertainmentsWidget> {
  final List<EntertainmentsItem> entertainmentsWidgetList = [
    EntertainmentsItem(
        title: 'Настольные игры',
        subTitle: 'Мафия, уно, домино, экивоки и другие',
        imageName: AppImages.dice),
    EntertainmentsItem(
        title: 'Бассейн',
        subTitle: 'Два бассейна с подогревом',
        imageName: AppImages.swimming_pool),
   EntertainmentsItem(
        title: 'Настольные игры',
        subTitle: 'Мафия, уно, домино, экивоки и другие',
        imageName: AppImages.dice),
    EntertainmentsItem(
        title: 'Бассейн',
        subTitle: 'Два бассейна с подогревом',
        imageName: AppImages.swimming_pool),
  ];

  bool _active = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
            height: _active ? 280.h : 140.h,
            child: GridView.builder(
              itemCount: entertainmentsWidgetList.length,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  mainAxisExtent: 60.h,
                  mainAxisSpacing: 8.h,
                  crossAxisCount: 1),
              itemBuilder: (context, index) {
                final item = entertainmentsWidgetList[index];
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image.asset(
                              item.imageName,
                              width: 42.w,
                              height: 42.h,
                              fit: BoxFit.fill,
                            ),
                            SizedBox(
                              width: 8.w,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 20.h,
                                  child: FittedBox(
                                    child: Text(
                                      item.title,
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          fontFamily: 'Jost',
                                          fontWeight: FontWeight.w500,
                                          color: AppColors.semiBlackColor),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: 20.h,
                                  child: FittedBox(
                                    child: Text(
                                      item.subTitle,
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          fontFamily: 'Jost',
                                          fontWeight: FontWeight.w400,
                                          color: AppColors.brownColor),
                                      maxLines: 1,
                                      softWrap: false,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SvgPicture.asset(
                          'assets/icons/arrow_right.svg',
                          width: 16.w,
                          height: 16.h,
                        ),
                      ],
                    ),
                  ],
                );
              },
            )),
        TextButton(
          child: Text(
            _active ? 'Свернуть ▲' : 'Развернуть ▼',
            style: TextStyle(
              decoration: TextDecoration.underline,
              fontFamily: 'Jost',
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.blackColor,
            ),
          ),
          onPressed: () {
            setState(() {
              _active = !_active;
            });
          },
        ),
      ],
    );
  }
}
