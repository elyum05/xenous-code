import 'package:flutter/material.dart';
import 'package:xenous_app/body.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(7, 7, 7, 1),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Image.asset('assets/xenous.png', height: 152),
            height: 450,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/back.png'), fit: BoxFit.cover)),
          ),
          Spacer(),
          Padding(
            padding: EdgeInsets.only(left: 35, right: 35, bottom: 85),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Welcome to the',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w500)),
                Text('XENOUS',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.w700)),
                SizedBox(
                  height: 75,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(16),
                    onTap: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Body())),
                    child: Container(
                      alignment: Alignment.center,
                      width: 60,
                      height: 52,
                      child: Image.asset('assets/forrd.png', height: 30),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(16)),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
