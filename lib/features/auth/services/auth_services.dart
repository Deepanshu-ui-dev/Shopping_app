import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:shoping_app/constants/error_handling.dart';
import 'package:shoping_app/constants/global_variable.dart';
import 'package:shoping_app/constants/utils.dart';
import 'package:shoping_app/models/user.dart';

class AuthServices {
  Future<void> singUpUser({
    required BuildContext context,
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      User user = User(
        id: '',
        name: name,
        email: email,
        password: password,
        address: '',
        type: '',
        token: '',
      );

      print('$uri/api/signup');

      http.Response response = await http.post(
        Uri.parse('$uri/api/signup'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: user.toJson(),
      );

      httpErrorHandle(
        response: response,
        context: context,
        onSuccess: () {
          showSnackBar(context, 'Account created successfully!');
        },
      );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }
}
