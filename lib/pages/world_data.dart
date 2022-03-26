import 'package:flutter/material.dart';

class WorldData extends StatefulWidget {
  const WorldData({Key? key}) : super(key: key);

  @override
  State<WorldData> createState() => _WorldDataState();
}

class _WorldDataState extends State<WorldData> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("World Data"),
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const Text("USA"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      height: 80,
                      width: MediaQuery.of(context).size.width * 0.3,
                      color: Colors.blue[300],
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [Text("Total Cases"), Text("12345")],
                      ),
                    ),
                    Container(
                      height: 80,
                      width: MediaQuery.of(context).size.width * 0.3,
                      color: Colors.blue[300],
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [Text("Total Cases"), Text("12345")],
                      ),
                    ),
                    Container(
                      height: 80,
                      width: MediaQuery.of(context).size.width * 0.3,
                      color: Colors.blue[300],
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [Text("Total Cases"), Text("12345")],
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
