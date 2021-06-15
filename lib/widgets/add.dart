import 'package:flutter/material.dart';

class AddPage extends StatelessWidget {
  var nameEditingController = TextEditingController();
  var placeEditingController = TextEditingController();
  var descEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("To do list"),),
        body:SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                TextField(
                  controller: nameEditingController,
                  decoration: InputDecoration(
                    hintText: "Enter Item name"
                  ),
                ),
                TextField(
                  controller: placeEditingController,
                    decoration: InputDecoration(
                        hintText: "Enter place to do "
                    )
                ),
                TextField(
                  controller: descEditingController,
                    decoration: InputDecoration(
                        hintText: "Enter description"
                    )
                ),
                TextButton(
                  child: Text("Add"),
                  onPressed: (){
                    var object = {
                      "name":nameEditingController.text,
                      "location":placeEditingController.text,
                    "description":descEditingController.text
                    };
                    Navigator.pop(context, object);
                  },
                )
              ],
            ),
          ),
        )
    );
  }
}
