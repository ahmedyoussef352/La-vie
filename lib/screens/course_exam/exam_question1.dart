import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:odc/screens/course_exam/exam_question2.dart';
import 'package:odc/shared/componant/componant.dart';
import 'package:odc/widget/course_exam.dart';

class ExamQuestion1 extends StatefulWidget {
  const ExamQuestion1({Key? key}) : super(key: key);

  @override
  State<ExamQuestion1> createState() => _ExamQuestion1State();
}

class _ExamQuestion1State extends State<ExamQuestion1> {
  @override
  Widget build(BuildContext context) {
    return CourseQuestion( count: 1,
            question: 'What is the user experience?',
            answer1:
                'The user experience is how the developer feels about a user.',
            answer2:
                'The user experience is how the user feels about interacting with or experiencing aproduct.',
            answer3:
                'The user experience is the attitude the UX designer has about a product.',
            back: false,
            onTap: (){
              navigatTo(context, ExamQuestion2());
            },
            onTapBack: (){
              Navigator.pop;
            },);
    
  }
}