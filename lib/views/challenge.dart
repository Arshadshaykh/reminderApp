import 'package:flutter/material.dart';
import 'package:reminder/utils/appbar.dart';

class Challange extends StatefulWidget {
  const Challange({super.key});

  @override
  State<Challange> createState() => CchallangeState();
}

class CchallangeState extends State<Challange> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff242C3B),
        // appBar: CustomAppBar(title: '', backgroundColor: Color(0xff242C3B),),
        body: Container(
          child: Column(
            children: [
              SizedBox(
                height: 18,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 25,
                  ),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 44,
                        height: 44,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [
                              Color.fromARGB(255, 110, 228, 255),
                              Color.fromARGB(221, 29, 26, 233)
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          boxShadow: const [
                            BoxShadow(
                                offset: Offset(0, -20),
                                color: Color(0xff2B3445),
                                blurRadius: 30,
                                spreadRadius: 0),
                            BoxShadow(
                                offset: Offset(0, 20),
                                color: Color(0xff10141C),
                                blurRadius: 30,
                                spreadRadius: 0)
                          ],
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [Color(0XFF34C8E8), Color(0xff4E4AF2)],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                          ),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ],
                  ),
                  Text('title')
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
