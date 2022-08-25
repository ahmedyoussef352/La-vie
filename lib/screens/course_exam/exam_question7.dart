import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:odc/screens/course_exam/exam_question8.dart';
import 'package:odc/shared/componant/componant.dart';
import 'package:odc/widget/course_exam.dart';

class ExamQuestion7 extends StatefulWidget {
  const ExamQuestion7({Key? key}) : super(key: key);

  @override
  State<ExamQuestion7> createState() => _ExamQuestion7State();
}

class _ExamQuestion7State extends State<ExamQuestion7> {
  @override
  Widget build(BuildContext context) {
    return CourseQuestion(
        count: 7,
        answer1: 'debug()',
        onTapBack: (){
              Navigator.pop;
            },
            onTap: (){
              navigatTo(context, ExamQuestion8());
            },
        answer2: 'build()',
        answer3: 'runApp()',
        back: true,
        question:
            'Which of these functions contain the code which houses the widgets of your app?');
  }
}
