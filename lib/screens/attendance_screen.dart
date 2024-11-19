import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:kehadirankelas_jasmine/providers/attendance_providers.dart';
import 'package:kehadirankelas_jasmine/widgets/attendance_list.dart';

class AttendanceScreen extends StatelessWidget {
  const AttendanceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<AttendanceProvider>(context);
    final students = provider.students;

    return Scaffold(
      appBar: AppBar(title: const Text('Presensi Siswa')),
      body: AttendanceList(students: students),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: students.isEmpty
              ? null
              : () {
                  provider.saveAttendance();
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Kehadiran disimpan!')),
                  );
                },
          child: const Text('Simpan Kehadiran'),
        ),
      ),
    );
  }
}
