// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
// written by https://github.com/arashi009

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ToDoTile extends StatelessWidget {
  final String text;
  final bool checked;
  final Function check;
  final Function delete;
  const ToDoTile(
      {super.key,
      required this.text,
      required this.checked,
      required this.check,
      required this.delete});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.indigo, borderRadius: BorderRadius.circular(20)),
        height: 65,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(children: [
              Checkbox(
                value: checked,
                activeColor: Colors.indigo,
                onChanged: (value) {
                  check();
                },
              ),
              Text(
                text,
                style: GoogleFonts.poppins(
                  color: Colors.white,
                ),
              ),
            ]),
            Padding(
              padding: EdgeInsets.only(right: 8.0),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        backgroundColor: Colors.indigoAccent,
                        title: Text("Deleting a Todo Item!",
                            style: GoogleFonts.poppins(color: Colors.white)),
                        content: Text(
                            'Are you sure you want to delete this todo?',
                            style: GoogleFonts.poppins(color: Colors.white)),
                        actions: [
                          MaterialButton(
                            textColor: Colors.white,
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            color: Colors.indigo,
                            child: Text("No"),
                          ),
                          MaterialButton(
                            textColor: Colors.white,
                            onPressed: () {
                              delete();
                              Navigator.pop(context);
                            },
                            color: Colors.red,
                            child: Text("Yes"),
                          ),
                        ],
                      ),
                    ),
                    child: Icon(
                      Icons.delete,
                      color: Colors.red,
                    ),
                  ),
                  //GestureDetector(
                  // child: Icon(
                  //   Icons.edit,
                  //   color: Colors.white,
                  // ),
                  //)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
