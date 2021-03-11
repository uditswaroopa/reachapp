import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
 

AppBar header(context) {
  return AppBar(
    title: Text('Reach'),
    centerTitle: true,
    actions: [Padding(
      padding: const EdgeInsets.only(right:20.0),
      child: Icon(CupertinoIcons.bell),
    )],
  );
}
