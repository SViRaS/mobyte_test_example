import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobyte_first_example/feature/resources/styles.dart';
import '../../../../resources/images_name.dart';
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
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: _active ? menuWidgetList.length : 2,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisSpacing: 16.h,
              crossAxisSpacing: 32.w,
              childAspectRatio: 140 / 154,
              crossAxisCount: 2,
            ),
            itemBuilder: (context, index) {
              var item = menuWidgetList[index];
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 140.h,
                    width: 140.w,
                    child: Image.asset(
                      item.imageName,
                      fit: BoxFit.fill,
                    ),
                  ),
                  Text(
                    item.title,
                    style: AppStyles().mealStyle,
                  )
                ],
              );
            },
          ),
        ),
        TextButton(
          child: Text(_active ? 'Свернуть ▲' : 'Развернуть ▼',
              style: AppStyles().underlineText),
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
