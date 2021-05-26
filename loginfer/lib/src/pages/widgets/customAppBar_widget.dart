import 'package:flutter/material.dart';

AppBar buildAppBar() {
  return AppBar(
    title: Text(
      "Software de Seguimiento Académico ENRIQUE LINDEMANN",
      style: TextStyle(color: Colors.black),
    ),
    centerTitle: true,
    backgroundColor: Colors.yellowAccent,
    actions: [
      IconButton(icon: Icon(Icons.search), onPressed: () {}),
    ],
  );
}
