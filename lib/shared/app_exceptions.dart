import 'package:flutter/cupertino.dart';

class ErrorNotFoundException implements Exception {
  String message;
  ErrorNotFoundException({@required this.message});

  @override
  String toString() => 'Resource ${this.message} Not Found';
}

class NoInternetConnectionException implements Exception {
  @override
  String toString() => 'No Internet Connection Available !!!';
}
