import 'package:flutter/material.dart';

ThemeData theme(BuildContext context) {
  const Color darkColor = Color.fromRGBO(13, 17, 23, 1);

  return ThemeData(
    primarySwatch: Colors.amber,
    scaffoldBackgroundColor: darkColor,
    textTheme: Theme.of(context).textTheme.apply(
          bodyColor: Colors.white,
          decorationColor: Colors.white,
          displayColor: Colors.white,
        ),
    hintColor: Colors.white,
  );
}
