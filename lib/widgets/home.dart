import 'package:flutter/material.dart';
import 'package:todo_app/widgets/add.dart';
import 'package:todo_app/widgets/detail.dart';
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  // A List is actually an Array, it is represented with a [] ,
  // We retrieve the value of list with number [0], [1] , [2]
  // We use .length to get how many items in an Array
  // List<type> // type can be : String, int, dynamic

  // A Map is actually an Object, Dictionary, HashMap, Array Associative
  // It is represented with a {}
  // We declare it Map<String,type>  // type can be : String, int, dynamic...
  // We retrieve the value of Map with it's key  = map["name"]

  /// List<dynamic> -> A list of anything
  List<dynamic> todos = [
    ];

  // This is mobile when the page is loaded lifecycle..
  // It is almost similar to document.ready in jquery..
  // Mobile app has more lifecycle than normal web..

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadTodos();
  }

  void loadTodos() async {
    final prefs = await SharedPreferences.getInstance();
    String? todoString = prefs.getString("todos");
    var todoList = jsonDecode(todoString!);
    setState(() {
      todos = todoList;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("To do list"),
      actions: [
        IconButton(onPressed: () async {
         var result =  await Navigator.push(context,
         MaterialPageRoute(builder: (context)=> AddPage()));

         // I create a copy of current array
         List<dynamic> tempArray = todos;
         // I add the data in the copy of array
         tempArray.add(result);

         // Encode
         String todosString = jsonEncode(tempArray);


         // Save the data inside Shared Preference...
         final prefs = await SharedPreferences.getInstance();
         prefs.setString("todos", todosString);

         setState(()  {
           todos = tempArray;

         });


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
              title: Text(todos[index]["name"]!),
              subtitle: Text(todos[index]["location"]!),
              trailing: Icon(Icons.chevron_right),
              onTap: () async {
             Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=>DetailPage(todoDetail:
                  todos[index],))
                );

              },
            );
          }
      )
      );
  }


}
