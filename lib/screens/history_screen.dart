import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:kehadirankelas_jasmine/providers/attendance_providers.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final history = Provider.of<AttendanceProvider>(context).history;

    return Scaffold(
      appBar: AppBar(title: const Text('Riwayat Kehadiran')),
      body: ListView.builder(
        itemCount: history.length,
        itemBuilder: (context, index) {
          final record = history[index];
          final date = record['date'] as DateTime;
          final formattedDate = '${date.day}-${date.month}-${date.year}';
          return ListTile(
            title: Text(formattedDate),
            subtitle: Text(
                'Hadir: ${record['present']}, Tidak Hadir: ${record['absent']}'),
          );
        },
      ),
    );
  }
}
