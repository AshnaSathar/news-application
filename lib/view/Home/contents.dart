import 'package:flutter/material.dart';
import 'package:flutter_application_1/controller/controller.dart';
import 'package:flutter_application_1/model/modelclass.dart';
import 'package:flutter_application_1/view/Home/fullnews.dart';
import 'package:provider/provider.dart';

class Contents extends StatefulWidget {
  const Contents({super.key, required this.index});
  final int index;
  @override
  State<Contents> createState() => _ContentsState();
}

class _ContentsState extends State<Contents> {
  Newsmodelclass? responseData;

  @override
  Widget build(BuildContext context) {
    final homescreendata = Provider.of<Homecontroller>(context);
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Fullnews(index: widget.index),
          ),
        );
      },
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * .05,
                width: MediaQuery.of(context).size.width * .15,
                child: Image.network(homescreendata
                        .responseData?.articles?[widget.index].urlToImage ??
                    "https://media.cnn.com/api/v1/images/stellar/prod/231027165526-uaw-walk-out-09222023.jpg?c=16x9&q=w_800,c_fill"),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * .009,
              ),
              Column(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .70,
                    child: Text(
                      homescreendata
                              .responseData?.articles?[widget.index].title ??
                          "aaaaaaaa",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width * .009,
                  ),
                  Row(
                    children: [
                      Text("-"),
                      Text(homescreendata
                              .responseData?.articles?[widget.index].author ??
                          ""),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
