import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class CoronaNews extends StatefulWidget {
  const CoronaNews({Key? key}) : super(key: key);

  @override
  State<CoronaNews> createState() => _CoronaNewsState();
}

class _CoronaNewsState extends State<CoronaNews> {
  var coronanews;
  getcoronanews() async {
    var url = Uri.parse('https://corona.askbhunte.com/api/v1/news');
    var response = await http.get(url);

    var data = jsonDecode(response.body);

    setState(() {
      coronanews = data;
    });

    print(data['data'][0]['url']);
  }

  @override
  void initState() {
    super.initState();
    getcoronanews();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Corona News"),
      ),
      body: coronanews == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: coronanews['data'].length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: InkWell(
                    onTap: () {
                      launch("${coronanews['data'][index]['url']}",
                          forceWebView: true, enableJavaScript: true);
                    },
                    child: Card(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 150,
                            width: double.infinity,
                            child: Image.network(
                              "https://assets-api.kathmandupost.com/thumb.php?src=https://assets-cdn.kathmandupost.com/uploads/source/news/2021/entertainment/thumb1-1610966848.jpg&w=900&height=601",
                              fit: BoxFit.cover,
                            ),
                          ),
                          Text(
                            coronanews['data'][index]['title'],
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            coronanews['data'][index]['summary'],
                          ),
                          // const SizedBox(
                          //   height: 3,
                          // ),
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceAround,
                          //   children: [
                          //     Container(
                          //       height: 80,
                          //       width: MediaQuery.of(context).size.width * 0.3,
                          //       color: Colors.blue[300],
                          //       child: Column(
                          //         mainAxisAlignment: MainAxisAlignment.center,
                          //         children: [
                          //           const Text(
                          //             "Total Cases",
                          //             style: TextStyle(fontWeight: FontWeight.bold),
                          //           ),
                          //           const SizedBox(
                          //             height: 3,
                          //           ),
                          //           Text(
                          //               coronanews[index]['totalCases'].toString()),
                          //         ],
                          //       ),
                          //     ),
                          //     Container(
                          //       height: 80,
                          //       width: MediaQuery.of(context).size.width * 0.3,
                          //       color: Colors.green[300],
                          //       child: Column(
                          //         mainAxisAlignment: MainAxisAlignment.center,
                          //         children: [
                          //           const Text(
                          //             "Total Recovered",
                          //             style: TextStyle(fontWeight: FontWeight.bold),
                          //           ),
                          //           const SizedBox(
                          //             height: 3,
                          //           ),
                          //           Text(coronanews[index]['totalRecovered']
                          //               .toString()),
                          //         ],
                          //       ),
                          //     ),
                          //     Container(
                          //       height: 80,
                          //       width: MediaQuery.of(context).size.width * 0.3,
                          //       color: Colors.red[300],
                          //       child: Column(
                          //         mainAxisAlignment: MainAxisAlignment.center,
                          //         children: [
                          //           const Text("Total Deaths",
                          //               style:
                          //                   TextStyle(fontWeight: FontWeight.bold)),
                          //           const SizedBox(
                          //             height: 3,
                          //           ),
                          //           Text(coronanews[index]['totalDeaths']
                          //               .toString()),
                          //         ],
                          //       ),
                          //     )
                          //   ],
                          // )
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
