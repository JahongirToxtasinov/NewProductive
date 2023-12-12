import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:productive/assets/constants/colors.dart';
import 'package:productive/assets/constants/images.dart';

import 'note_list.dart';

class NotesText extends StatelessWidget {
  final note notes;
  const NotesText({Key? key, required this.notes}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: textFieldBackgroundColor,
      ),
      child: notes.isDone == true ? Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                notes.notesText1! ,
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18, color: white),
              ),
              Gap(4),
              Text(
                notes.notesTExt2!,
                style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500, color: white.withOpacity(.6) ),
              ),
              Gap(8),
              Row(
                children: [
                  Text(
                    '15 November',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400,color: hintTextColor),
                  ),
                  Gap(10),
                  Image.asset(AppImages.soun),
                ],
              ),
            ],
          ),
          const Spacer(),
          Image.asset(AppImages.list,
            height: 40,
            width: 42,
          ),
          // Container(
          //   height: 18,
          //   width: 18,
          //   decoration: BoxDecoration(
          //     borderRadius: BorderRadius.circular(6),
          //     border: Border.all(
          //       width: 2,
          //       color: activeColor,
          //     ),
          //   ),
          // ),
        ],
      ) :  Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                notes.notesText1! ,
                style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18, color: white),
              ),
              Gap(4),
              Text(
                notes.notesTExt2!,
                style: TextStyle(fontSize: 14,fontWeight: FontWeight.w500, color: white.withOpacity(.6) ),
              ),
              Gap(8),
              Text(
                '15 November',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400,color: hintTextColor),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// Container(
// child: ListTile(
// onTap: () {},
// shape: RoundedRectangleBorder(
// borderRadius: BorderRadius.circular(8),
// ),
// tileColor: textFieldBackgroundColor,
// title: ,
//
// ),
// );