import 'dart:convert';
import 'package:corona_app/pages/corona_faq.dart';
import 'package:corona_app/pages/corona_myths.dart';
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
        leading: const Icon(Icons.menu),
        title: const Text("Corona App"),
        centerTitle: true,
        elevation: 2,
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.notifications_active))
        ],
      ),
      body: nepaldata == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: SafeArea(
                child: Column(
                  children: [
                    Stack(
                      children: [
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.35,
                          child: Column(
                            children: [
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.2,
                                width: double.infinity,
                                color: Colors.blue,
                                child: Padding(
                                  padding: const EdgeInsets.all(16.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Updated on: ${nepaldata['latest_sit_report']['date']}",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      const Text(
                                        "Nepal's Corona Virus Cases",
                                        style: TextStyle(
                                            fontSize: 20, color: Colors.white),
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "${nepaldata['tested_total']}",
                                        style: const TextStyle(
                                            fontSize: 28, color: Colors.white),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                  // color: Colors.red,
                                  )
                            ],
                          ),
                        ),
                        Positioned(
                            left: 20,
                            top: MediaQuery.of(context).size.height * 0.14,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Card(
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.10,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.4,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          // color: Colors.red,
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Text(
                                              "Deaths",
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 14),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "${nepaldata['deaths']}",
                                              style: const TextStyle(
                                                  fontSize: 30,
                                                  color: Colors.red),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Card(
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.10,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.4,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          // color: Colors.red,
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Text(
                                              "Recovered",
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 14),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "${nepaldata['recovered']}",
                                              style: const TextStyle(
                                                  fontSize: 30,
                                                  color: Colors.green),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Card(
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.10,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.4,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          // color: Colors.red,
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Text(
                                              "Tested Positive",
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 14),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "${nepaldata['tested_positive']}",
                                              style: const TextStyle(
                                                  fontSize: 30,
                                                  color: Colors.red),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Card(
                                      child: Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.10,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.4,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(6),
                                          // color: Colors.red,
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            const Text(
                                              "Tested Negative",
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 14),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              "${nepaldata['tested_negative']}",
                                              style: const TextStyle(
                                                  fontSize: 30,
                                                  color: Colors.green),
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            ))
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    GridView.count(
                      shrinkWrap: true,
                      crossAxisCount: 2,
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
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => const CoronaMyths()));
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
                                  Text("Myths of Corona"),
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
                                    builder: (_) => const CoronaFaq()));
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
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
