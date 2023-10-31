import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/controller.dart';
import 'package:provider/provider.dart';

class Fullnews extends StatefulWidget {
  const Fullnews({super.key, required this.index});
  final int index;
  @override
  State<Fullnews> createState() => _FullnewsState();
}

class _FullnewsState extends State<Fullnews> {
  @override
  void initState() {
    gertData();
    super.initState();
  }

  gertData() async {
    await Provider.of<Homecontroller>(context, listen: false).fetchData();
  }

  Widget build(BuildContext context) {
    final homescreendata = Provider.of<Homecontroller>(context);
    return Scaffold(
      body: Container(
        height: 550,
        width: double.maxFinite,
        child: Column(
          children: [
            Image.network(homescreendata
                    .responseData?.articles?[widget.index].urlToImage ??
                ""),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                homescreendata.responseData?.articles?[widget.index].title ??
                    "",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                textAlign: TextAlign.justify,
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    homescreendata
                            .responseData?.articles?[widget.index].publishedAt
                            .toString() ??
                        "",
                    style: TextStyle(fontSize: 15),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                homescreendata
                        .responseData?.articles?[widget.index].description ??
                    "",
                style: TextStyle(fontSize: 15),
                textAlign: TextAlign.justify,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                homescreendata.responseData?.articles?[widget.index].content ??
                    "",
                textAlign: TextAlign.justify,
              ),
            )
          ],
        ),
      ),
    );
  }
}
