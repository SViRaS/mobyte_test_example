import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../const/colors.dart';
import '../const/images_name.dart';

class MenuList extends StatefulWidget {
  const MenuList({super.key});

  @override
  State<MenuList> createState() => _MenuListState();
}

class _MenuListState extends State<MenuList> {
  final List<MenuItem> menu = [
    MenuItem(imageName: AppImages.canape, title: 'Канапе'),
    MenuItem(imageName: AppImages.cheese, title: 'Сырная тарелка'),
    MenuItem(imageName: AppImages.meat, title: 'Шашлык на мангале'),
    MenuItem(imageName: AppImages.seafood, title: 'Морепродукты'),
    MenuItem(imageName: AppImages.fresh_fruits, title: 'Свежие фрукты'),
    MenuItem(imageName: AppImages.lemonades, title: 'Авторские лимонады'),
  ];
  bool _expanded = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: SizedBox(
            height: _expanded ? 560.h : 200.h,
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisExtent: 162.h,
                mainAxisSpacing: 12.h,
                crossAxisSpacing: 32.w,
                crossAxisCount: 2,
              ),
              itemCount: _expanded ? menu.length : 2,
              itemBuilder: (context, index) {
                final item = menu[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      item.imageName,
                      width: 140.w,
                      height: 140.h,
                      fit: BoxFit.fill,
                    ),
                    SizedBox(
                      height: 22.h,
                      child: FittedBox(
                        child: Text(
                          item.title,
                          style: TextStyle(
                              fontFamily: 'Jost',
                              fontWeight: FontWeight.w400,
                              fontSize: 14.sp,
                              color: AppColors.brownColor),
                        ),
                      ),
                    )
                  ],
                );
              },
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            setState(() {
              _expanded = !_expanded;
            });
          },
          child: Text(
            //25B2
            //25BC
            _expanded ? 'Свернуть ▲' : 'Развернуть ▼',
            style: TextStyle(
              fontFamily: 'Jost',
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
              decoration: TextDecoration.underline,
              color: AppColors.blackColor,
            ),
          ),
        ),
      ],
    );
  }
}

class MenuItem {
  final String imageName;
  final String title;

  MenuItem({required this.imageName, required this.title});
}
