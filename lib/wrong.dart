import 'package:flutter/material.dart';
import 'package:timer_button/timer_button.dart';
import 'package:xenous_app/quiz1.dart';

class Wrong extends StatelessWidget {
  const Wrong({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(7, 7, 7, 1),
      body: Column(
        children: [
          SizedBox(
            height: 85,
          ),
          Center(
              child: Text('Wrong answer!',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.w700))),
          Padding(
            padding: EdgeInsets.all(45),
            child: Image.asset('assets/wrong.png', height: 125),
          ),
          SizedBox(
            height: 25,
          ),
          Text('The answer is wrong!\nPlease, try again.',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.white.withOpacity(0.65),
                  fontSize: 18,
                  fontWeight: FontWeight.w500)),
          SizedBox(
            height: 115,
          ),
          SizedBox(
            width: 158,
            height: 52,
            child: TimerButton(
              buttonType: ButtonType.ElevatedButton,
              label: 'Try again',
              timeOutInSeconds: 20,
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Quiz1()));
              },
              color: Colors.white,
              activeTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700),
            ),
          )
        ],
      ),
    );
  }
}
