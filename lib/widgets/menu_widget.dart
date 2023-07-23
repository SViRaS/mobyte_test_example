import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../const/colors.dart';
import '../const/images_name.dart';
import '../models/menu_item.dart';

class MenuWidget extends StatefulWidget {
  const MenuWidget({super.key});

  @override
  State<MenuWidget> createState() => _MenuListState();
}

class _MenuListState extends State<MenuWidget> {
  final List<MenuItem> menuWidgetList = [
    MenuItem(imageName: AppImages.canape, title: 'Канапе'),
    MenuItem(imageName: AppImages.cheese, title: 'Сырная тарелка'),
    MenuItem(imageName: AppImages.meat, title: 'Шашлык на мангале'),
    MenuItem(imageName: AppImages.seafood, title: 'Морепродукты'),
    MenuItem(imageName: AppImages.fresh_fruits, title: 'Свежие фрукты'),
    MenuItem(imageName: AppImages.lemonades, title: 'Авторские лимонады'),
  ];
  bool _active = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: SizedBox(
            height: _active ? 530.h : 200.h,
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisExtent: 162.h,
                mainAxisSpacing: 12.h,
                crossAxisSpacing: 32.w,
                crossAxisCount: 2,
              ),
              itemCount: _active ? menuWidgetList.length : 2,
              itemBuilder: (context, index) {
                final item = menuWidgetList[index];
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
