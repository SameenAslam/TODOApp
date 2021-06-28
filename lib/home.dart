import 'dart:ffi';

import 'package:flutter/material.dart';

class Todo extends StatefulWidget {
  @override
  _TodoState createState() => _TodoState();
}

class _TodoState extends State<Todo> {
  var output = "";
  List<dynamic> lst = [
    "hello!",
    23681,
    "sameen",
    23,
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Center(
            child: Text(
              'TODO App',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
        backgroundColor: Colors.black,
        body: ListView.builder(
            itemCount: lst.length,
            itemBuilder: (context, index) {
              return Container(
                  height: 70,
                  padding: EdgeInsets.all(5.0),
                  color: Colors.grey[800],
                  margin: EdgeInsets.only(top: 14),
                  child: ListTile(
                    title: Text(
                      "${lst[index]}",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontFamily: "Raleway",
                      ),
                    ),
                    trailing: Container(
                      width: 50,
                      child: Row(
                        children: [
                          GestureDetector(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (context) {
                                      return AlertDialog(
                                        title: Text(
                                          "Edit task",
                                          style: TextStyle(
                                            color: Colors.grey[850],
                                            fontSize: 20,
                                          ),
                                        ),
                                        content: TextField(onChanged: (value) {
                                          output = value;
                                        }),
                                        actions: [
                                          ElevatedButton(
                                            style: ButtonStyle(
                                              backgroundColor:
                                                  MaterialStateProperty.all(
                                                      Colors.yellow),
                                              padding:
                                                  MaterialStateProperty.all(
                                                      EdgeInsets.all(10)),
                                            ),
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                              setState(() {
                                                lst.replaceRange(
                                                    index, index + 1, {output});
                                              });
                                            },
                                            child: Text(
                                              "Edit",
                                              style: TextStyle(
                                                color: Colors.black,
                                                fontSize: 20,
                                              ),
                                            ),
                                          )
                                        ],
                                      );
                                    });
                              },
                              child: Icon(
                                Icons.edit,
                                color: Colors.white,
                              )),
                          SizedBox(
                            width: 2,
                          ),
                          GestureDetector(
                              onTap: () {
                                setState(() {
                                  lst.removeAt(index);
                                });
                              },
                              child: Icon(
                                Icons.delete,
                                color: Colors.white,
                              )),
                        ],
                      ),
                    ),
                  ));
            }),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text(
                      "Add task",
                      style: TextStyle(
                        color: Colors.grey[850],
                        fontSize: 20,
                      ),
                    ),
                    content: TextField(onChanged: (value) {
                      output = value;
                    }),
                    actions: [
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.yellow),
                          padding:
                              MaterialStateProperty.all(EdgeInsets.all(10)),
                        ),
                        onPressed: () {
                          Navigator.of(context).pop();
                          setState(() {
                            lst.add(output);
                          });
                        },
                        child: Text("Add",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            )),
                      )
                    ],
                  );
                });
          },
          child: Icon(
            Icons.add,
            color: Colors.black,
            size: 30,
          ),
          backgroundColor: Colors.yellow,
        ),
      ),
    );
  }
}
