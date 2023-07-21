import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobyte_first_example/widgets/buttons.dart';
import 'package:mobyte_first_example/widgets/map.dart';
import 'package:mobyte_first_example/widgets/menu_pictures.dart';
import 'package:mobyte_first_example/widgets/slider_carousel.dart';
import 'package:mobyte_first_example/widgets/text.dart';

import '../../const/colors.dart';
import '../../widgets/card.dart';
import '../../widgets/tile_widget.dart';
import '../../widgets/url_text.dart';

class MyHomePageScreen extends StatefulWidget {
  const MyHomePageScreen({super.key});

  @override
  State<MyHomePageScreen> createState() => _MyHomePageScreenState();
}

class _MyHomePageScreenState extends State<MyHomePageScreen> {
  bool _active = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SliderCarousel(),
          SizedBox(height: 16.h),
          const TextWidget(),
          SizedBox(height: 16.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                OrangeButton(text: 'Список гостей'),
                OrangeButton(text: 'Вишлист'),
              ],
            ),
          ),
          SizedBox(height: 32.h),
          const CustomText(
            text: 'Место',
          ),
          SizedBox(
            height: 8.h,
          ),
          const MapWidget(),
          SizedBox(height: 12.h,),
          const UrlLauncherText()
        ],
      ),
    ));
  }
}

