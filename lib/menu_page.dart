import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:garage_sale/list_of_product_page.dart';
import 'package:garage_sale/sales_page.dart';
import 'package:garage_sale/settings_page.dart';
import 'package:google_fonts/google_fonts.dart';

class MenuPage extends StatefulWidget {
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
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
          ),
          SizedBox(
            height: 45.h,
          ),
          Column(
            children: [
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) =>
                            const ListOfProductPage(),
                      ),
                    );
                  },
                  child: infoMenu("List of products")),
              SizedBox(
                height: 20.h,
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => const SalesPage(),
                      ),
                    );
                  },
                  child: infoMenu("Sales")),
              SizedBox(
                height: 20.h,
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute<void>(
                        builder: (BuildContext context) => const SettingsPage(),
                      ),
                    );
                  },
                  child: infoMenu("Settings")),
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
