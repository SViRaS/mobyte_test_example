import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobyte_first_example/feature/presentation/pages/my_home_page_screen/widgets/buttons.dart';
import 'package:mobyte_first_example/feature/presentation/pages/my_home_page_screen/widgets/map.dart';
import 'package:mobyte_first_example/feature/presentation/pages/my_home_page_screen/widgets/slider_carousel.dart';
import 'package:mobyte_first_example/feature/presentation/pages/my_home_page_screen/widgets/text.dart';
import 'widgets/entertainments_widget.dart';
import 'widgets/menu_widget.dart';
import 'widgets/url_text.dart';

class MyHomePageScreen extends StatefulWidget {
  const MyHomePageScreen({super.key});

  @override
  State<MyHomePageScreen> createState() => _MyHomePageScreenState();
}

class _MyHomePageScreenState extends State<MyHomePageScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: SingleChildScrollView(
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
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      OrangeButton(
                        text: 'Список гостей',
                        nameRoute: '/guest_list_page',
                      ),
                      OrangeButton(
                        text: 'Вишлист',
                        nameRoute: '/wish_list_page',
                      ),
                    ],
                  ),
                  SizedBox(height: 32.h),
                  const CustomText(
                    text: 'Меню',
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  const MenuWidget(),
                  SizedBox(height: 24.h),
                  const CustomText(
                    text: 'Развлечения',
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  const EntertainmentsWidget(),
                  SizedBox(
                    height: 16.h,
                  ),
                  const CustomText(
                    text: 'Место',
                  ),
                  SizedBox(
                    height: 8.h,
                  ),
                  const MapWidget(),
                  SizedBox(
                    height: 4.h,
                  ),
                  const MapText(),
                  SizedBox(
                    height: 12.h,
                  ),
                  const UrlLauncherText(),
                  SizedBox(
                    height: 10.h,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
