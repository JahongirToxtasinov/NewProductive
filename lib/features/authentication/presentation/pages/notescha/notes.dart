import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:productive/assets/constants/icons.dart';

import 'note.dart';
import 'note_list.dart';

class NotesPage extends StatelessWidget {
    NotesPage({super.key});

  final nodesList = note.noteList();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 20,
        ),
        child: Column(
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text('Books',style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.grey),
                textAlign: TextAlign.start,
              ),
            ),
            Gap(16),
            books(),
            Expanded(
              child:ListView(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 50, bottom: 20),
                    child: Row(
                      children: [
                        Text(
                          "Quick Notes",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.grey),
                        ),
                        Gap(254),
                        Icon(Icons.add),
                      ],
                    ),
                  ),
                  for ( note notex in nodesList)
                  NotesText( notes: notex,),
                ],
              ),
            )
          ],
        ),
      ),
    );


  }

  void _onDismissed() {}

  Widget books() {
    return Container(
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SvgPicture.asset(AppIcons.book),
                Gap(8),
                Text('Passwords'),
              ],
            ),
            Column(
              children: [
                SvgPicture.asset(AppIcons.books),
                Gap(8),
                Text('Memories'),
              ],
            ),
            Column(
              children: [
                SvgPicture.asset(AppIcons.bookes),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
