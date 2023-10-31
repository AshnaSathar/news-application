import 'package:flutter/material.dart';
import 'package:flutter_application_1/colorconstant.dart';
import 'package:flutter_application_1/controller/controller.dart';
import 'package:flutter_application_1/view/Home/contents.dart';
import 'package:flutter_application_1/view/Home/showBottom.dart';
import 'package:flutter_application_1/view/Home/showdrawer.dart';
import 'package:flutter_application_1/view/Home/sorted.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    gertData();
    super.initState();
  }

  gertData() async {
    await Provider.of<Homecontroller>(context, listen: false).fetchData();
  }

  @override
  Widget build(BuildContext context) {
    List category = [
      "Cointelograph",
      "Reuters",
      "CNCB",
      "Axios",
      "The Wall Street Journal",
      "CNN",
      "The Daily Hodl",
      "Yahoo EntertainmentS",
      "TheStreet",
      "Fox Business",
      "Buzzfeed",
      "Fox News",
      "YouTube",
      "AOL",
      "Mishtalk.com",
      "KTA Los Angeles"
    ];
    return Scaffold(
      bottomNavigationBar: ShowBottom(),
      appBar: AppBar(
        backgroundColor: myColor,
        title: Center(
          child: Text(
            "News",
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Showdrawers();
          },
          icon: Icon(Icons.menu),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.width * .15,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 4,
              itemBuilder: (context, index) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InkWell(
                      onTap: () {},
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Sorted(index: index),
                              ));
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height * .20,
                          width: MediaQuery.of(context).size.width * 0.4,
                          decoration: BoxDecoration(
                              border: Border.all(), color: Colors.black26),
                          child: Center(child: Text(category[index])),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          SingleChildScrollView(
            child: Container(
              width: double.maxFinite,
              height: 550,
              child: ListView.builder(
                itemBuilder: (context, index) => Contents(
                  index: index,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
