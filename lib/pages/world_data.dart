import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class WorldData extends StatefulWidget {
  const WorldData({Key? key}) : super(key: key);

  @override
  State<WorldData> createState() => _WorldDataState();
}

class _WorldDataState extends State<WorldData> {
  var worlddata;
  getworlddata() async {
    var url = Uri.parse('https://corona.askbhunte.com/api/v1/data/world');
    var response = await http.get(url);

    var data = jsonDecode(response.body);

    setState(() {
      worlddata = data;
    });
  }

  @override
  void initState() {
    super.initState();
    getworlddata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("World Data"),
      ),
      body: worlddata == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: worlddata.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text(
                        worlddata[index]['country'],
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 3,
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
                                  "Total Cases",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 3,
                                ),
                                Text(worlddata[index]['totalCases'].toString()),
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
                                  "Total Recovered",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 3,
                                ),
                                Text(worlddata[index]['totalRecovered']
                                    .toString()),
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
                                const Text("Total Deaths",
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                const SizedBox(
                                  height: 3,
                                ),
                                Text(
                                    worlddata[index]['totalDeaths'].toString()),
                              ],
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
    );
  }
}
