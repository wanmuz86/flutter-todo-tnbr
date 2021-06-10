import 'package:flutter/material.dart';
import 'package:todo_app/widgets/add.dart';
import 'package:todo_app/widgets/detail.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<String> todos = ["Makan","Beli groceries","Con call"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("To do list"),
      actions: [
        IconButton(onPressed: (){
         Navigator.push(context,
         MaterialPageRoute(builder: (context)=> AddPage()));
        },
            icon: Icon(Icons.add)
        )
      ],
      ),
      body:ListView.builder(
          padding: const EdgeInsets.all(8),
          itemCount: todos.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              title: Text(todos[index]),
              trailing: Icon(Icons.chevron_right),
              onTap: (){
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=>DetailPage())
                );
              },
            );
          }
      )
      );
  }
}
