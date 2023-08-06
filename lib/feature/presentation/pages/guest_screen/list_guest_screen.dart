// ignore_for_file: non_constant_identifier_names, unused_field

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobyte_first_example/const/colors.dart';
import 'package:mobyte_first_example/const/images_name.dart';
import 'package:mobyte_first_example/const/styles.dart';
import 'package:mobyte_first_example/data/database.dart';
import 'package:mobyte_first_example/widgets/buttons.dart';
import 'package:mobyte_first_example/widgets/guest_widgets.dart';

import '../../widgets/bottom_sheet_body.dart';

class ListGuestScreen extends StatefulWidget {
  const ListGuestScreen({super.key});

  @override
  State<ListGuestScreen> createState() => _ListGuestScreenState();
}

class _ListGuestScreenState extends State<ListGuestScreen> {

  File ? _selectedImage;

  final _myBox = Hive.box('mybox');

  TodoDataBase db = TodoDataBase();

  @override
  void initState() {
    if (_myBox.get('KEY') == null) {
      db.createInitialData();
    } else {
      db.loadData();
    }

    super.initState();
  }

  final _controller_name = TextEditingController();
  final _controller_surname = TextEditingController();
  final _controller_date_birthday = TextEditingController();
  final _controller_phone = TextEditingController();
  final _controller_job = TextEditingController();

  void saveNewGuest() {
    setState(() {
      db.guestList.add([
        _controller_name.text,
        _controller_surname.text,
        _controller_date_birthday.text,
        _controller_job.text,
        _controller_phone.text,
      ]);
      _controller_name.clear();
      _controller_surname.clear();
      _controller_date_birthday.clear();
      _controller_job.clear();
      _controller_phone.clear();
    });
    Navigator.of(context).pop();
    db.updateDataBase();
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
            controller_job: _controller_job,
            controller_phone: _controller_phone,
            onSave: saveNewGuest,
          );
        });
  }

  void onDeleteGuest(int index) {
    setState(() {
       db.guestList.removeAt(index);
    });
   
  }
  
  Future _pickImageFromGallery() async {
  final image = await ImagePicker().pickImage(source: ImageSource.gallery);
  setState(() {
    if(image == null) return;
    _selectedImage = File(image!.path);
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
      body: SingleChildScrollView(
        child: Padding(
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
                  itemCount: db.guestList.length,
                  itemBuilder: (context, index) {
                    return GuestWidget(
                      onDelete: (context) => onDeleteGuest(index),
                      avatarName: db.guestList[index][0],
                      name: db.guestList[index][1],
                      surname: db.guestList[index][2],
                      years: db.guestList[index][3],
                      activity: db.guestList[index][4],
                      phone: db.guestList[index][5],
                    );
                  }),
                  SizedBox(height: 12.h,),
                  GestureDetector(
                    onTap: () {
                      _pickImageFromGallery();
                    },
                    child: Container(
                      height: 64.r,
                      width: 64.r,
                      
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,                  
                      ),
                      child: _selectedImage != null ? ClipOval(
                        child: Image.file(_selectedImage!, fit: BoxFit.cover,)) : Image.asset(AppImages.noneAvatar),) ,
                    ),
                  
                  // _selectedImage != null ? SizedBox(
                  //   height: 64.r,
                  //   width: 64.r,
                  //   child: Image.file(_selectedImage!, fit: BoxFit.fill,)) : const Text('pick image'),
                  // GestureDetector(
                  //   onTap: () {
                  //     _pickImageFromGallery();
                  //   },
                  //   child: Container(
                  //     width: 100,
                  //     height: 100,
                  //     color: AppColors.greenColor,
                  //   ),
                  // )
                  
            ],
          ),
        ),
      ),
    );
  }
}