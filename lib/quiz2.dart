import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:xenous_app/quiz3.dart';
import 'package:xenous_app/wrong2.dart';

class Quiz2 extends StatefulWidget {
  Quiz2({Key? key}) : super(key: key);

  @override
  State<Quiz2> createState() => _Quiz2State();
}

class _Quiz2State extends State<Quiz2> {
  final Stream<QuerySnapshot> _codes =
      FirebaseFirestore.instance.collection('test2').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(7, 7, 7, 1),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
                padding: EdgeInsets.all(21),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    StreamBuilder<QuerySnapshot>(
                      stream: _codes,
                      builder: (BuildContext context,
                          AsyncSnapshot<QuerySnapshot> snapshot) {
                        if (snapshot.hasError) {
                          return const Text('Something went wrong');
                        }

                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Text("Loading");
                        }

                        return ListView(
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          children: snapshot.data!.docs
                              .map((DocumentSnapshot document) {
                                Map<String, dynamic> data =
                                    document.data()! as Map<String, dynamic>;
                                return Column(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(25),
                                      child: Center(
                                        child: Text(data['text'],
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 21,
                                                fontWeight: FontWeight.w700)),
                                      ),
                                    ),
                                    Text('Quiz 2/3',
                                        style: TextStyle(
                                            color:
                                                Colors.white.withOpacity(0.75),
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500)),
                                    SizedBox(
                                      height: 45,
                                    ),
                                    InkWell(
                                      borderRadius: BorderRadius.circular(15),
                                      onTap: () {
                                        int op1bool = data['op1bool'];
                                        void quizCheck(int) {
                                          if (op1bool < 2) {
                                            Navigator.pushAndRemoveUntil(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Wrong2()),
                                              (Route<dynamic> route) => false,
                                            );
                                          } else {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Quiz3()));
                                          }
                                        }

                                        quizCheck(int);
                                      },
                                      child: Container(
                                        child: Row(
                                          children: [
                                            Text(data['op1'],
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w700)),
                                            Spacer(),
                                            Text('#1',
                                                style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        122, 122, 122, 1),
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w700))
                                          ],
                                        ),
                                        width: double.maxFinite,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 15, vertical: 25),
                                        decoration: BoxDecoration(
                                            color:
                                                Colors.black.withOpacity(0.35),
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            border: Border.all(
                                                color: Color.fromRGBO(
                                                    125, 125, 125, 0.35))),
                                      ),
                                    ),
                                    SizedBox(height: 16),
                                    InkWell(
                                      borderRadius: BorderRadius.circular(15),
                                      onTap: () {
                                        int op2bool = data['op2bool'];
                                        void quizCheck(int) {
                                          if (op2bool < 2) {
                                            Navigator.pushAndRemoveUntil(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Wrong2()),
                                              (Route<dynamic> route) => false,
                                            );
                                          } else {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Quiz3()));
                                          }
                                        }

                                        quizCheck(int);
                                      },
                                      child: Container(
                                        child: Row(
                                          children: [
                                            Text(data['op2'],
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w700)),
                                            Spacer(),
                                            Text('#2',
                                                style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        122, 122, 122, 1),
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w700))
                                          ],
                                        ),
                                        width: double.maxFinite,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 15, vertical: 25),
                                        decoration: BoxDecoration(
                                            color:
                                                Colors.black.withOpacity(0.35),
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            border: Border.all(
                                                color: Color.fromRGBO(
                                                    125, 125, 125, 0.35))),
                                      ),
                                    ),
                                    SizedBox(height: 16),
                                    InkWell(
                                      borderRadius: BorderRadius.circular(15),
                                      onTap: () {
                                        int op3bool = data['op3bool'];
                                        void quizCheck(int) {
                                          if (op3bool < 2) {
                                            Navigator.pushAndRemoveUntil(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Wrong2()),
                                              (Route<dynamic> route) => false,
                                            );
                                          } else {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Quiz3()));
                                          }
                                        }

                                        quizCheck(int);
                                      },
                                      child: Container(
                                        child: Row(
                                          children: [
                                            Text(data['op3'],
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w700)),
                                            Spacer(),
                                            Text('#3',
                                                style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        122, 122, 122, 1),
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w700))
                                          ],
                                        ),
                                        width: double.maxFinite,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 15, vertical: 25),
                                        decoration: BoxDecoration(
                                            color:
                                                Colors.black.withOpacity(0.35),
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            border: Border.all(
                                                color: Color.fromRGBO(
                                                    125, 125, 125, 0.35))),
                                      ),
                                    ),
                                    SizedBox(height: 16),
                                    InkWell(
                                      borderRadius: BorderRadius.circular(15),
                                      onTap: () {
                                        int op4bool = data['op4bool'];
                                        void quizCheck(int) {
                                          if (op4bool < 2) {
                                            Navigator.pushAndRemoveUntil(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      Wrong2()),
                                              (Route<dynamic> route) => false,
                                            );
                                          } else {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Quiz3()));
                                          }
                                        }

                                        quizCheck(int);
                                      },
                                      child: Container(
                                        child: Row(
                                          children: [
                                            Text(data['op4'],
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w700)),
                                            Spacer(),
                                            Text('#4',
                                                style: TextStyle(
                                                    color: Color.fromRGBO(
                                                        122, 122, 122, 1),
                                                    fontSize: 16,
                                                    fontWeight:
                                                        FontWeight.w700))
                                          ],
                                        ),
                                        width: double.maxFinite,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 15, vertical: 25),
                                        decoration: BoxDecoration(
                                            color:
                                                Colors.black.withOpacity(0.35),
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            border: Border.all(
                                                color: Color.fromRGBO(
                                                    125, 125, 125, 0.35))),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 25,
                                    ),
                                    Text('The answer in:',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w700)),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Container(
                                      child: Row(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.all(21),
                                            child: Text(data['adText'],
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w700)),
                                          ),
                                          Spacer(),
                                          InkWell(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            onTap: () => launch(data['adlink']),
                                            child: Container(
                                              padding: EdgeInsets.all(21),
                                              alignment: Alignment.center,
                                              child: Text('Subscribe',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 16,
                                                      fontWeight:
                                                          FontWeight.w700)),
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          15)),
                                            ),
                                          )
                                        ],
                                      ),
                                      decoration: BoxDecoration(
                                          color: Colors.black.withOpacity(0.35),
                                          border: Border.all(
                                              color: Colors.white
                                                  .withOpacity(0.35)),
                                          borderRadius:
                                              BorderRadius.circular(15)),
                                    )
                                  ],
                                );
                              })
                              .toList()
                              .cast(),
                        );
                      },
                    ),
                  ],
                ),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/back.png'),
                        fit: BoxFit.cover))),
          ],
        ),
      ),
    );
  }
}
