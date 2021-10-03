import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:settings_screen/models/user_model.dart';
import 'package:settings_screen/shared/app_exceptions.dart';

import 'api_util.dart';

class ApiHelper {
  static ApiHelper _instance = ApiHelper();

  static ApiHelper get getInstance => _instance;

  Future<List<UserData>> getUsers() async {
    await checkInternetConnection();

    http.Response response = await http.get(USERS_SERVICE);

    switch (response.statusCode) {
      case 200:
        List<UserData> usersData = [];
        var body = jsonDecode(response.body);
        for (var user in body) usersData.add(UserData.fromJson(user));
        return usersData;
        break;
      case 404:
        throw ErrorNotFoundException(message: 'user');
        break;
      default:
        return null;
        break;
    }
  }
}
