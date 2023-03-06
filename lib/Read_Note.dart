import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        backgroundColor: AppStyle.cardsColor[color_id],
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(widget.doc["note_title"]),
            5.h.heightBox,
            Text(widget.doc["creation_date"]),
            25.h.heightBox,
            Text(widget.doc["note_content"]),
          ],
        ),
      ),
    );
  }
}
