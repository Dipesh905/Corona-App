import 'dart:convert';

import 'package:corona_app/pages/corona_news.dart';
import 'package:corona_app/pages/world_data.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var nepaldata;
  getdata() async {
    var url = Uri.parse('https://corona.askbhunte.com/api/v1/data/nepal');
    var response = await http.get(url);

    var data = jsonDecode(response.body);

    setState(() {
      nepaldata = data;
    });
  }

  @override
  void initState() {
    super.initState();
    getdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Corona App"),
        centerTitle: true,
      ),
      body: nepaldata == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Nepal Information",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 80,
                          width: MediaQuery.of(context).size.width * 0.3,
                          color: Colors.blue[300],
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Total Tested",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text("${nepaldata['tested_total']}"),
                            ],
                          ),
                        ),
                        Container(
                          height: 80,
                          width: MediaQuery.of(context).size.width * 0.3,
                          color: Colors.green[300],
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Tested Negative",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text("${nepaldata['tested_negative']}"),
                            ],
                          ),
                        ),
                        Container(
                          height: 80,
                          width: MediaQuery.of(context).size.width * 0.3,
                          color: Colors.red[300],
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Tested Positive",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text("${nepaldata['tested_positive']}"),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          height: 80,
                          width: MediaQuery.of(context).size.width * 0.3,
                          color: Colors.blue[300],
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Updated on:",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text("${nepaldata['latest_sit_report']['date']}"),
                            ],
                          ),
                        ),
                        Container(
                          height: 80,
                          width: MediaQuery.of(context).size.width * 0.3,
                          color: Colors.green[300],
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Recovered",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text("${nepaldata['recovered']}"),
                            ],
                          ),
                        ),
                        Container(
                          height: 80,
                          width: MediaQuery.of(context).size.width * 0.3,
                          color: Colors.red[300],
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Deaths",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text("${nepaldata['deaths']}"),
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    GridView.count(
                      shrinkWrap: true,
                      crossAxisCount: 3,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const WorldData()));
                          },
                          child: Card(
                            child: Container(
                              height: 80,
                              width: MediaQuery.of(context).size.width * 0.3,
                              color: Colors.amber,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(
                                    Icons.map_rounded,
                                    size: 70,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text("View World Data"),
                                ],
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const CoronaNews()));
                          },
                          child: Card(
                            child: Container(
                              height: 80,
                              width: MediaQuery.of(context).size.width * 0.3,
                              color: Colors.amber,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(
                                    Icons.pages,
                                    size: 70,
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                                  Text("Corona News"),
                                ],
                              ),
                            ),
                          ),
                        ),
                        Card(
                          child: Container(
                            height: 80,
                            width: MediaQuery.of(context).size.width * 0.3,
                            color: Colors.amber,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.map_rounded,
                                  size: 70,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text("Myths of Corona"),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          child: Container(
                            height: 80,
                            width: MediaQuery.of(context).size.width * 0.3,
                            color: Colors.amber,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.question_answer,
                                  size: 70,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text("FAQ of Corona"),
                              ],
                            ),
                          ),
                        ),
                        Card(
                          child: Container(
                            height: 80,
                            width: MediaQuery.of(context).size.width * 0.3,
                            color: Colors.amber,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.local_hospital,
                                  size: 70,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text("Corona Hospital"),
                              ],
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
