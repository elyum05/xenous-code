import 'package:flutter/material.dart';
import 'package:xenous_app/first_screen.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    navHome();
  }

  navHome() async {
    await Future.delayed(Duration(milliseconds: 2100));
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => FirstScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(7, 7, 7, 1),
      body: Center(
        child: Text('XENOUS',
            style: TextStyle(
                letterSpacing: 23,
                color: Colors.white,
                fontFamily: 'Anurati',
                fontSize: 18)),
      ),
    );
  }
}
