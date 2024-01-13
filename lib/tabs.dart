import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Tabs extends StatelessWidget {
  const Tabs({super.key, required this.title, required this.color});
  final Color color;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 120,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: color,
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 7,
              offset: const Offset(0, 0))
        ],
      ),
      child: Text(
        title,
        style: GoogleFonts.lato(color: Colors.white,fontSize: 16),
      ),
    );
  }
}
