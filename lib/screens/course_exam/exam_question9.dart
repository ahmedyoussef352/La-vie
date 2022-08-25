import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:odc/screens/course_exam/exam_question10.dart';
import 'package:odc/shared/componant/componant.dart';
import 'package:odc/widget/course_exam.dart';

class ExamQuestion9 extends StatefulWidget {
  const ExamQuestion9({Key? key}) : super(key: key);

  @override
  State<ExamQuestion9> createState() => _ExamQuestion9State();
}

class _ExamQuestion9State extends State<ExamQuestion9> {
  @override
  Widget build(BuildContext context) {
    return CourseQuestion(
        count: 9,
        answer1: 'Android studio',
        onTapBack: (){
              Navigator.pop;
            },
            onTap: (){
              navigatTo(context, Examquestion10());
            },
        answer2: 'visual studio',
        answer3: 'intelliJ IDEA',
        back: true,
        question: 'What are the best editors for flutter development?');
  }
}
