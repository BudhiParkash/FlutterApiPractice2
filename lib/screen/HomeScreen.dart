import 'dart:convert';

import 'package:api_pratice/model/UserModel.dart';
import 'package:api_pratice/services/User_Api.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as Http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<UserModel> users = [];


  @override
  void initState() {
    super.initState();
    fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("REST API"),
      ),
      body: ListView.builder(
        itemCount:  users.length,
        itemBuilder: (context , index){
          final user = users[index];
          final email = user.email;
          final name = user.fullName;
          final image = user.gender;
          final phone = user.phone;

         /* final email = user['email'];
          final name = user['name']['first'];
          final image = user['picture']['thumbnail'];*/
          return ListTile(
            leading: CircleAvatar(
              child: Text(image)
            ),
            title: Text(name),
            subtitle: Text(email),
           
          );
        },
      ),
      /*floatingActionButton: FloatingActionButton(
        onPressed: fetchUsers,
      ),*/
    );
  }

  Future<void> fetchUsers() async {
    final response = await UserApi.fetchUsers();
    setState(() {
      users = response;
    });
  }

 /* Future<void> fetchUsers() async {
    print("Fetch User Called");
    final url = "https://randomuser.me/api/?results=1";
    final uri = Uri.parse(url);
    final response = await Http.get(uri);
    final body = response.body;


   final jsonResponse = jsonDecode(body);
   final results = jsonResponse['results'] as List<dynamic>;
   final transformed = results.map((e) {
     final name = UserName(
         title: e['name']['title'],
         first: e['name']['first'],
         last: e['name']['last']);
     return UserModel(
         gender: e['gender'],
         email: e['email'],
         phone: e['phone'],
         cell: e['cell'],
         nat: e['nat'],
         name: name

     );
   }).toList();
   setState(() {
     users = transformed;
   });
   
   print("fetch user complete");


  }*/
}
