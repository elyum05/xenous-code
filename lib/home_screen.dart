import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:xenous_app/quiz1.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    showInfo();
  }

  showInfo() async {
    await Future.delayed(Duration(milliseconds: 1500));
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25),
                  side: BorderSide(color: Color.fromRGBO(48, 48, 48, 0.35))),
              titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 21,
                  fontWeight: FontWeight.w700),
              backgroundColor: Color.fromRGBO(12, 12, 12, 0.75),
              contentTextStyle: TextStyle(
                  color: Color.fromRGBO(181, 181, 181, 1),
                  fontSize: 18,
                  fontWeight: FontWeight.w400),
              title: Center(child: Text("Welcome to Xenous!")),
              content: Text(
                  'To get a gift code you need to pass a short quiz. There will be only one question, just like the answer. You will find the answer to the question in the channel, the link to which will be in the quiz.'),
            ));
  }

  final Stream<QuerySnapshot> _codes =
      FirebaseFirestore.instance.collection('gift-cards').snapshots();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(7, 7, 7, 1),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 30,
          ),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(25),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              RichText(
                                text: TextSpan(
                                    text: 'X',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: 'Anurati',
                                        fontSize: 28),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: 'enous',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 28,
                                              fontWeight: FontWeight.w500))
                                    ]),
                              ),
                              Text("You're welcome.",
                                  style: TextStyle(
                                      color: Color.fromRGBO(176, 176, 176, 1),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500)),
                            ],
                          ),
                          Spacer(),
                          InkWell(
                            borderRadius: BorderRadius.circular(150),
                            onTap: () {
                              showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(25),
                                            side: BorderSide(
                                                color: Color.fromRGBO(
                                                    48, 48, 48, 0.35))),
                                        titleTextStyle: TextStyle(
                                            color: Colors.white,
                                            fontSize: 21,
                                            fontWeight: FontWeight.w700),
                                        backgroundColor:
                                            Color.fromRGBO(12, 12, 12, 0.75),
                                        contentTextStyle: TextStyle(
                                            color: Color.fromRGBO(
                                                181, 181, 181, 1),
                                            fontSize: 18,
                                            fontWeight: FontWeight.w400),
                                        title: Center(
                                            child: Text("Welcome to Xenous!")),
                                        content: Text(
                                            'To get a gift code you need to pass a short quiz. There will be only one question, just like the answer. You will find the answer to the question in the channel, the link to which will be in the quiz.'),
                                      ));
                            },
                            child: Image.asset('assets/info.png', height: 40),
                          )
                        ],
                      ),
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
                                  return RichText(
                                    text: TextSpan(
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 25,
                                            fontWeight: FontWeight.w500),
                                        text: data['aval'],
                                        children: <TextSpan>[
                                          TextSpan(text: ' codes available')
                                        ]),
                                  );
                                })
                                .toList()
                                .cast(),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(21),
                  child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 35, vertical: 25),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image.asset('assets/box1.png', height: 88),
                          Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("Let's Go!",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 28,
                                      fontWeight: FontWeight.w700)),
                              SizedBox(
                                height: 15,
                              ),
                              InkWell(
                                borderRadius: BorderRadius.circular(15),
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Quiz1()));
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 21, vertical: 15),
                                  alignment: Alignment.center,
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Icon(Icons.play_circle_fill, size: 18),
                                      Text(' Start quiz',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w600))
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(15)),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                            Color.fromRGBO(0, 10, 35, 1),
                            Color.fromRGBO(3, 91, 86, 1)
                          ]),
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(
                              color: Color.fromRGBO(21, 16, 65, 1)))),
                ),
                SizedBox(height: 75)
              ],
            ),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/back.png'), fit: BoxFit.cover)),
          )
        ],
      ),
    );
  }
}
