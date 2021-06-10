import 'package:flutter/material.dart';

class AddPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("To do list"),),
        body:Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                decoration: InputDecoration(
                  hintText: "Enter Item name"
                ),
              ),
              TextField(
                  decoration: InputDecoration(
                      hintText: "Enter place to do "
                  )
              ),
              TextField(
                  decoration: InputDecoration(
                      hintText: "Enter description"
                  )
              ),
              TextButton(
                child: Text("Add"),
                onPressed: (){
                  Navigator.pop(context);
                },
              )
            ],
          ),
        )
    );
  }
}
