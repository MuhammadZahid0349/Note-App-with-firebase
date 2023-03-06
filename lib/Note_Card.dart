import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes_app/Colors.dart';
import 'package:velocity_x/velocity_x.dart';

Widget noteCard(Function()? onTap, QueryDocumentSnapshot doc) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.all(8.0),
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
          color: AppStyle.cardsColor[doc['color_id']],
          borderRadius: BorderRadius.circular(15.r),
          boxShadow: const [
            BoxShadow(
              color: Colors.white,
              offset: Offset(0.7, 0.7),
              blurRadius: 1.5,
              spreadRadius: 2.5,
            )
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(doc["note_title"],
              overflow: TextOverflow.ellipsis,
              style: GoogleFonts.josefinSans(
                fontWeight: FontWeight.bold,
                fontSize: 18.sp,
              )),
          4.h.heightBox,
          Text(doc["creation_date"],
              style: GoogleFonts.josefinSans(
                fontWeight: FontWeight.w500,
                fontSize: 13.sp,
              )),
          8.h.heightBox,
          Text(doc["note_content"],
              maxLines: 3,
              softWrap: true,
              style: GoogleFonts.josefinSans(
                  fontWeight: FontWeight.w600,
                  fontSize: 14.sp,
                  letterSpacing: 1)),
        ],
      ),
    ),
  );
}
