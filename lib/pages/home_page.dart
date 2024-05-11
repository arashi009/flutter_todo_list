// ignore_for_file: prefer_const_constructors
// written by https://github.com/arashi009
import "package:flutter/material.dart";
import "package:google_fonts/google_fonts.dart";
import "package:todo/pages/todo_tile.dart";

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List todos = [
    ["Generic Todo List", false],
    ["Add new Todos with the add button", false],
    ["Delete by tapping the trash icon ->", false],
  ];

  final todoController = TextEditingController();

  void check(int index) => setState(() {
        todos[index][1] = !todos[index][1];
      });

  void addNew(String text) {
    setState(() {
      todos.add([text, false]);
    });
  }

  void delete(int index) {
    setState(() {
      todos.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        leading: Icon(Icons.home, color: Colors.white),
        backgroundColor: Colors.indigo,
        title: Center(
            child: Padding(
          padding: const EdgeInsets.only(right: 50.0),
          child: Text("TODO",
              style: GoogleFonts.poppins(color: Colors.white, fontSize: 28)),
        )),
        elevation: 30,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    backgroundColor: Colors.indigo,
                    title:
                        Text("New Todo", style: TextStyle(color: Colors.white)),
                    contentPadding: EdgeInsets.all(30),
                    content: TextField(
                        style: TextStyle(color: Colors.white),
                        controller: todoController,
                        decoration: InputDecoration(
                            hintText: " add a new todo...",
                            hintStyle: TextStyle(color: Colors.grey[400]))),
                    actions: [
                      MaterialButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        color: Colors.red,
                        child: Text("Cancel",
                            style: TextStyle(color: Colors.white)),
                      ),
                      MaterialButton(
                        onPressed: () {
                          setState(() {
                            String text = todoController.text;
                            if (text == '') {
                              Navigator.pop(context);
                            } else {
                              todos.add([text, false]);
                              todoController.clear();
                              Navigator.pop(context);
                            }
                          });
                        },
                        color: Colors.indigoAccent,
                        child: Text("Add",
                            style: TextStyle(
                              color: Colors.white,
                            )),
                      )
                    ],
                  ));
        },
        backgroundColor: Colors.indigo,
        child: Icon(Icons.add, color: Colors.white),
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) => ToDoTile(
          text: todos[index][0],
          checked: todos[index][1],
          check: () => check(index),
          delete: () => delete(index),
        ),
      ),
    );
  }
}
