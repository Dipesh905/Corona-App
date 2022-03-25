import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Corona App Home Page"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Nepal Information",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
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
                      children: const [
                        Text(
                          "Total Cases",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text("1234444"),
                      ],
                    ),
                  ),
                  Container(
                    height: 80,
                    width: MediaQuery.of(context).size.width * 0.3,
                    color: Colors.green[300],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "Recovered",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text("4444"),
                      ],
                    ),
                  ),
                  Container(
                    height: 80,
                    width: MediaQuery.of(context).size.width * 0.3,
                    color: Colors.red[300],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "Total Deaths",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text("1234"),
                      ],
                    ),
                  )
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
                      children: const [
                        Text(
                          "Total Tests",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text("1234444"),
                      ],
                    ),
                  ),
                  Container(
                    height: 80,
                    width: MediaQuery.of(context).size.width * 0.3,
                    color: Colors.green[300],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "Recorded Date",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text("4444"),
                      ],
                    ),
                  ),
                  Container(
                    height: 80,
                    width: MediaQuery.of(context).size.width * 0.3,
                    color: Colors.red[300],
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          "Active Cases",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text("1234"),
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
                          Text("View World Data"),
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
                          Text("Hospital"),
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
