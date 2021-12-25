import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Info extends StatelessWidget {
  const Info({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Why me"),
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: const [
                Text(
                  "Why Should You Hire me ?",
                  style: TextStyle(
                      color: Colors.redAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
                Text(
                  "I think I have completed the task you given on a reasonable time period and I have enough skills to do other jobs in your company ,So 😁😁 You can consider me or you can say You should not miss me joining in..",
                  style: TextStyle(
                      color: Colors.greenAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 26),
                ),
                Text(
                  "What do I Expect From This Internship ?",
                  style: TextStyle(
                      color: Colors.redAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 30),
                ),
                Text(
                  "I want to have some industry experience and gain more knowledge in this field in the same time contribute to the company which will be beneficiary for everyone ,I wish to grow my network from my colleagues to learn more about flutter development",
                  style: TextStyle(
                      color: Colors.greenAccent,
                      fontWeight: FontWeight.bold,
                      fontSize: 26),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
