import 'package:flutter/material.dart';

/// Bazı sayfalara theme eklemem gerekti o yüzden onu da ThemeData geri dönen
/// bir fonksiyona böldüm
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
