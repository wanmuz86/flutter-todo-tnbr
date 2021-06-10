import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final Map<String, String> todoDetail;

  DetailPage({required this.todoDetail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Detail page"),),
        body:Column(
          children: [
            Text("Placeholder for name"),
            Text("Placeholder for place"),
            Text("Placeholder for notes")
          ],
        )
    );
  }
}
