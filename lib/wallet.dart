import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Wallet extends StatefulWidget {
  Wallet({Key? key}) : super(key: key);

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {
  final Stream<QuerySnapshot> _codes =
      FirebaseFirestore.instance.collection('gift-cards').snapshots();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: Color.fromRGBO(7, 7, 7, 1),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 58,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 30),
                    child: Text('Codes',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w600)),
                  ),
                  StreamBuilder<QuerySnapshot>(
                    stream: _codes,
                    builder: (BuildContext context,
                        AsyncSnapshot<QuerySnapshot> snapshot) {
                      if (snapshot.hasError) {
                        return const Text('Something went wrong');
                      }

                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Text("Loading");
                      }

                      return ListView(
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        children: snapshot.data!.docs
                            .map((DocumentSnapshot document) {
                              Map<String, dynamic> data =
                                  document.data()! as Map<String, dynamic>;
                              return Padding(
                                padding: EdgeInsets.symmetric(horizontal: 25),
                                child: Container(
                                  padding: EdgeInsets.all(15),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Container(
                                        child: TabBar(
                                          indicator: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(7)),
                                          tabs: [
                                            Tab(
                                                child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Image.asset(
                                                    'assets/xecode1.png',
                                                    height: 19),
                                                SizedBox(
                                                  width: 7,
                                                ),
                                                Text('CODE 1',
                                                    style: TextStyle(
                                                        color: Color.fromRGBO(
                                                            225, 18, 34, 1),
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w700))
                                              ],
                                            )),
                                            Tab(
                                                child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Image.asset(
                                                    'assets/xecode2.png',
                                                    height: 19),
                                                SizedBox(
                                                  width: 7,
                                                ),
                                                Text('CODE 2',
                                                    style: TextStyle(
                                                        color: Color.fromRGBO(
                                                            240, 185, 11, 1),
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w700))
                                              ],
                                            )),
                                            Tab(
                                                child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Image.asset(
                                                    'assets/xecode3.png',
                                                    height: 19),
                                                SizedBox(
                                                  width: 7,
                                                ),
                                                Text('CODE 3',
                                                    style: TextStyle(
                                                        color: Color.fromRGBO(
                                                            75, 75, 75, 1),
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.w700))
                                              ],
                                            )),
                                          ],
                                        ),
                                        decoration: BoxDecoration(
                                            color:
                                                Color.fromRGBO(28, 28, 28, 1),
                                            borderRadius:
                                                BorderRadius.circular(7)),
                                      ),
                                      SizedBox(
                                        height: 25,
                                      ),
                                      Expanded(
                                        child: TabBarView(children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(data['code1'],
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w700)),
                                              SizedBox(
                                                height: 21,
                                              ),
                                              InkWell(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  onTap: () {
                                                    Clipboard.setData(
                                                        ClipboardData(
                                                            text:
                                                                data['code1']));
                                                    showDialog(
                                                        context: context,
                                                        builder:
                                                            (context) =>
                                                                AlertDialog(
                                                                  shape: RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              25),
                                                                      side: BorderSide(
                                                                          color: Color.fromRGBO(
                                                                              48,
                                                                              48,
                                                                              48,
                                                                              0.35))),
                                                                  titleTextStyle: TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          21,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700),
                                                                  backgroundColor:
                                                                      Color.fromRGBO(
                                                                          18,
                                                                          18,
                                                                          18,
                                                                          0.35),
                                                                  contentTextStyle: TextStyle(
                                                                      color: Color.fromRGBO(
                                                                          181,
                                                                          181,
                                                                          181,
                                                                          1),
                                                                      fontSize:
                                                                          18,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400),
                                                                  title: Center(
                                                                      child: Text(
                                                                          'Copied!')),
                                                                  content: Text(
                                                                      'Your code has been copied.'),
                                                                ));
                                                  },
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    child: Text('Copy',
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700)),
                                                    width: 137.29,
                                                    height: 47,
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10)),
                                                  ))
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(data['code2'],
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w700)),
                                              SizedBox(
                                                height: 21,
                                              ),
                                              InkWell(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  onTap: () {
                                                    Clipboard.setData(
                                                        ClipboardData(
                                                            text:
                                                                data['code2']));
                                                    showDialog(
                                                        context: context,
                                                        builder:
                                                            (context) =>
                                                                AlertDialog(
                                                                  shape: RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              25),
                                                                      side: BorderSide(
                                                                          color: Color.fromRGBO(
                                                                              48,
                                                                              48,
                                                                              48,
                                                                              0.35))),
                                                                  titleTextStyle: TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          21,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700),
                                                                  backgroundColor:
                                                                      Color.fromRGBO(
                                                                          18,
                                                                          18,
                                                                          18,
                                                                          0.35),
                                                                  contentTextStyle: TextStyle(
                                                                      color: Color.fromRGBO(
                                                                          181,
                                                                          181,
                                                                          181,
                                                                          1),
                                                                      fontSize:
                                                                          18,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400),
                                                                  title: Center(
                                                                      child: Text(
                                                                          'Copied!')),
                                                                  content: Text(
                                                                      'Your code has been copied.'),
                                                                ));
                                                  },
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    child: Text('Copy',
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700)),
                                                    width: 137.29,
                                                    height: 47,
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10)),
                                                  ))
                                            ],
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Text(data['code3'],
                                                  style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.w700)),
                                              SizedBox(
                                                height: 21,
                                              ),
                                              InkWell(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  onTap: () {
                                                    Clipboard.setData(
                                                        ClipboardData(
                                                            text:
                                                                data['code3']));
                                                    showDialog(
                                                        context: context,
                                                        builder:
                                                            (context) =>
                                                                AlertDialog(
                                                                  shape: RoundedRectangleBorder(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              25),
                                                                      side: BorderSide(
                                                                          color: Color.fromRGBO(
                                                                              48,
                                                                              48,
                                                                              48,
                                                                              0.35))),
                                                                  titleTextStyle: TextStyle(
                                                                      color: Colors
                                                                          .white,
                                                                      fontSize:
                                                                          21,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w700),
                                                                  backgroundColor:
                                                                      Color.fromRGBO(
                                                                          18,
                                                                          18,
                                                                          18,
                                                                          0.35),
                                                                  contentTextStyle: TextStyle(
                                                                      color: Color.fromRGBO(
                                                                          181,
                                                                          181,
                                                                          181,
                                                                          1),
                                                                      fontSize:
                                                                          18,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w400),
                                                                  title: Center(
                                                                      child: Text(
                                                                          'Copied!')),
                                                                  content: Text(
                                                                      'Your code has been copied.'),
                                                                ));
                                                  },
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    child: Text('Copy',
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontSize: 12,
                                                            fontWeight:
                                                                FontWeight
                                                                    .w700)),
                                                    width: 137.29,
                                                    height: 47,
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10)),
                                                  ))
                                            ],
                                          ),
                                        ]),
                                      )
                                    ],
                                  ),
                                  alignment: Alignment.center,
                                  height: 245,
                                  decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.35),
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(
                                          color: Color.fromRGBO(
                                              62, 62, 62, 0.35))),
                                ),
                              );
                            })
                            .toList()
                            .cast(),
                      );
                    },
                  ),
                ],
              ),
              height: 450,
              alignment: Alignment.centerLeft,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/back.png'), fit: BoxFit.cover)),
            ),
          ],
        ),
      ),
    );
  }
}
