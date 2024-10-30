import 'package:flutter/material.dart';

class TaskcardData extends StatelessWidget {
  final String title;
  final String description;
  final Color color;
  final Color colorf;
  final String date;
  final String status;
  final IconData icon1;
  final IconData icon2;

  TaskcardData({
    super.key,
    required this.title,
    required this.description,
    required this.color,
    required this.date,
    required this.status,
    required this.icon1,
    required this.icon2,
    required this.colorf
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 4),
             // Spacing between title and description
            Text(
              description, // Ensure description is displayed
              style: TextStyle(color: Colors.black, fontSize: 14),
            ),
            SizedBox(height: 8),
            Row(
              children: [
                Icon(icon1),
                SizedBox(
                  width: 5,
                ),
                Text(date, style: TextStyle(color: Colors.grey)),
                SizedBox(
                  width: 6,
                ),
                Icon(icon2, color: colorf,),
              ],
            ),
          ],
        ),
        Spacer(),
        Container(
          // Status Container Start
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          decoration: BoxDecoration(
            color: color.withOpacity(0.2),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Text(
            status,
            style: TextStyle(color: color),
          ),
        ), // Status Container End
        SizedBox(width: 8),
        Icon(Icons.more_vert),
      ]),
    );
  }
}
