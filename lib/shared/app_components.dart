import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomErrorWidget extends StatelessWidget {
  final String errorMessage;

  const CustomErrorWidget({@required this.errorMessage});

  @override
  Widget build(BuildContext context) => Card(
        child: Center(
          child: Text(
            '$errorMessage',
          ),
        ),
      );
}

class CustomLoadingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Card(
        child: Center(
            child: CupertinoActivityIndicator(
          radius: 45,
        )),
      );
}
