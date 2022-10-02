import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class Channel extends StatefulWidget {
  Channel({Key? key}) : super(key: key);

  @override
  State<Channel> createState() => _ChannelState();
}

class _ChannelState extends State<Channel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(7, 7, 7, 1),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            child: Column(
              children: [
                SizedBox(height: 65),
                Text('Subscribe on our channel\nto get more freebie',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 21,
                        fontWeight: FontWeight.w700)),
                SizedBox(
                  height: 45,
                ),
                Padding(
                  padding: EdgeInsets.all(25),
                  child: Container(
                    padding: EdgeInsets.all(15),
                    alignment: Alignment.center,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('FREEBIE CRYPTOBOX',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 21,
                                    fontWeight: FontWeight.w700)),
                            SizedBox(
                              height: 15,
                            ),
                            InkWell(
                              // ignore: deprecated_member_use
                              onTap: () =>
                                  launch('https://t.me/perehodnikkalyan'),
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15)),
                                width: 135,
                                height: 52,
                                alignment: Alignment.center,
                                child: Text('Subscribe',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w700)),
                              ),
                            )
                          ],
                        ),
                        Spacer(),
                      ],
                    ),
                    height: 150,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/cback.png'),
                          fit: BoxFit.cover,
                          opacity: 0.15),
                      borderRadius: BorderRadius.circular(15),
                      gradient: SweepGradient(colors: [
                        Color.fromRGBO(0, 87, 255, 1),
                        Color.fromARGB(255, 51, 21, 90)
                      ], transform: GradientRotation(1.57)),
                    ),
                  ),
                ),
                SizedBox(
                  height: 75,
                )
              ],
            ),
            alignment: Alignment.center,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/back.png'), fit: BoxFit.cover)),
          )
        ],
      ),
    );
  }
}
