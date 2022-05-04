import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:rozklad_ddpu/Pages/Home/components/days.dart';
import 'package:rozklad_ddpu/Pages/Home/components/lesson_bundel_card.dart';
import 'package:rozklad_ddpu/constants.dart';

class Body extends StatelessWidget {
  const Body({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        ),
        Days(),
        Expanded(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5.0),
          child: StreamBuilder<QuerySnapshot>(
              stream: Firestore.instance.collection('lessons').snapshots(),
              builder: (BuildContext context,
                  AsyncSnapshot<QuerySnapshot> snapshot) {
                return GridView.builder(
                  itemCount: snapshot.data.documents.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      mainAxisSpacing: 20,
                      childAspectRatio: 2.55),
                  itemBuilder: (BuildContext context, int index) {
                    return LessonBundelCard(
                      lesson: LessonBundelCard(),
                      press: () {},
                    );
                  },
                );
              }),
        ))
      ],
    );
  }
}
