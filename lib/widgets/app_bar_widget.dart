import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_widgets/responsive_widgets.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  AppBarWidget({this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFF1ec8c8),
      centerTitle: true,
      title: Text(
        title,
        textAlign: TextAlign.center,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: GoogleFonts.robotoSlab(
          color: Colors.white,
          fontSize: 58.sp,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(AppBar().preferredSize.height);
}
