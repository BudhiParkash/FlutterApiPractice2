import 'package:http/http.dart' as Http;
import 'dart:convert';
import 'package:api_pratice/model/UserModel.dart';

class UserApi{

  static Future<List<UserModel>> fetchUsers() async {
    print("Fetch User Called");
    final url = "https://randomuser.me/api/?results=10";
    final uri = Uri.parse(url);
    final response = await Http.get(uri);
    final body = response.body;


    final jsonResponse = jsonDecode(body);
    final results = jsonResponse['results'] as List<dynamic>;
    final transformed = results.map((e) {
      return UserModel.fromMap(e);
    }).toList();

    return transformed;
 /*setState(() {
      users = transformed;
    });*/

    print("fetch user complete");
  }
}