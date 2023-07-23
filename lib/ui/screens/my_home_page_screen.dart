import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobyte_first_example/widgets/buttons.dart';
import 'package:mobyte_first_example/widgets/map.dart';
import 'package:mobyte_first_example/widgets/slider_carousel.dart';
import 'package:mobyte_first_example/widgets/text.dart';
import '../../widgets/menu_widget.dart';
import '../../widgets/url_text.dart';

class MyHomePageScreen extends StatefulWidget {
  const MyHomePageScreen({super.key});

  @override
  State<MyHomePageScreen> createState() => _MyHomePageScreenState();
}

class _MyHomePageScreenState extends State<MyHomePageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        children: [
          const SliderCarousel(),
          SizedBox(height: 16.h),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              children: [
                const TextWidget(),
                SizedBox(height: 16.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    OrangeButton(text: 'Список гостей'),
                    OrangeButton(text: 'Вишлист'),
                  ],
                ),
                SizedBox(height: 32.h),
                const CustomText(
                  text: 'Меню',
                ),

                const MenuList(),
                SizedBox(height: 32.h),
                 const CustomText(
                  text: 'Развлечения',
                ),
                const MapWidget(),
                SizedBox(height: 4.h,),
                const MapText(),
                SizedBox(
                  height: 12.h,
                ),
                const UrlLauncherText(),
                SizedBox(height: 10.h,),
                
              ],
            ),
          )
        ],
      ),
    ));
  }
}
