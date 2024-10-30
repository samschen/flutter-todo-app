import 'package:flutter/material.dart';
import 'package:todoapp/constant/color.dart';
import 'package:todoapp/model/add_taskcard.dart';
import 'package:todoapp/model/taskcard.dart';

class Dashbored extends StatefulWidget {
  const Dashbored({super.key});

  @override
  State<Dashbored> createState() => _DashboredState();
}

class _DashboredState extends State<Dashbored> {
  List<TaskcardData> tasks = []; // List to store tasks

  // Function to add a new task to the list
  void addTask(TaskcardData task) {
    setState(() {
      tasks.add(task);
    });
  }

  // Function to update an existing task
  void updateTask(int index, TaskcardData updatedTask) {
    setState(() {
      tasks[index] = updatedTask; // Update the task at the specified index
    });
  }

  // Function to delete a task from the list
  void deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BG,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Section
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Welcome to Notes",
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "Have a great Day",
                        style: TextStyle(fontSize: 20, color: Colors.white),
                      ),
                    ],
                  ),
                  SizedBox(width: 20),
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/images/logo.png'),
                    radius: 35,
                  ),
                ],
              ),
              SizedBox(height: 9),

              // Priority Task Section
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Text(
                  "My Priority Task",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ),

              // Priority Tasks Row
              Row(
                children: [
                  SizedBox(width: 12),
                  // First Priority Task
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white38,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text('2 hours Ago', style: TextStyle(color: Colors.white)),
                              SizedBox(width: 20),
                              Icon(Icons.phone_android_sharp, color: Colors.white),
                            ],
                          ),
                          SizedBox(height: 6),
                          Text(
                            'Mobile App UI Design',
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                          Text('using Figma and other tools', style: TextStyle(color: Colors.white, fontSize: 14)),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 12),
                  // Second Priority Task
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white38,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text('4 hours Ago', style: TextStyle(color: Colors.white)),
                              SizedBox(width: 20),
                              Icon(Icons.camera_alt, color: Colors.white),
                            ],
                          ),
                          SizedBox(height: 6),
                          Text(
                            'Capture Sun Rise Shots',
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                          ),
                          Text('complete GuruShot Challenge', style: TextStyle(color: Colors.white, fontSize: 14)),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 12),
                ],
              ),

              SizedBox(height: 20),

              // My Tasks Section
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 18),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'My Tasks',
                      style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    IconButton(
                      onPressed: () async {
                        final result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => AddTaskcard(),
                          ),
                        );
                        if (result != null) {
                          addTask(result); // Add new task
                        }
                      },
                      icon: Icon(Icons.add_circle, color: Colors.greenAccent, size: 40),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // Task Categories Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("Today's Tasks", style: TextStyle(fontSize: 15, color: Colors.white, fontWeight: FontWeight.bold)),
                  Text("Weekly Tasks", style: TextStyle(fontSize: 15, color: Colors.white)),
                  Text("Monthly Tasks", style: TextStyle(fontSize: 15, color: Colors.white)),
                ],
              ),

              // Task List Section
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView.builder(
                    itemCount: tasks.length,
                    itemBuilder: (context, index) {
                      return Dismissible(
                        key: Key(tasks[index].title),
                        onDismissed: (direction) {
                          deleteTask(index); // Delete task
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Task deleted')));
                        },
                        child: GestureDetector(
                          onTap: () async {
                            // Navigate to edit screen with pre-filled data
                            final updatedTask = await Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AddTaskcard(
                                  title: tasks[index].title,
                                  description: tasks[index].description,
                                ),
                              ),
                            );
                            if (updatedTask != null) {
                              updateTask(index, updatedTask); // Update task
                            }
                          },
                          child: TaskcardData(
                            title: tasks[index].title,
                            description: tasks[index].description,
                            color: Colors.blue,
                            date: tasks[index].date,
                            status: tasks[index].status,
                            icon1: Icons.calendar_month,
                            icon2: Icons.flag,
                            colorf: Colors.red,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
