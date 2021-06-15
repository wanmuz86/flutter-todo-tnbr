import 'package:flutter/material.dart';

class DetailPage extends StatelessWidget {
  final dynamic todoDetail;

  DetailPage({required this.todoDetail});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Detail page"),),
        body:Center(
          child: Column(
            children: [
              Text(todoDetail["name"]!, style: TextStyle(color: Colors.red,
                  fontSize: 32),),
              SizedBox(height: 8,),
              Text(todoDetail["location"]!),
              Text(todoDetail["description"]!)
            ],
          ),
        )
    );
  }
}
