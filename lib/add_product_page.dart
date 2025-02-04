import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:garage_sale/date/hive_box.dart';
import 'package:garage_sale/date/list_of_products_model.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:keyboard_actions/keyboard_actions.dart';

class AddProductPage extends StatefulWidget {
  const AddProductPage({super.key});

  @override
  State<AddProductPage> createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  FocusNode descriptionNode = FocusNode();
  Box<ListOfProductsModel> listOfProductBox =
      Hive.box<ListOfProductsModel>(HiveBoxes.listOfProductsModel);
  Uint8List? _image;
  Future getLostData() async {
    XFile? picker = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (picker == null) return;
    List<int> imageBytes = await picker.readAsBytes();
    _image = Uint8List.fromList(imageBytes);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: KeyboardActions(
        config: KeyboardActionsConfig(nextFocus: false, actions: [
          KeyboardActionsItem(
            focusNode: descriptionNode,
          ),
        ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.paddingOf(context).top + 20.h,
                      bottom: 20.h,
                      right: 20.w,
                      left: 20.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        "Add product",
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
                textFieldForm(
                    "Name",
                    315.w,
                    nameController,
                    const Color(0xFFADC235),
                    Colors.white,
                    const Color(0xFFADC235)),
                SizedBox(
                  height: 20.h,
                ),
                textFieldForm(
                    "Price",
                    315.w,
                    priceController,
                    const Color(0xFFADC235),
                    Colors.white,
                    const Color(0xFFADC235)),
                SizedBox(
                  height: 20.h,
                ),
                textFieldForm(
                    "description",
                    315.w,
                    descriptionController,
                    const Color(0xFFADC235),
                    Colors.white,
                    const Color(0xFFADC235),
                    myNode: descriptionNode,
                    keyboard: TextInputType.multiline),
                SizedBox(
                  height: 20.h,
                ),
                Container(
                  width: 315.w,
                  height: 139.h,
                  decoration: BoxDecoration(
                      image: _image == null
                          ? null
                          : DecorationImage(
                              image: MemoryImage(_image!), fit: BoxFit.fill),
                      borderRadius: BorderRadius.all(Radius.circular(20.r)),
                      border: Border.all(
                          width: 2.w, color: const Color(0xFFADC235))),
                  child: Center(
                      child: GestureDetector(
                          onTap: () {
                            getLostData();
                          },
                          child:
                              SvgPicture.asset("assets/icons/add_image.svg"))),
                ),
              ],
            ),
            Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.paddingOf(context).bottom, top: 80.h),
                child: SizedBox(
                  width: 263.w,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          width: 116.w,
                          height: 52.h,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.r)),
                              border: Border.all(
                                  width: 2.w, color: const Color(0xFFADC235))),
                          child: Center(
                            child: Text(
                              "Cancel",
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  color: const Color(0xFFADC235),
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          if (_image != null &&
                              nameController.text.isNotEmpty &&
                              priceController.text.isNotEmpty &&
                              descriptionController.text.isNotEmpty) {
                            listOfProductBox.add(ListOfProductsModel(
                                name: nameController.text,
                                price: priceController.text,
                                description: descriptionController.text,
                                imageFriend: _image!,
                                isSales: false));
                            Navigator.pop(context);
                          }
                        },
                        child: Container(
                          width: 116.w,
                          height: 52.h,
                          decoration: BoxDecoration(
                              color: const Color(0xFFADC235),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.r)),
                              border: Border.all(
                                  width: 2.w, color: const Color(0xFFADC235))),
                          child: Center(
                            child: Text(
                              "Save",
                              style: TextStyle(
                                  fontSize: 16.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }

  static Widget textFieldForm(
      String description,
      double widthContainer,
      TextEditingController myController,
      Color title,
      Color container,
      Color stroke,
      {FocusNode? myNode,
      TextInputType? keyboard}) {
    return Column(
      children: [
        SizedBox(
          width: widthContainer,
          child: Text(
            description,
            style: GoogleFonts.montserrat(
                fontSize: 14.sp, color: title, fontWeight: FontWeight.w400),
          ),
        ),
        Container(
          height: myNode == null ? 50.h : null,
          width: widthContainer,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(15.r)),
            color: container,
            border: Border.all(color: stroke, width: 2.w),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
            child: Center(
              child: TextField(
                focusNode: myNode,
                maxLines: myNode == null ? 1 : null,
                controller: myController,
                decoration: const InputDecoration(
                  isDense: true,
                  border: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
                keyboardType: keyboard ?? TextInputType.text,
                cursorColor: title,
                style: TextStyle(
                    color: title, fontWeight: FontWeight.w500, fontSize: 16.sp),
                onChanged: (text) {
                  // Additional functionality can be added here
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
