import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  AppBarWidget({this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0,
      backgroundColor: Color(0xFF1ec8c8),
      title: Center(
        child: Text(
          "STAY HOME STAY SAFE",
          textAlign: TextAlign.center,
          style: GoogleFonts.robotoSlab(
            fontSize: 55.sp,
            fontWeight: FontWeight.w600,
            letterSpacing: 2.sp,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}
