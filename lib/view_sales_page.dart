import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:garage_sale/date/hive_box.dart';
import 'package:garage_sale/date/list_of_products_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ViewSalesPage extends StatefulWidget {
  const ViewSalesPage({super.key});

  @override
  State<ViewSalesPage> createState() => _ViewSalesPageState();
}

class _ViewSalesPageState extends State<ViewSalesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ValueListenableBuilder(
            valueListenable:
                Hive.box<ListOfProductsModel>(HiveBoxes.listOfProductsModel)
                    .listenable(),
            builder: (context, Box<ListOfProductsModel> box, _) {
              return SingleChildScrollView(
                child: Column(
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
                              "View sales",
                              style: GoogleFonts.koulen(
                                  height: 1,
                                  fontSize: 28.sp,
                                  fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              width: 32.h,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    for (int index = 0; index < box.values.length; index++) ...[
                      if (box.getAt(index)!.isSales)
                        Padding(
                          padding: EdgeInsets.only(
                              bottom: 20.h, left: 20.w, right: 20.w),
                          child: Container(
                            width: 363.w,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.r))),
                            child: Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 9.w, vertical: 10.h),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 61.w,
                                    height: 54.h,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            fit: BoxFit.fill,
                                            image: MemoryImage(
                                                box.getAt(index)!.imageFriend)),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20.r))),
                                  ),
                                  SizedBox(
                                    width: 186.w,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          box.getAt(index)!.name,
                                          style: GoogleFonts.poppins(
                                              fontSize: 18.sp,
                                              fontWeight: FontWeight.w600),
                                        ),
                                        Text(
                                          box.getAt(index)!.description,
                                          style: GoogleFonts.poppins(
                                              color: const Color(0xFF979797),
                                              fontSize: 10.95.sp,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomRight,
                                    child: Text(
                                      "\$${box.getAt(index)!.price}",
                                      style: GoogleFonts.inter(
                                          color: const Color(0xFFDD9776),
                                          fontSize: 26.sp,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        )
                    ]
                  ],
                ),
              );
            }));
  }
}
