import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rozklad_ddpu/constants.dart';

class LessonBundelCard extends StatelessWidget {
  final LessonBundelCard lesson;
  final Function press;

  const LessonBundelCard({Key key, this.press, this.lesson}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(24),
            gradient: LinearGradient(
                colors: [
                  Colors.teal[800],
                  Colors.tealAccent[700]
                ], //підкоригувати
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
            boxShadow: [
              BoxShadow(
                color: Colors.teal,
                blurRadius: 12,
                offset: Offset(0, 6),
              ),
            ]),
        child: Row(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(kDefaultPadding),
                child: StreamBuilder(
                    stream:
                        Firestore.instance.collection('lessons').snapshots(),
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      List<Widget> myDoc;
                      if (!snapshot.hasData)
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      for (var i = 0; i < snapshot.data.documents.length; i++) {
                        return ListView(
                          children: snapshot.data.documents.map((document) {
                            return Center(
                              child: Container(
                                width: MediaQuery.of(context).size.width / 1.2,
                                height: MediaQuery.of(context).size.height / 6,
                                child: Text(
                                    "Lesson Name" + document['lesson_name']),
                              ),
                            );
                          }).toList(),
                        );
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        // children: <Widget>[
                        //   Spacer(),
                        //   Text(
                        //     snapshot.data.documents[i]['lesson_name'],
                        //     style: TextStyle(
                        //         fontSize: 19, fontWeight: FontWeight.w500),
                        //     maxLines: 2,
                        //     overflow: TextOverflow.ellipsis,
                        //   ),
                        //   SizedBox(height: 5),
                        //   Text(
                        //     snapshot.data.documents[i]['lecturer'],
                        //     style:
                        //         TextStyle(fontSize: 15, color: Colors.white),
                        //     maxLines: 2,
                        //     overflow: TextOverflow.ellipsis,
                        //   ),
                        //   SizedBox(height: 20),
                        //   buildInfoRow(
                        //       iconSrc: Icon(
                        //         Icons.location_on,
                        //         color: Colors.white,
                        //       ),
                        //       text:
                        //           "${snapshot.data.documents[i]['audience']} аудиторія"),
                        //   Spacer(),
                        // ],

                      }
                      return Column(children: myDoc);
                    }),
              ),
            ),
            Expanded(
              child: StreamBuilder(
                  stream: Firestore.instance.collection('lessons').snapshots(),
                  builder: (context, snapshot) {
                    if (!snapshot.hasData)
                      return Text('Загрузка даних... Зачекайте будь ласка...');
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          snapshot.data.documents[0]['time'].toString(),
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }

  Row buildInfoRow({Icon iconSrc, text}) {
    return Row(
      children: [
        iconSrc,
        Text(
          text,
          style: TextStyle(fontSize: 15, color: Colors.white),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
