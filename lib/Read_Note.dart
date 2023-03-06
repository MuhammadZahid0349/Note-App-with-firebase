import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes_app/Colors.dart';
import 'package:velocity_x/velocity_x.dart';

class ReadNoteScreen extends StatefulWidget {
  ReadNoteScreen({super.key, required this.doc});

  QueryDocumentSnapshot doc;

  @override
  State<ReadNoteScreen> createState() => _ReadNoteScreenState();
}

class _ReadNoteScreenState extends State<ReadNoteScreen> {
  @override
  Widget build(BuildContext context) {
    int color_id = widget.doc['color_id'];
    return Scaffold(
      backgroundColor: AppStyle.cardsColor[color_id],
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        title: Text(widget.doc["note_title"],
            style: GoogleFonts.josefinSans(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 25.sp,
              height: 0.5,
            )),
        centerTitle: true,
        backgroundColor: AppStyle.cardsColor[color_id],
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.doc["note_title"],
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.josefinSans(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.sp,
                )),
            2.h.heightBox,
            Text(widget.doc["creation_date"],
                style: GoogleFonts.josefinSans(
                  fontWeight: FontWeight.w500,
                  fontSize: 13.sp,
                )),
            20.h.heightBox,
            Text(widget.doc["note_content"],
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
}
