import 'package:flutter/cupertino.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:odc/screens/home/home_page.dart';
import 'package:odc/shared/componant/componant.dart';
import 'package:odc/widget/course_exam.dart';

class Examquestion10 extends StatefulWidget {
  const Examquestion10({Key? key}) : super(key: key);

  @override
  State<Examquestion10> createState() => _Examquestion10State();
}

class _Examquestion10State extends State<Examquestion10> {
  @override
  Widget build(BuildContext context) {
    return CourseQuestion(
        count: 10,
        answer1: 'ListView',
        onTapBack: (){
              Navigator.pop;
            },
            onTap: (){
              navigatTo(context, Home());
            },
        answer2: 'Stack',
        answer3: 'Expanded',
        back: true,
        question:
            'Which of the following widgets used for repeating the content');
  }
}
