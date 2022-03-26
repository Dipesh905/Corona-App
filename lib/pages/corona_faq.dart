import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CoronaFaq extends StatefulWidget {
  const CoronaFaq({Key? key}) : super(key: key);

  @override
  State<CoronaFaq> createState() => _CoronaFaqState();
}

class _CoronaFaqState extends State<CoronaFaq> {
  var coronafaq;
  getcoronafaq() async {
    var url = Uri.parse('https://corona.askbhunte.com/api/v1/faqs');
    var response = await http.get(url);

    var data = jsonDecode(response.body);

    setState(() {
      coronafaq = data;
    });
  }

  @override
  void initState() {
    super.initState();
    getcoronafaq();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Frequently Asked Questions"),
      ),
      body: coronafaq == null
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: coronafaq['data'].length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text("${index + 1}"),
                      ),
                      title: Text(
                        coronafaq['data'][index]['question_np'],
                        style: const TextStyle(fontWeight: FontWeight.bold),
                      ),
                      subtitle: Text(
                        coronafaq['data'][index]['answer_np'],
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
