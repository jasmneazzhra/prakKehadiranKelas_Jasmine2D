import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/student.dart';
import 'package:kehadirankelas_jasmine/providers/attendance_providers.dart';

class AttendanceList extends StatelessWidget {
  final List<Student> students;

  const AttendanceList({super.key, required this.students});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: students.length,
      itemBuilder: (context, index) {
        final student = students[index];
        return ListTile(
          title: Text(student.name),
          trailing: Checkbox(
            value: student.isPresent,
            onChanged: (value) =>
                Provider.of<AttendanceProvider>(context, listen: false)
                    .toggleAttendance(index),
          ),
        );
      },
    );
  }
}
