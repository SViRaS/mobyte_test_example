import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../const/colors.dart';

class MenuPictures extends StatefulWidget {
  const MenuPictures({super.key});

  @override
  State<MenuPictures> createState() => _MenuListState();
}

class _MenuListState extends State<MenuPictures> {
  final List<MenuItem> menu = [
    MenuItem(imageName: 'assets/images/meat.png', title: 'Канапе'),
    MenuItem(imageName: 'assets/images/meat.png', title: 'Сырная тарелка'),
    MenuItem(imageName: 'assets/images/meat.png', title: 'Шашлык на мангале'),
    MenuItem(imageName: 'assets/images/meat.png', title: 'Морепродукты'),
    MenuItem(imageName: 'assets/images/meat.png', title: 'Свежие фрукты'),
    MenuItem(imageName: 'assets/images/meat.png', title: 'Авторские лимонады'),
  ];
  bool _expanded = true;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: SizedBox(
            height: _expanded ? 510.h : 160.h,
            child: GridView.builder(
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisExtent: 161.h,
                mainAxisSpacing: 16.h,
                crossAxisSpacing: 32.w,
                crossAxisCount: 2,
                // childAspectRatio: 0.5,
              ),
              itemCount: _expanded ? menu.length : 2,
              itemBuilder: (context, index) {
                final item = menu[index];
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(25.r),
                        bottomLeft: Radius.circular(25.r),
                      ),
                      child: Image.asset(
                        item.imageName,
                        width: 140.w,
                        height: 140.w,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text(
                      item.title,
                      maxLines: 1,
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
            _expanded ? 'Свернуть \u{25B4}' : 'Развернуть \u{25BE}',
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