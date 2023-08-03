// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobyte_first_example/const/colors.dart';
import 'package:mobyte_first_example/const/images_name.dart';
import 'package:mobyte_first_example/const/styles.dart';
import 'package:mobyte_first_example/widgets/buttons.dart';
import 'package:mobyte_first_example/widgets/guest_widgets.dart';

import '../../widgets/bottom_sheet_body.dart';

class ListGuestScreen extends StatefulWidget {
  const ListGuestScreen({super.key});

  @override
  State<ListGuestScreen> createState() => _ListGuestScreenState();
}

class _ListGuestScreenState extends State<ListGuestScreen> {
  final _controller_name = TextEditingController();
  final _controller_surname = TextEditingController();
  final _controller_date_birthday = TextEditingController();
  final _controller_phone = TextEditingController();
  final _controller_job = TextEditingController();

  List guestList = [
    ['Иван', 'Иванов', '19 лет', 'Студент', ''],
    ['Марья', 'Морская', '23 года', 'Дизайнер', ''],
  ];

  void saveNewGuest() {
    setState(() {
      guestList.add([
        _controller_name.text,
        _controller_surname.text,
        _controller_date_birthday.text,
        _controller_phone.text,
        _controller_job.text,
      ]);
      _controller_name.clear();
      _controller_surname.clear();
      _controller_date_birthday.clear();
      _controller_phone.clear();
      _controller_job.clear();
    });
    Navigator.of(context).pop();
  }

  void createNewGuest() {
    showModalBottomSheet(
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        context: context,
        builder: (context) {
          return BottomSheetBody(
            controller_name: _controller_name,
            controller_surname: _controller_surname,
            controller_date_birthday: _controller_date_birthday,
            controller_phone: _controller_phone,
            controller_job: _controller_job,
            onSave: saveNewGuest,
          );
        });
  }

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
      floatingActionButton: GreenButton(
        onPressed: createNewGuest,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.w),
        child: Column(
          children: [
            SizedBox(
              height: 24.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('2 гостя', style: AppStyles().guestStyle),
                Text('По имени ▼', style: AppStyles().nameListStyle),
              ],
            ),
            SizedBox(
              height: 24.h,
            ),
            ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: guestList.length,
                itemBuilder: (context, index) {
                  return GuestWidget(
                    name: guestList[index][0],
                    surname: guestList[index][1],
                    years: guestList[index][2],
                    activity: guestList[index][3],
                    phone: guestList[index][4],
                  );
                })
          ],
        ),
      ),
    );
  }
}
