import 'package:shoping_app/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:shoping_app/constants/error_handling.dart';
import 'package:shoping_app/constants/utils.dart';
import 'package:shoping_app/constants/global_variable.dart';
class AuthServices {


  void singUpUser({
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
  address: '',
  type: '',
  token: '',
);
     http.Response response = await http.post(Uri.parse( '$uri/api/signup'), 
     body: user.toJson(),
     headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
     },
     ); 
     httpErrorHandle(
      response: response,
      context: context,
      onSuccess: () {
        showSnackBar(context, "Account created! Login with the same credentials!");
      },
     );
    } catch (e) {
      showSnackBar(context, e.toString());
    }
  }


}
