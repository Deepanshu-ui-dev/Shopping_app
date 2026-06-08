import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shoping_app/constants/utils.dart';


void httpErrorHandle({
  required http.Response response,
  required BuildContext context,
  required Function onSuccess,
}) {
  switch (response.statusCode) {
    case 200:
      onSuccess();
      break;
    case 400:
      showSnackBar(context, jsonDecode(response.body)['msg']);
      // Handle bad request
      break;
    case 401:
      showSnackBar(context, jsonDecode(response.body)['msg']);
      // Handle unauthorized
      break;
    case 500:
      showSnackBar(context, jsonDecode(response.body)['msg']);
      // Handle server error
      break;
    default:
      showSnackBar(context, "Unknown Error");
      // Handle other status codes
      break;
  }
}