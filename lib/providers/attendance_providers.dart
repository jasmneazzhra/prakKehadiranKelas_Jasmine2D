import 'package:flutter/material.dart';
import '../models/student.dart';

class AttendanceProvider extends ChangeNotifier {
  final List<Student> _students = [
    Student(name: 'Ali'),
    Student(name: 'Budi'),
    Student(name: 'Citra'),
  ];

  final List<Map<String, dynamic>> _history = [];

  List<Student> get students => _students;
  List<Map<String, dynamic>> get history => _history;

  void toggleAttendance(int index) {
    _students[index].isPresent = !_students[index].isPresent;
    notifyListeners();
  }

  void saveAttendance() {
    final date = DateTime.now();
    final presentCount = _students.where((student) => student.isPresent).length;
    final absentCount = _students.length - presentCount;

    _history.insert(0, {
      'date': date,
      'present': presentCount,
      'absent': absentCount,
    });

    // Reset attendance
    for (var student in _students) {
      student.isPresent = false;
    }
    notifyListeners();
  }
}
