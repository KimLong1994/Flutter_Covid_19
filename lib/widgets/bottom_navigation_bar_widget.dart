import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_widgets/responsive_widgets.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  final int startIndex;
  final Function selectedIndex;

  BottomNavigationBarWidget({
    this.startIndex,
    this.selectedIndex,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: <BottomNavigationBarItem>[
        BottomNavigationBarItem(
          icon: Icon(MaterialCommunityIcons.earth, size: 85.sp),
          title: Text(
            "Global",
            style: GoogleFonts.robotoSlab(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(MaterialCommunityIcons.view_list, size: 85.sp),
          title: Text(
            "Countries",
            style: GoogleFonts.robotoSlab(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        BottomNavigationBarItem(
          icon: Icon(MaterialCommunityIcons.information, size: 85.sp),
          title: Text(
            "Infomation",
            style: GoogleFonts.robotoSlab(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
      elevation: 0,
      backgroundColor: Color(0xFF1ec8c8),
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.white,
      unselectedItemColor: Color(0xFFe1e1e3),
      selectedFontSize: 50.sp,
      unselectedFontSize: 50.sp,
      currentIndex: startIndex,
      onTap: selectedIndex,
    );
  }
}
