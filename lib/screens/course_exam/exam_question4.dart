import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:odc/screens/course_exam/exam_question5.dart';
import 'package:odc/shared/componant/componant.dart';
import 'package:odc/widget/course_exam.dart';

class Examquestion4 extends StatefulWidget {
  const Examquestion4({Key? key}) : super(key: key);

  @override
  State<Examquestion4> createState() => _Examquestion4State();
}

class _Examquestion4State extends State<Examquestion4> {
  @override
  Widget build(BuildContext context) {
    return CourseQuestion(
        count: 6,
        answer1: 'Expanded',
        answer2: 'Inkwell',
        answer3: 'Column',
        back: true,
        onTapBack: (){
              Navigator.pop;
            },
            onTap: (){
              navigatTo(context, ExamQeustion5());
            },
        question: 'Which of the following widgets use for layout ?');
  }
}
