import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:garage_sale/date/hive_box.dart';
import 'package:garage_sale/date/statistic_model.dart';
import 'package:garage_sale/view_sales_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SalesPage extends StatefulWidget {
  const SalesPage({super.key});
  @override
  State<SalesPage> createState() => _SalesPageState();
}

class _SalesPageState extends State<SalesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ValueListenableBuilder(
            valueListenable:
                Hive.box<StatisticModel>(HiveBoxes.statisticModel).listenable(),
            builder: (context, Box<StatisticModel> box, _) {
              return Column(
                children: [
                  Container(
                    height: MediaQuery.paddingOf(context).top + 60.h,
                    color: Colors.white,
                    child: Padding(
                      padding: EdgeInsets.only(
                          bottom: 10.h, right: 20.w, left: 20.w),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(
                              Icons.arrow_back_ios,
                              size: 32.h,
                            ),
                          ),
                          Text(
                            "Sales",
                            style: GoogleFonts.koulen(
                                height: 1,
                                fontSize: 28.sp,
                                fontWeight: FontWeight.w400),
                          ),
                          SizedBox(
                            width: 32.h,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) =>
                                  const ViewSalesPage(),
                            ),
                          );
                        },
                        child: CustomPaint(
                          painter: _Painter(),
                          child: SizedBox(
                            width: 186.w - 40.r,
                            height: 100.h,
                            child: Stack(
                              children: [
                                Align(
                                    alignment: Alignment.topCenter,
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 4.h),
                                      child: Container(
                                        width: 148.4.w,
                                        height: 53.h,
                                        decoration: const BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                          "assets/backgroud.png",
                                        ))),
                                      ),
                                    )),
                                Positioned(
                                  bottom: 4.h,
                                  right: -10.r,
                                  child: Container(
                                    width: 82.w,
                                    height: 66.36.h,
                                    decoration: const BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: AssetImage(
                                              "assets/sold.png",
                                            ))),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: SizedBox(
                                    height: 69.h,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Sold on",
                                          style: TextStyle(
                                              fontSize: 9.65.sp,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          "\$${box.isEmpty ? "0" : box.getAt(0)?.sales.toString() ?? "0"}",
                                          style: TextStyle(
                                              fontSize: 19.3.sp,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          "View sales",
                                          style: TextStyle(
                                              fontSize: 7.24.sp,
                                              fontWeight: FontWeight.w400,
                                              decoration:
                                                  TextDecoration.underline),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute<void>(
                              builder: (BuildContext context) =>
                                  const ViewSalesPage(),
                            ),
                          );
                        },
                        child: CustomPaint(
                          painter: _Painter2(),
                          child: SizedBox(
                            width: 186.w - 40.r,
                            height: 100.h,
                            child: Stack(
                              children: [
                                Align(
                                    alignment: Alignment.topCenter,
                                    child: Padding(
                                      padding: EdgeInsets.only(top: 4.h),
                                      child: Container(
                                        width: 148.4.w,
                                        height: 53.h,
                                        decoration: const BoxDecoration(
                                            image: DecorationImage(
                                                image: AssetImage(
                                          "assets/backgroud.png",
                                        ))),
                                      ),
                                    )),
                                Positioned(
                                  bottom: 4.h,
                                  right: -10.r,
                                  child: Container(
                                    width: 82.w,
                                    height: 66.36.h,
                                    decoration: const BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: AssetImage(
                                              "assets/sales.png",
                                            ))),
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.centerLeft,
                                  child: SizedBox(
                                    height: 69.h,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Sales",
                                          style: TextStyle(
                                              fontSize: 9.65.sp,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          box.isEmpty
                                              ? "0"
                                              : box.getAt(0)?.sold.toString() ??
                                                  "0",
                                          style: TextStyle(
                                              fontSize: 19.3.sp,
                                              fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          "View sales",
                                          style: TextStyle(
                                              fontSize: 7.24.sp,
                                              fontWeight: FontWeight.w400,
                                              decoration:
                                                  TextDecoration.underline),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              );
            }));
  }
}

class _Painter2 extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFF1CB41)
      ..strokeWidth = 2
      ..style = PaintingStyle.fill;

    double radius = 20.r;
    double smallRadius = (5).r;
    double padRad = 6.r;

    final path = Path()
      ..moveTo(size.width, 0) // Зеркальное отображение
      ..relativeLineTo(-size.width, 0) // Зеркальное
      ..quadraticBezierTo(-radius, 0, -radius, radius) // Зеркальное
      ..lineTo(-(padRad + smallRadius), radius) // Зеркальное
      ..quadraticBezierTo(-(padRad), radius + smallRadius,
          -(padRad + smallRadius), radius + 2 * smallRadius) // Зеркальное
      ..lineTo(-radius, radius + 2 * smallRadius) // Зеркальное
      ..lineTo(-radius, size.height / 2 - smallRadius) // Зеркальное
      ..lineTo(
          -(padRad + smallRadius), size.height / 2 - smallRadius) // Зеркальное
      ..quadraticBezierTo(-(padRad), size.height / 2, -(padRad + smallRadius),
          size.height / 2 + smallRadius) // Зеркальное
      ..lineTo(-radius, size.height / 2 + smallRadius) // Зеркальное
      ..lineTo(-radius, size.height - 2 * smallRadius - radius) // Зеркальное
      ..lineTo(-(padRad + smallRadius),
          size.height - 2 * smallRadius - radius) // Зеркальное
      ..quadraticBezierTo(-(padRad), size.height - smallRadius - radius,
          -(padRad + smallRadius), size.height - radius) // Зеркальное
      ..lineTo(-radius, size.height - radius) // Зеркальное

      ..quadraticBezierTo(-radius, size.height, 0, size.height) // Зеркальное
      ..lineTo(size.width, size.height) // Зеркальное
      ..quadraticBezierTo(size.width + radius, size.height, size.width + radius,
          size.height - radius) // Зеркальное
      ..lineTo(size.width + radius, radius) // Зеркальное
      ..quadraticBezierTo(size.width + radius, 0, size.width, 0); // Зеркальное

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_Painter2 oldDelegate) {
    return oldDelegate.runtimeType != runtimeType;
  }
}

