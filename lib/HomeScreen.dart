import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:notes_app/Note_Card.dart';
import 'package:notes_app/Read_Note.dart';
import 'package:notes_app/Editor_Note.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: "Notes".text.make(),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Your Recent Notes",
            style: TextStyle(fontSize: 22.sp),
          ),
          20.h.heightBox,
          Expanded(
            child: StreamBuilder(
                stream:
                    FirebaseFirestore.instance.collection("Notes").snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    EasyLoading.show();
                  }
                  if (snapshot.hasData) {
                    EasyLoading.dismiss();
                    return GridView(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                      children: snapshot.data!.docs
                          .map((note) => noteCard(() {
                                Get.to(() => ReadNoteScreen(doc: note));
                              }, note))
                          .toList(),
                    );
                  }
                  return Text(
                    "Ther's no Notes",
                    style: GoogleFonts.nunito(fontSize: 18.sp),
                  );
                }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Get.to(() => NoteEditorScreen());
          },
          icon: const Icon(Icons.add),
          label: Text(
            "Add Note",
            style: GoogleFonts.nunito(fontSize: 16.sp),
          )),
    );
  }
}
