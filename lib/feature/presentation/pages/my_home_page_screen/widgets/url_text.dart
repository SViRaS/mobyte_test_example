import 'package:flutter/material.dart';
import 'package:mobyte_first_example/const/styles.dart';
import 'package:url_launcher/url_launcher.dart';

class UrlLauncherText extends StatefulWidget {
  const UrlLauncherText({super.key});

  @override
  State<UrlLauncherText> createState() => _UrlTextState();
}

class _UrlTextState extends State<UrlLauncherText> {
  
  _launchURL() async {
   final Uri url = Uri.parse('https://cyberxcommunity.ru');
   if (!await launchUrl(url)) {
        throw Exception('Could not launch $url');
    }
}

  @override
  Widget build(BuildContext context) {
    return Center(
        child: GestureDetector(
          onTap: _launchURL,
            child: Text(
      'Перейти на сайт места',
      style: AppStyles().underlineText
    )));
  }
}