class _Painter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFCDDA84)
      ..strokeWidth = 2
      ..style = PaintingStyle.fill; // Use fill to fill the entire path

    double radius = 20.r;
    double smallRadius = (5).r;
    double padRad = 6.r;

    final path = Path()
      ..moveTo(0, 0)
      ..relativeLineTo(size.width, 0)
      ..quadraticBezierTo(size.width + radius, 0, size.width + radius, radius)
      ..lineTo(size.width + (padRad + smallRadius), radius)
      ..quadraticBezierTo(size.width + (padRad), radius + smallRadius,
          size.width + (padRad + smallRadius), radius + 2 * smallRadius)
      ..lineTo(size.width + radius, radius + 2 * smallRadius)
      ..lineTo(size.width + radius, size.height / 2 - smallRadius)
      ..lineTo(
          size.width + (padRad + smallRadius), size.height / 2 - smallRadius)
      ..quadraticBezierTo(size.width + (padRad), size.height / 2,
          size.width + (padRad + smallRadius), size.height / 2 + smallRadius)
      ..lineTo(size.width + radius, size.height / 2 + smallRadius)
      ..lineTo(size.width + radius, size.height - 2 * smallRadius - radius)
      ..lineTo(size.width + (padRad + smallRadius),
          size.height - 2 * smallRadius - radius)
      ..quadraticBezierTo(
          size.width + (padRad),
          size.height - smallRadius - radius,
          size.width + (padRad + smallRadius),
          size.height - radius)
      ..lineTo(size.width + radius, size.height - radius)
      ..quadraticBezierTo(
          size.width + radius, size.height, size.width, size.height)
      ..lineTo(0, size.height)
      ..quadraticBezierTo(-radius, size.height, -radius, size.height - radius)
      ..lineTo(-radius, radius)
      ..quadraticBezierTo(-radius, 0, 0, 0);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(_Painter oldDelegate) => false;
}
