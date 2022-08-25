import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:odc/widget/course_exam.dart';

import '../../shared/componant/componant.dart';
import 'exam_question6.dart';

class ExamQeustion5 extends StatefulWidget {
  const ExamQeustion5({Key? key}) : super(key: key);

  @override
  State<ExamQeustion5> createState() => _ExamQeustion5State();
}

class _ExamQeustion5State extends State<ExamQeustion5> {
  @override
  Widget build(BuildContext context) {
    return CourseQuestion(
        count: 5,
        answer1: 'Mac',
        answer2: 'Windows',
        answer3: 'All Of above',
        back: true,
        question:
            'What operating systems can you install the Flutter development environment on?',
            onTapBack: (){
              Navigator.pop;
            },
            onTap: (){
              navigatTo(context, ExamQuestion6());
            },);
  }
}
