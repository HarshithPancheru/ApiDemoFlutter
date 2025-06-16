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
   http.Response response = await  http.get(uri);
    print(response.body);
    print("Heythere");
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}