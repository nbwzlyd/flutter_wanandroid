import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/questionAndAnswer/bean/ques_and_answer.dart';
import 'package:flutter_html/flutter_html.dart';

class QuesAndAnswerView extends StatefulWidget {
  final QuesAndAnsewerDetails quesAndAnswerDeatailBean;

  const QuesAndAnswerView({Key key, @required this.quesAndAnswerDeatailBean})
      : super(key: key);

  @override
  State<QuesAndAnswerView> createState() => _QuesAndAnswerViewState();
}

class _QuesAndAnswerViewState extends State<QuesAndAnswerView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(12))),
        shadowColor: Colors.black12,
        elevation: 4,
        child: Padding(
          padding:EdgeInsets.fromLTRB(12,10,10,0) ,
          child: Column(
            children: [
              Text(
                widget.quesAndAnswerDeatailBean.title,
                style: TextStyle(
                    color: Colors.deepOrangeAccent,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
              Html(data: widget.quesAndAnswerDeatailBean.desc)
            ],
          ),
        )



      ),
    );
  }
}
