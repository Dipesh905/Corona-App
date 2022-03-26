import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class CoronaMyths extends StatefulWidget {
  const CoronaMyths({Key? key}) : super(key: key);

  @override
  State<CoronaMyths> createState() => _CoronaMythsState();
}

class _CoronaMythsState extends State<CoronaMyths> {
  var coronamyths;
  getcoronamyths() async {
    var url = Uri.parse('https://corona.askbhunte.com/api/v1/myths');
    var response = await http.get(url);

    var data = jsonDecode(response.body);

    setState(() {
      coronamyths = data;
    });
  }

  @override
  void initState() {
    super.initState();
    getcoronamyths();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Corona Myths"),
      ),
      body: coronamyths == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: coronamyths['data'].length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: Column(
                      children: [
                        Text(
                          coronamyths['data'][index]['myth_np'],
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        Text(
                          coronamyths['data'][index]['reality_np'],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
