import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:odc/screens/course_exam/exam_question2.dart';
import 'package:odc/screens/course_exam/exam_question7.dart';
import 'package:odc/shared/componant/componant.dart';
import 'package:odc/widget/course_exam.dart';

class ExamQuestion6 extends StatefulWidget {
  const ExamQuestion6({Key? key}) : super(key: key);

  @override
  State<ExamQuestion6> createState() => _ExamQuestion6State();
}

class _ExamQuestion6State extends State<ExamQuestion6> {
  @override
  Widget build(BuildContext context) {
    return CourseQuestion(
        count: 6,
        onTapBack: (){
              Navigator.pop;
            },
            onTap: (){
              navigatTo(context, ExamQuestion7());
            },
        answer1: 'Google Docs',
        answer2: 'Google Stadia',
        answer3: 'Microsoft Excel for iPad',
        back: true,
        question: 'Which of these mobile apps runs on Flutter?');
  }
}
