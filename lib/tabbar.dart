import 'package:flutter/material.dart';

class tabbar extends StatefulWidget {
  const tabbar({Key? key}) : super(key: key);

  @override
  State<tabbar> createState() => _tabbarState();
}

class _tabbarState extends State<tabbar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 12, vertical: 20),
        decoration: BoxDecoration(
            color: Color(0xffF49E6F).withOpacity(0.6),
          borderRadius:BorderRadius.circular(50)
        ),
        child: DefaultTabController(
          length: 2,
          child: TabBar(
            tabs: [
              Tab(text: "Tracker",),
              Tab(text: "Symptoms",),
            ],
            labelPadding: EdgeInsets.only(left: 30, right: 30),
            unselectedLabelColor: Color(0xffA74813),
            indicatorColor: Colors.cyan,
            indicator: BoxDecoration(
              borderRadius: BorderRadius.circular(50),
              color: Colors.white
            ),
            labelColor: Colors.black,
            padding: EdgeInsets.all(10),
            labelStyle: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),
          ),
        ),
      ),
    );
  }
}
