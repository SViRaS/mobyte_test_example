// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive/hive.dart';
import 'package:mobyte_first_example/feature/data/database_wish_list.dart';
import 'package:mobyte_first_example/feature/presentation/pages/guest_list_screen/widgets/buttons.dart';
import 'package:mobyte_first_example/feature/presentation/pages/wish_list_screen/widgets/bottom_sheet_gift_body.dart';
import 'package:mobyte_first_example/feature/presentation/pages/wish_list_screen/widgets/wish_widget.dart';
import 'package:mobyte_first_example/feature/resources/colors.dart';
import 'package:mobyte_first_example/feature/resources/styles.dart';

class WishListScreen extends StatefulWidget {
  const WishListScreen({super.key});

  @override
  State<WishListScreen> createState() => _ListGuestScreenState();
}

class _ListGuestScreenState extends State<WishListScreen> {
  final _myBox = Hive.box('mybox');

  TodoDataBaseWishList db = TodoDataBaseWishList();

  @override
  void initState() {
    if (_myBox.get('WISHKEY') == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }

    super.initState();
  }

  final _controller_giftName = TextEditingController();
  final _controller_urlName = TextEditingController();

  void saveNewGift() {
    setState(() {
      db.wishList.add([
        _controller_giftName.text,
        _controller_urlName.text,
      ]);
      _controller_giftName.clear();
      _controller_urlName.clear();
    });
    Navigator.of(context).pop();
    db.updateDataBase();
  }

  void createNewGift() {
    showModalBottomSheet(
        isScrollControlled: true,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        context: context,
        builder: (context) {
          return BottomSheetGiftBody(
            controller_giftName: _controller_giftName,
            controller_urlName: _controller_urlName,
            onSave: saveNewGift,
          );
        });
  }

  void onDeleteGift(int index) {
    setState(() {
      db.wishList.removeAt(index);
    });
    db.updateDataBase();
  }
  
  void checkBoxChanged(bool? value, int index) {
    setState(() {
       db.wishList[index][2] = !db.wishList[index][2]; 
    });
    db.updateDataBase();
  }
  
  void changeColorBox(int index) {
    setState(() {
      db.wishList[index][2] = !db.wishList[index][2];
    });
    db.updateDataBase();
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
          'Вишлист',
          style: AppStyles().appBarStyle,
        ),
        centerTitle: true,
      ),
      floatingActionButton: GreenButton(
        onPressed: createNewGift,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.w),
          child: Column(
            children: [
              SizedBox(
                height: 12.h,
              ),
              ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: db.wishList.length,
                  itemBuilder: (context, index) {
                    return WishWidget(
                      giftName: db.wishList[index][0],
                      urlName: db.wishList[index][1],
                      onChanged:() => changeColorBox(index),
                      onDelete: (context) => onDeleteGift(index),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
