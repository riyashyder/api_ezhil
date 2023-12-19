


import 'dart:convert';

import 'package:http/http.dart' as http;

import 'model.dart';


class ApiService {
  Future<List<UserModel>?> getUsers() async {
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.usersEndpoint);
      print('-- API URL --- ${url}');
      var response = await http.get(url);
      if (response.statusCode == 200) {
        print('------ DATA SUCCESS');

        List<UserModel> userModelFromJson(String str) =>
            List<UserModel>.from(json.decode(str).map((x) => UserModel.fromJson(x)));

        List<UserModel> model = userModelFromJson(response.body);

        print('*** RESPONSE *** ${response.body}');
        return  model;
      } else {
        print('================ ERROR ================');
      }
    } catch (e) {
        print(e.toString());
    }
  }
}











class ApiConstants {
  static String baseUrl = 'https://jsonplaceholder.typicode.com';
  static String usersEndpoint = '/users';
}