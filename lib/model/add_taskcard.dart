import 'package:flutter/material.dart';
import 'package:todoapp/constant/color.dart';
import 'package:todoapp/model/taskcard.dart';
import 'package:todoapp/screen/dashbored.dart';


class AddTaskcard extends StatefulWidget {
  final String? title;
  final String? description;

  // Make title and description optional by removing "required"
  AddTaskcard({super.key, this.title, this.description});

  @override
  State<AddTaskcard> createState() => _AddTaskcardState();
}

class _AddTaskcardState extends State<AddTaskcard> {
  late TextEditingController title;
  late TextEditingController description;
  String selectedPriority = "Low";
  TimeOfDay selectedFromTime = TimeOfDay(hour: 10, minute: 0);
  TimeOfDay selectedToTime = TimeOfDay(hour: 16, minute: 30);

  @override
  void initState() {
    super.initState();

    // Initialize controllers with widget's title and description
    title = TextEditingController(text: widget.title ?? '');
    description = TextEditingController(text: widget.description ?? '');
  }

  @override
  void dispose() {
    // Dispose of the controllers
    title.dispose();
    description.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BG,
      body: SingleChildScrollView(
        child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                        Text(
                          "Create new Task",
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ]),
                      SizedBox(
                        width: 20,
                      ),
                      CircleAvatar(
                        backgroundImage: AssetImage('assets/images/logo.png'),
                        radius: 35,
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("From",
                              style: TextStyle(color: Colors.white, fontSize: 18)),
                          GestureDetector(
                            onTap: () async {
                              final pickedTime = await showTimePicker(
                                context: context,
                                initialTime: selectedFromTime,
                              );
                              if (pickedTime != null &&
                                  pickedTime != selectedFromTime) {
                                setState(() {
                                  selectedFromTime = pickedTime;
                                });
                              }
                            },
                            child: Container(
                              width: 100,
                              height: 30,
                              color: Colors.white,
                              alignment: Alignment.center,
                              child: Text(
                                "${selectedFromTime.format(context)}",
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("To",
                              style: TextStyle(color: Colors.white, fontSize: 18)),
                          GestureDetector(
                            onTap: () async {
                              final pickedTime = await showTimePicker(
                                context: context,
                                initialTime: selectedToTime,
                              );
                              if (pickedTime != null &&
                                  pickedTime != selectedToTime) {
                                setState(() {
                                  selectedToTime = pickedTime;
                                });
                              }
                            },
                            child: Container(
                              width: 100,
                              height: 30,
                              color: Colors.white,
                              alignment: Alignment.center,
                              child: Text(
                                "${selectedToTime.format(context)}",
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Title",
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        ),
                        SizedBox(height: 5),
                        TextField(
                          controller: title,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                        ),
                        SizedBox(height: 12),
                        Text(
                          "Description",
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        ),
                        SizedBox(height: 5),
                        TextField(
                          maxLines: 4,
                          controller: description,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 25),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Text(
                      "Choose Priority",
                      style: TextStyle(fontSize: 16, color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 15.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedPriority = "High";
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            color: selectedPriority == "High"
                                ? Colors.red
                                : Colors.red.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Text(
                            "High",
                            style: TextStyle(
                              color: selectedPriority == "High"
                                  ? Colors.white
                                  : Colors.red,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedPriority = "Medium";
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            color: selectedPriority == "Medium"
                                ? Colors.grey
                                : Colors.grey.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Text(
                            "Medium",
                            style: TextStyle(
                              color: selectedPriority == "Medium"
                                  ? Colors.white
                                  : Colors.grey,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedPriority = "Low";
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            color: selectedPriority == "Low"
                                ? Colors.green
                                : Colors.green.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: Text(
                            "Low",
                            style: TextStyle(
                              color: selectedPriority == "Low"
                                  ? Colors.white
                                  : Colors.green,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 40.0),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        final newTask = TaskcardData(
                          title: title.text,
                          description: description.text,
                          date:
                          "${selectedFromTime.format(context)} - ${selectedToTime.format(context)}",
                          status: selectedPriority,
                          color: Colors.blue,
                          icon1: Icons.calendar_month,
                          icon2: Icons.flag,
                          colorf: Colors.red,
                        );

                        Navigator.pop(context, newTask);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.greenAccent,
                        padding: EdgeInsets.symmetric(horizontal: 130, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                      child: Text("Add",
                          style: TextStyle(fontSize: 18, color: Colors.white)),
                    ),
                  ),
                ],
              ),
            )),
      ),
    );
  }
}
