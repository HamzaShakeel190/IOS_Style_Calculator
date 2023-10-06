import 'package:flutter/material.dart';

class TransitionScreen extends StatelessWidget {
  static const String id = "TransitionScreen";

  const TransitionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Hero(
          tag: "transition",
          child: Text("Hello World"),
        ),
      ),
    );
  }
}
