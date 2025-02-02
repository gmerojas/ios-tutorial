import 'dart:developer';

import 'package:http/http.dart' as http;
import 'package:my_app/constants.dart';
import 'package:my_app/model/user_model.dart';

class ApiService {
  Future<List<UserModel>?> getUsers() async {
    List<UserModel> _model = new List.empty();
    try {
      var url = Uri.parse(ApiConstants.baseUrl + ApiConstants.usersEndpoint);
      var response = await http.get(url);
      if (response.statusCode == 200) {
        _model = userModelFromJson(response.body);
        return _model;
      }
    } catch (e) {
      log(e.toString());
    }
    return _model;
  }
}
