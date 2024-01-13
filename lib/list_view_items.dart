import 'package:flutter/material.dart';
import 'package:flutter_ebook_app/utils/app_color.dart';
import 'package:google_fonts/google_fonts.dart';

class ListViewItems extends StatelessWidget {
  const ListViewItems({super.key, required this.image,required this.ratting,required this.tittle,required this.subtitle});

  final String image;
  final String ratting;
  final String tittle;
  final String subtitle;

  

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 120,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.tabVarViewColor,
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              blurRadius: 2,
              offset: const Offset(0, 0))
        ],
      ),
      child: Container(
        // height: 120,
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            Container(
              height: 100,
              width: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image:
                    DecorationImage(image: AssetImage(image), fit: BoxFit.fill),
              ),
            ),
            const SizedBox(width: 10,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: AppColors.starColor,
                      size: 24,
                    ),
                    Text(
                      "$ratting",
                      style: GoogleFonts.lato(color: AppColors.menu3Color),
                    ),
                  ],
                ),
                Text(tittle,style: GoogleFonts.roboto(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 16),),
                Text(subtitle,style: GoogleFonts.lato(color: AppColors.subTitleText),),
                Container(
                  height: 20,
                  width: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: AppColors.loveColor
                  ),
                  child: Text("Love",style: GoogleFonts.lato(color: Colors.white),),
                )

              ],
            )
          ],
        ),
      ),
    );
  }
}
