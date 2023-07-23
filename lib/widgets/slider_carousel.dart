import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../const/colors.dart';


class SliderCarousel extends StatefulWidget {
  const SliderCarousel({super.key});

  @override
  State<SliderCarousel> createState() => _SliderCarouselState();
}

class _SliderCarouselState extends State<SliderCarousel> {
  List imagesList = [
    {'id': 1, 'image_path': 'assets/images/picture_one.png'},
    {'id': 2, 'image_path': 'assets/images/picture_one.png'},
    {'id': 3, 'image_path': 'assets/images/picture_one.png'},
    {'id': 4, 'image_path': 'assets/images/picture_one.png'},
  ];

  final CarouselController carouselController = CarouselController();

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: () {},
          child: CarouselSlider(
            items: imagesList
                .map((item) => Image.asset(
                      item['image_path'],
                      fit: BoxFit.cover,
                      width: double.infinity,
                    ))
                .toList(),
                 options: CarouselOptions(
                  scrollPhysics: const BouncingScrollPhysics(),
                  aspectRatio: 2,
                  viewportFraction: 1,
                  onPageChanged: (index, reason) {
                    setState(() {
                      currentIndex = index;
                    });
                  },
                 ),
                 carouselController: carouselController,
          ),
        ),
        Positioned(
          top: 0,
          left: 0,
          right: 0,
          bottom: 10.h,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children:  imagesList.asMap().entries.map((entry) {
            return GestureDetector(
              onTap: () => carouselController.animateToPage(entry.key),
              child: Container(
                width: currentIndex == entry.key ? 30.w : 5.w,
                height: 5.h,
                margin: EdgeInsets.symmetric(horizontal: 3.h),
                decoration: BoxDecoration(
                  color: AppColors.whiteColor,
                  borderRadius: BorderRadius.all(Radius.circular(12.r))
                 
                ),
              ),
            );
           }).toList()
          ),
        ),
           Padding(
             padding: EdgeInsets.only(left: 16.w, top: 16.h),
             child: FittedBox(
               child: Text('25 августа\n2023', style: TextStyle(
                       fontFamily: 'Jost',
                       height: 1,
                       color: AppColors.whiteColor,
                       fontWeight: FontWeight.w700,
                       fontSize: 24.sp,
                     ),),
             ),
           ),
      ],
    );
  }
}
