import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:odc/screens/course_exam/exam_question4.dart';
import 'package:odc/widget/course_exam.dart';

import '../../shared/componant/componant.dart';

class ExamQuestion3 extends StatefulWidget {
  const ExamQuestion3({Key? key}) : super(key: key);

  @override
  State<ExamQuestion3> createState() => _ExamQuestion3State();
}

class _ExamQuestion3State extends State<ExamQuestion3> {
  @override
  Widget build(BuildContext context) {
    return CourseQuestion(count: 3,
    onTapBack: (){
              Navigator.pop;
            },
            onTap: (){
              navigatTo(context, Examquestion4());
            },
     answer1: 'Ahead-of-time (AOT)',
      answer2: 'ahed-of-code (AOC)', answer3: 'Both A & B',
       back: true, question: 'Due to App Store restrictions on dynamic code execution, Flutter apps use __________ compilation on iOS.');
    
  }
}