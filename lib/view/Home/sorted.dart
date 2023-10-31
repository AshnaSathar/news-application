import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/controller.dart';
import 'package:provider/provider.dart';

class Sorted extends StatefulWidget {
  const Sorted({super.key, required this.index});
  final int index;
  @override
  State<Sorted> createState() => _SortedState();
}

class _SortedState extends State<Sorted> {
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
    final homescreendata = Provider.of<Homecontroller>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text(homescreendata
                .responseData?.articles?[widget.index].source?.name
                .toString() ??
            ""),
      ),
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        color: Colors.amber,
        child: ListView.separated(
            itemBuilder: (context, index) {
              while (homescreendata
                      .responseData?.articles?[widget.index].source?.name
                      .toString() ==
                  category[index]) {
                print("i love me yes");
              }
              // print("mmmmm$name");
              return Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    child: Image.network(homescreendata
                            .responseData?.articles?[widget.index].urlToImage ??
                        ""),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * .80,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            homescreendata.responseData?.articles?[widget.index]
                                    .title ??
                                "",
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                      Text(homescreendata
                              .responseData?.articles?[widget.index].publishedAt
                              .toString() ??
                          ""),
                    ],
                  ),
                ],
              );
            },
            separatorBuilder: (context, index) => Divider(),
            itemCount: 15),
      ),
    );
  }
}
