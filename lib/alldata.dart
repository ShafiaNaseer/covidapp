import 'dart:convert';
import 'dart:developer';

import 'package:covidapp/Covid_Model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class alldata extends StatefulWidget {
  const alldata({Key? key}) : super(key: key);

  @override
  State<alldata> createState() => _alldataState();
}

class _alldataState extends State<alldata> {

  CovidModel covidModel = CovidModel();

  bool loading = true;
  initState() {
    super.initState();
    getData();
  }

  getData() async {
    setState(() {
      loading = true;
    });
    log("Api Calling..... ");
    var api = "https://api.coronavirus.data.gov.uk/v1/data";
    var response = await http.get(
      Uri.parse(api),
      // headers: {
      //   'Content-Type': 'application/json',
      // }
    );
    print(response.statusCode);
  //  print("Body: ${response.body}");

    if (response.statusCode == 200) {
      setState(() {

        covidModel = covidModelFromJson(response.body);

        // dataRec = responsebody['data'];
        // log('List $dataRec');
     //   log('$responsebody');
      });
    //  print('Data: $responsebody');
    } else {
      print("Server Error! ");
    }
    log("Api Okey... ");
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage("profile.jpg"),
                      radius: 30,
                    ),
                  ],
                ),
              ),
              Container(
                height: size.height * 0.2,
                width: size.width,
                margin: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
               // decoration: BoxDecoration(color: Colors.white),
                child: Stack(children: [
                  Positioned(
                    top: 25,
                    child: Container(
                      height: 140,
                      width: size.width * 0.87,
                      // margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                      decoration: BoxDecoration(
                          color: Color(0xffCFE3FC),
                          borderRadius: BorderRadius.circular(30)),
                    ),
                  ),
                  Positioned(
                    left: 20,
                    top: 7,
                    child: Image.asset("dr.png"),
                  ),
                  Positioned(
                      top: 40,
                      right: 10,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Know safety tips and \nprecautions from \ntop Doctors.",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 16),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Container(
                            height: 29,
                            width: 61,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Color(0xff9156EC)),
                            child: Center(
                                child: Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            )),
                          )
                        ],
                      ))
                ]),
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 12, vertical: 15),
                decoration: BoxDecoration(
                    color: Color(0xffF49E6F).withOpacity(0.6),
                    borderRadius: BorderRadius.circular(50)),
                child: DefaultTabController(
                  length: 2,
                  child: TabBar(
                    tabs: [
                      Tab(
                        text: "Tracker",
                      ),
                      Tab(
                        text: "Symptoms",
                      ),
                    ],
                    labelPadding: EdgeInsets.only(left: 30, right: 30),
                    unselectedLabelColor: Color(0xffA74813),
                    indicatorColor: Colors.cyan,
                    indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white),
                    labelColor: Colors.black,
                    padding: EdgeInsets.all(10),
                    labelStyle:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Wrap(
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 20,
                  runSpacing: 20,
                  children: [
                    Container(
                      height: 130,
                      padding: EdgeInsets.all(15),
                      width: size.width * 0.4,
                      decoration: BoxDecoration(
                          color: Colors.red.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Confirmed",
                                style: TextStyle(
                                  fontSize: 19,
                                  color: Colors.red,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 35,
                          ),
                          loading == true
                              ? Text("Loading...")
                              : Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      covidModel.requestPayload!.structure!.areaName
                                          .toString(),
                                      style: TextStyle(
                                        fontSize: 22,
                                        color: Colors.red,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                )
                        ],
                      ),
                    ),
                    Container(
                      height: 130,
                      padding: EdgeInsets.all(15),
                      width: size.width * 0.4,
                      decoration: BoxDecoration(
                          color: Colors.blue.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Death",
                                style: TextStyle(
                                  fontSize: 19,
                                  color: Colors.blueAccent,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 35,
                          ),
                          loading == true
                              ? Text("Loading...")
                              : Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      covidModel.data![0].date!.toString(),
                                      style: TextStyle(
                                        fontSize: 22,
                                        color: Colors.blueAccent,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                )
                        ],
                      ),
                    ),
                    Container(
                      height: 130,
                      padding: EdgeInsets.all(15),
                      width: size.width * 0.4,
                      decoration: BoxDecoration(
                          color: Colors.green.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Latest",
                                style: TextStyle(
                                  fontSize: 19,
                                  color: Colors.green,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 35,
                          ),
                          loading == true
                              ? Text("Loading...")
                              : Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      covidModel.data![0]!.date!.toString()
                                          ,
                                      style: TextStyle(
                                        fontSize: 22,
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                )
                        ],
                      ),
                    ),
                    Container(
                      height: 130,
                      padding: EdgeInsets.all(15),
                      width: size.width * 0.4,
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.2),
                          borderRadius: BorderRadius.circular(20)),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Total Death",
                                style: TextStyle(
                                  fontSize: 19,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 35,
                          ),
                          loading == true
                              ? Text("Loading...")
                              : Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Text(
                                      covidModel.data![0]!.date!.toString(),
                                      style: TextStyle(
                                        fontSize: 22,
                                        color: Colors.grey,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                )
                        ],
                      ),
                    ),
                  ]),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "All List",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Date",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
                  ),
                  Text(
                    "Latest",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
                  ),
                  Text(
                    "Confirmed",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
                  ),
                  Text(
                    "NewDeath",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
                  ),
                  Text(
                    "TotalDeath",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
                  ),
                ],
              ),
              loading == true
                  ? Text("Loading...")
                  : Container(
                       height: MediaQuery.of(context).size.height * 0.8,
                      child: ListView.builder(
                          itemCount: covidModel.data!.length,
                          itemBuilder: (context, i) {
                            return Container(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              margin: EdgeInsets.symmetric(vertical: 10),
                              color: Colors.blue.withOpacity(0.2),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    covidModel.data![i].date!.toString(),
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    covidModel.data![i]!.confirmed!.toString(),
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  Text(
                                    covidModel.data![i]!.confirmedRate!.toString(),
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),

                                  Text(
                                    covidModel.data![i]!.confirmedRate!.toString(),
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),

                                  Text(
                                    covidModel.data![i]!.confirmedRate!.toString(),
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }),
                    )
            ],
          ),
        ),
      ),
    );
  }
}
