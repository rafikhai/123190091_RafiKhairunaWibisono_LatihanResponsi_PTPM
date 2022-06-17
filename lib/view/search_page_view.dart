import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:latihan_responsi/view/profile_page_view.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final _controller = TextEditingController();
  String? text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Github User Search"),
      ),
      body: Container(
          child: Column(children: [
        Padding(
          padding: const EdgeInsets.all(20),
          child: Container(
            padding: const EdgeInsets.all(1),
            color: Colors.white,
            child: Container(
              color: Colors.white,
              child: TextField(
                selectionHeightStyle: BoxHeightStyle.max,
                decoration: InputDecoration(
                  hintText: "Input Github username",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(7.0)),
                  fillColor: Colors.white,
                  filled: true,
                  icon: const Icon(
                    Icons.search,
                    color: Colors.blue,
                    size: 40.0,
                  ),
                ),
                controller: _controller,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 10.0,
        ),
        Container(
          padding: const EdgeInsets.all(1),
          child: Container(
              //padding: EdgeInsets.fromLTRB(0, 0, 7, 7),
              color: Colors.white,
              child: RaisedButton(
                padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                colorBrightness: Brightness.light,
                elevation: 5,
                child: const Text(
                  "Search",
                ),
                color: Colors.white,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return ProfilePage(text: _controller.text);
                  }));
                },
              )),
        ),
      ])),
    );
  }
}
