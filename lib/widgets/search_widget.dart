import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_widgets/responsive_widgets.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class SearchWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsetsResponsive.only(
        top: 50,
        bottom: 50,
        left: 25,
        right: 25,
      ),
      child: TextFormField(
        cursorWidth: 5.sp,
        cursorColor: Colors.black54,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF1ec8c8), width: 5.sp),
            borderRadius: BorderRadius.all(Radius.circular(20.sp)),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.grey[300], width: 5.sp),
            borderRadius: BorderRadius.all(Radius.circular(20.sp)),
          ),
          prefixIcon: Container(
            width: 50.sp,
            child: Icon(
              MaterialCommunityIcons.map_search,
              size: 75.sp,
              color: Colors.black54,
            ),
          ),
          suffixIcon: IconButton(
            icon: Icon(
              Icons.clear,
              size: 65.sp,
              color: Colors.black54,
            ),
            onPressed: () {},
          ),
          labelText: "Search Your Country",
          labelStyle: GoogleFonts.robotoSlab(
            fontSize: 45.sp,
            fontWeight: FontWeight.w500,
            color: Colors.black54,
          ),
          fillColor: Colors.white,
          filled: true,
        ),
      ),
    );
  }
}
