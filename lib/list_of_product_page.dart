import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:garage_sale/date/hive_box.dart';
import 'package:garage_sale/date/list_of_products_model.dart';
import 'package:garage_sale/date/statistic_model.dart';
import 'package:garage_sale/add_product_page.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ListOfProductPage extends StatefulWidget {
  const ListOfProductPage({super.key});

  @override
  State<ListOfProductPage> createState() => _ListOfProductPageState();
}

class _ListOfProductPageState extends State<ListOfProductPage> {
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
                            "List of products",
                            style: GoogleFonts.koulen(
                                height: 1,
                                fontSize: 28.sp,
                                fontWeight: FontWeight.w400),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        const AddProductPage(),
                                  ));
                            },
                            child: Icon(
                              Icons.add,
                              size: 32.h,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  for (int index = 0; index < box.values.length; index++) ...[
                    if (!box.getAt(index)!.isSales)
                      Padding(
                        padding: EdgeInsets.only(
                            bottom: 20.h, left: 20.w, right: 20.w),
                        child: Container(
                          width: 363.w,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.r))),
                          child: Stack(
                            children: [
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 9.w, vertical: 10.h),
                                child: Row(
                                  children: [
                                    Container(
                                      width: 114.w,
                                      height: 101.h,
                                      decoration: BoxDecoration(
                                          image: DecorationImage(
                                              fit: BoxFit.fill,
                                              image: MemoryImage(box
                                                  .getAt(index)!
                                                  .imageFriend)),
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20.r))),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(left: 20.w),
                                      child: SizedBox(
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
                                                  color:
                                                      const Color(0xFF979797),
                                                  fontSize: 10.95.sp,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            SizedBox(
                                              height: 20.h,
                                            ),
                                            Text(
                                              "\$${box.getAt(index)!.price}",
                                              style: GoogleFonts.inter(
                                                  color:
                                                      const Color(0xFFDD9776),
                                                  fontSize: 14.5.sp,
                                                  fontWeight: FontWeight.bold),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Positioned(
                                right: 10.w,
                                top: 10.h,
                                child: GestureDetector(
                                  onTap: () {
                                    box.putAt(
                                        index,
                                        ListOfProductsModel(
                                          name: box.getAt(index)!.name,
                                          price: box.getAt(index)!.price,
                                          description:
                                              box.getAt(index)!.description,
                                          imageFriend:
                                              box.getAt(index)!.imageFriend,
                                          isSales: true,
                                        ));
                                    Box<StatisticModel> statBox =
                                        Hive.box<StatisticModel>(
                                            HiveBoxes.statisticModel);
                                    if (statBox.isEmpty) {
                                      statBox.add(StatisticModel(
                                          sold: double.tryParse(
                                                  box.getAt(index)!.price) ??
                                              0,
                                          sales: 1));
                                    } else {
                                      statBox.putAt(
                                          0,
                                          StatisticModel(
                                              sold: statBox.getAt(0)!.sold +
                                                  (double.tryParse(box
                                                          .getAt(index)!
                                                          .price) ??
                                                      0),
                                              sales:
                                                  statBox.getAt(0)!.sales + 1));
                                    }
                                  },
                                  child: SvgPicture.asset(
                                    "assets/icons/sales.svg",
                                    height: 20.h,
                                    width: 20.w,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                  ]
                ],
              ),
            );
          }),
    );
  }
}
