import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobyte_first_example/const/colors.dart';
import 'package:mobyte_first_example/const/images_name.dart';
import 'package:mobyte_first_example/const/styles.dart';
import 'package:mobyte_first_example/widgets/buttons.dart';
import 'package:mobyte_first_example/widgets/guest_widget.dart';

class ListGuestScreen extends StatelessWidget {
  const ListGuestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: AppColors.whiteColor,
        leading: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/my_home_page');
            },
            child: SvgPicture.asset(
              'assets/icons/arrow_left.svg',
              fit: BoxFit.scaleDown,
            )),
        title: Text(
          'Список гостей',
          style: AppStyles().appBarStyle,
        ),
        centerTitle: true,
      ),
      floatingActionButton: GreenButton(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 24.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '2 гостя',
                  style: AppStyles().guestStyle
                ),
                Text(
                  'По имени ▼',
                  style:AppStyles().nameListStyle
                ),
              ],
            ),
            SizedBox(
              height: 24.h,
            ),
            const GuestWidget(
              avatar: AppImages.noneAvatar,
              name: 'Иван Иванов',
              years: '19 лет',
              activity: 'Студент',
            ),
            SizedBox(
              height: 16.h,
            ),
            const GuestWidget(
              avatar: AppImages.mariaAvatar,
              name: 'Марья Морская',
              years: '23 года',
              activity: 'Дизайнер',
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
