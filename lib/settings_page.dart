import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:in_app_review/in_app_review.dart';
import 'package:url_launcher/url_launcher.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: 402.w,
            height: 402.h,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/menu.png"), fit: BoxFit.fill),
            ),
            child: Padding(
              padding: EdgeInsets.only(top: MediaQuery.paddingOf(context).top),
              child: Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: EdgeInsets.only(left: 20.w),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.arrow_back_ios,
                      size: 32.h,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 45.h,
          ),
          Column(
            children: [
              GestureDetector(
                  onTap: () async {
                    String? encodeQueryParameters(Map<String, String> params) {
                      return params.entries
                          .map((MapEntry<String, String> e) =>
                              '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                          .join('&');
                    }

                    // ···
                    final Uri emailLaunchUri = Uri(
                      scheme: 'mailto',
                      path: 'suletoy16@icloud.com',
                      query: encodeQueryParameters(<String, String>{
                        '': '',
                      }),
                    );
                    try {
                      if (await canLaunchUrl(emailLaunchUri)) {
                        await launchUrl(emailLaunchUri);
                      } else {
                        throw Exception("Could not launch $emailLaunchUri");
                      }
                    } catch (e) {
                      log('Error launching email client: $e'); // Log the error
                    }
                  },
                  child: infoMenu("Contact Us")),
              SizedBox(
                height: 20.h,
              ),
              GestureDetector(
                  onTap: () async {
                    final Uri url = Uri.parse(
                        'https://docs.google.com/document/d/1jdtX4xxa3tUjnjkam-sLOwA7BGCY1ktjtBq2jFREeQE/mobilebasic');
                    if (!await launchUrl(url)) {
                      throw Exception('Could not launch $url');
                    }
                  },
                  child: infoMenu("Privacy policy")),
              SizedBox(
                height: 20.h,
              ),
              GestureDetector(
                  onTap: () {
                    InAppReview.instance.openStoreListing(
                      appStoreId: '6740858212',
                    );
                  },
                  child: infoMenu("Rate Us")),
            ],
          )
        ],
      ),
    );
  }

  Widget infoMenu(String name) {
    return Container(
      width: 323.w,
      height: 65.h,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10.r)),
          boxShadow: [
            BoxShadow(
                offset: Offset(0, 4.h),
                blurRadius: 4.r,
                color: Colors.black.withValues(alpha: 0.25))
          ]),
      child: Center(
        child: Text(
          name,
          style:
              GoogleFonts.koulen(fontSize: 28.sp, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
