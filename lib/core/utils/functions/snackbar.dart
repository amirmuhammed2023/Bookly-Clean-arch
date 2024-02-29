import 'package:flutter/material.dart';

void snackbar(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(content: Text("Can't view this book")),
  );
}
