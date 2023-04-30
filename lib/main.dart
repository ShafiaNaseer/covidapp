
import 'package:covidapp/practice.dart';
import 'package:flutter/material.dart';

import 'alldata.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CovidApp(),
    );
  }
}

class CovidApp extends StatefulWidget {
  const CovidApp({Key? key}) : super(key: key);

  @override
  State<CovidApp> createState() => _CovidAppState();
}

class _CovidAppState extends State<CovidApp> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        child: Stack(
          children: [
            Image.asset(
              "covidd.png",
              width: size.width,
            ),
            Positioned(
                bottom: 0,
                child: Container(
                  padding: EdgeInsets.all(25),
                  height: 340,
                  width: size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30),
                        topLeft: Radius.circular(30)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Be aware \nStay healthy",
                        style: TextStyle(fontSize: 38),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Welcome to COVID-19 information portal.",
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(
                        height: 70,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Get Started",
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Container(
                            decoration: BoxDecoration(
                                color: Color(0xff9156EC),
                              shape: BoxShape.circle
                            ),
                            child: IconButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => alldata(),));
                                },
                                icon: Icon(Icons.arrow_forward, color: Colors.white,)),
                          )
                        ],
                      )
                    ],
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
