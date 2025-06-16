import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class ApiExample extends StatefulWidget {
  const ApiExample({super.key});

  @override
  State<ApiExample> createState() => _ApiExampleState();
}



class _ApiExampleState extends State<ApiExample> {

@override
  void initState() {
    super.initState();
    addStudents();
  }

  List studentList = [];
  void addStudents() async { 
    var uri = Uri.parse("https://jsonplaceholder.typicode.com/users");
   http.Response res = await  http.get(uri);

    var data = jsonDecode(res.body);

    for(var student in data){
    setState((){
      studentList.add(student["name"]);
    });

    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("API Example")),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(itemCount: studentList.length, itemBuilder: (context, index) {
          return ListTile(
            title: Text(studentList[index]),
          );
        },),
      ),
    );
  }
}