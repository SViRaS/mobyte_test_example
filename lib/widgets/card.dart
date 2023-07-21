import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardWidget extends StatelessWidget {
  final String url;
  final String text;
  const CardWidget({
    super.key,
    required this.url,
    required this.text,
    });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image.asset(url),
        SizedBox(height: 4.h,),
        Text(text),
      ],
    );
  }
}