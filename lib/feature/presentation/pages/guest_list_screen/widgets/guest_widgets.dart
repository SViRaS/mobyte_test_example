
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobyte_first_example/feature/resources/styles.dart';

import '../../../../resources/images_name.dart';

class GuestWidget extends StatefulWidget {
  final String name;
  final String years;
  final String activity;
  final String surname;
  final String phone;
  final Function(BuildContext)? onDelete;
  const GuestWidget({
    super.key,
    required this.name,
    required this.years,
    required this.activity,
    required this.surname,
    required this.phone,
    required this.onDelete,
  });

  @override
  State<GuestWidget> createState() => _GuestWidgetState();
}

class _GuestWidgetState extends State<GuestWidget> {

    File ? _selectedImage;
     

    Future _pickImageFromGallery() async {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    setState(() {
      if (image == null) return;
      _selectedImage = File(image.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 8.h),
      child: Slidable(
        endActionPane: ActionPane(
          motion: const StretchMotion(),
          children: [
            SlidableAction(
              onPressed: widget.onDelete,
              icon: Icons.delete,
              backgroundColor: Colors.redAccent,
              )
          ]),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             GestureDetector(
                onTap: () {
                  _pickImageFromGallery();
                },
                child: SizedBox(
                  height: 64.r,
                  width: 64.r,
                  child: _selectedImage != null
                      ? ClipOval(
                          child: Image.file(
                          _selectedImage!,
                          fit: BoxFit.cover,
                        ))
                      : Image.asset(AppImages.noneAvatar),
                ),
              ),
            SizedBox(
              width: 12.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(widget.name, style: AppStyles().guestTileName),
                    SizedBox(
                      width: 2.w,
                    ),
                    Text(widget.surname, style: AppStyles().guestTileName),
                  ],
                ),
                Text(widget.years, style: AppStyles().guestTileYears),
                Text(widget.activity, style: AppStyles().guestTileJob),
                Text(widget.phone, style: AppStyles().guestTilePhone),
              ],
            ),
          ],
        ),
      ),
    );
  }
}



  
