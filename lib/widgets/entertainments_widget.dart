import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobyte_first_example/const/images_name.dart';
import 'package:mobyte_first_example/const/styles.dart';
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
        ListView.builder(
          itemCount: _active ? entertainmentsWidgetList.length : 2,
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (context, index) {
            final item = entertainmentsWidgetList[index];
            return ListTile(
              contentPadding: const EdgeInsets.all(0),
              horizontalTitleGap: 12.w,
              
              leading: SizedBox(
                width: 42.r,
                height: 42.r,
                child: Image.asset(item.imageName, fit: BoxFit.fill,),
              ),
              title: Text(
                item.title,
                style: AppStyles().gameCategoryStyle,
              ),
              
              subtitle: Text(
                item.subTitle,
                style: AppStyles().gameStyle,
                maxLines: 1,
                softWrap: false,
              ),
              trailing: SvgPicture.asset(
                'assets/icons/arrow_right.svg',
                width: 16.w,
                height: 16.h,
              ),
            );
          },
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
