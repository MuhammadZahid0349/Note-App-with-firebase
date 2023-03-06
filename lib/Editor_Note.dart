import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes_app/Colors.dart';
import 'package:velocity_x/velocity_x.dart';

class NoteEditorScreen extends StatefulWidget {
  const NoteEditorScreen({super.key});

  @override
  State<NoteEditorScreen> createState() => _NoteEditorScreenState();
}

class _NoteEditorScreenState extends State<NoteEditorScreen> {
  int color_id = Random().nextInt(AppStyle.cardsColor.length);

  TextEditingController _titleController = TextEditingController();
  TextEditingController _mainController = TextEditingController();

  getCurrentDate() {
    var date = DateTime.now().toString();

    var dateParse = DateTime.parse(date);

    var formattedDate = "${dateParse.day}-${dateParse.month}-${dateParse.year}";
    return formattedDate;
  }

  @override
  Widget build(BuildContext context) {
    String date = getCurrentDate();
    return Scaffold(
      backgroundColor: AppStyle.cardsColor[color_id],
      appBar: AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: AppStyle.cardsColor[color_id],
        elevation: 0.0,
        title: Text("Add a New Note"),
        titleTextStyle: GoogleFonts.nunito(
            fontSize: 20.sp, fontWeight: FontWeight.w700, color: Colors.black),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Note Title",
                hintStyle: GoogleFonts.josefinSans(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
              style: AppStyle.maintitle,
            ),
            4.h.heightBox,
            Text(
              date,
              style: GoogleFonts.josefinSans(
                  letterSpacing: 1.5,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.black),
            ),
            25.h.heightBox,
            TextField(
              controller: _mainController,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Note content",
                hintStyle: GoogleFonts.josefinSans(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
              style: AppStyle.mainContent,
            ),
          ],
        ),
      ),
      floatingActionButton: Container(
        height: 40.h,
        width: 40.h,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.r),
            color: Colors.white,
            boxShadow: const [
              BoxShadow(
                color: Colors.white,
                offset: Offset(0.7, 0.7),
                blurRadius: 1.5,
                spreadRadius: 2.5,
              )
            ]),
        child: FloatingActionButton(
          backgroundColor: AppStyle.cardsColor[color_id],
          onPressed: () {
            FirebaseFirestore.instance.collection("Notes").add({
              "note_title": _titleController.text.trim(),
              "creation_date": date,
              "note_content": _mainController.text.trim(),
              "color_id": color_id,
            }).then((value) {
              Get.back();
            }).catchError((e) {
              print("Falied to add new note");
              Get.snackbar("Add Note", e);
            });
          },
          child: Icon(
            Icons.save,
            color: AppStyle.mainColor,
          ),
        ),
      ),
    );
  }
}
