
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

TextEditingController todoListController = TextEditingController();
TextEditingController updateListController = TextEditingController();

List<String> todoList = [];

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black12,
        appBar: AppBar(
          backgroundColor: Colors.black12,
          title: TextField(
            controller: todoListController,
            decoration: const InputDecoration(
              filled: true,
              fillColor: Colors.white70,
              labelText: "Write a Task :",
              labelStyle: TextStyle(
                  fontSize: 17,
                  fontWeight: FontWeight.w700,
                  color: Colors.black),
              floatingLabelAlignment: FloatingLabelAlignment.start,
              border: UnderlineInputBorder(
                borderSide: BorderSide(),
                borderRadius: BorderRadius.zero,
              ),
            ),
          ),
          actions: [
            ElevatedButton(
              style: const ButtonStyle(
                backgroundColor: MaterialStatePropertyAll<Color>(Colors.green),
              ),
              onPressed: () {
                setState(() {
                  todoList.add(todoListController.text);
                  todoListController.clear();
                });
              },
              child: const Text("Add"),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(6.0),
          child: ListView.builder(
            itemCount: todoList.length,
            itemBuilder: (context, index) {
              return Container(
                margin:const EdgeInsets.all(10),
                child: ListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)),
                  title: Text(todoList[index]),
                  tileColor: const Color.fromRGBO(158, 158, 158, 1),
                  trailing: Wrap(
                    children: [
                      IconButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text("Update Task"),
                                content: TextField(
                                  controller: updateListController,
                                ),
                                actions: [
                                  ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        todoList[index] =
                                            updateListController.text;
                                        Navigator.pop(
                                            context); // Close the dialog
                                      });
                                    },
                                    child: const Text("Update"),
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        icon: const Icon(Icons.edit),
                      ),
                      IconButton(
                        color: Colors.red,
                        onPressed: () {
                          setState(() {
                            todoList.removeAt(index);
                          });
                        },
                        icon: const Icon(Icons.delete),
                      )
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
