import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../const/colors.dart';

class TileWidget extends StatefulWidget {
  final List<Widget> children;
  const TileWidget({
    required this.children,
    super.key
    });

  @override
  State<TileWidget> createState() => _TestLogicWidgetState();
}

class _TestLogicWidgetState extends State<TileWidget> {
  bool _state = true;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData().copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        onExpansionChanged: (value) {
          setState(() {
            _state = !_state;
          });
        },
        trailing: const SizedBox(),
        backgroundColor: Colors.transparent,
        collapsedBackgroundColor: Colors.transparent,
        tilePadding: EdgeInsets.only(left: 31.5.w),
        title: _state ? Center(
          child: Text(
            'Развернуть ▼',
            style: TextStyle(
                decoration: TextDecoration.underline,
                color: AppColors.semiBlackColor,
                fontSize: 14.sp,
                fontFamily: 'Jost',
                fontWeight: FontWeight.w400),
          ),
        ) :  Center(
          child: Text(
            'Свернуть ▲',
            style: TextStyle(
              decoration: TextDecoration.underline,
                color: AppColors.semiBlackColor,
                fontSize: 14.sp,
                fontFamily: 'Jost',
                fontWeight: FontWeight.w400),
          ),
        ),
       children: widget.children,
      ),
    );
  }
}
