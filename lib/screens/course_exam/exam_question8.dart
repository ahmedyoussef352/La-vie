import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:odc/screens/course_exam/exam_question9.dart';
import 'package:odc/widget/course_exam.dart';

import '../../shared/componant/componant.dart';

class ExamQuestion8 extends StatefulWidget {
  const ExamQuestion8({Key? key}) : super(key: key);

  @override
  State<ExamQuestion8> createState() => _ExamQuestion8State();
}

class _ExamQuestion8State extends State<ExamQuestion8> {
  @override
  Widget build(BuildContext context) {
    return CourseQuestion(
        count: 8,
        onTapBack: (){
              Navigator.pop;
            },
            onTap: (){
              navigatTo(context, ExamQuestion9());
            },
        answer1: 'Flutter is used to make desktop apps',
        answer2: 'Flutter is a UI toolkit made by Apple',
        answer3: 'Flutter is a UI toolkit used for creating high quality apps',
        back: true,
        question: 'What is Flutter?');
  }
}
