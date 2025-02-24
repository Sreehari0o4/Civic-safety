import 'package:flutter/material.dart';

class ReportStatusPage extends StatelessWidget {
  // Dummy data for demonstration
  final List<Map<String, String>> reports = [
    {
      'description': 'Over-speeding on Highway',
      'status': 'Pending',
      'timestamp': '2023-10-01 10:30 AM',
    },
    {
      'description': 'Unauthorized parking',
      'status': 'Verified',
      'timestamp': '2023-10-02 02:15 PM',
    },
    {
      'description': 'Reckless driving',
      'status': 'Rejected',
      'timestamp': '2023-10-03 09:45 AM',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Report Status'),
      ),
      body: ListView.builder(
        itemCount: reports.length,
        itemBuilder: (context, index) {
          final report = reports[index];
          return Card(
            margin: EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(report['description']!),
              subtitle: Text('Status: ${report['status']} - ${report['timestamp']}'),
              trailing: Icon(
                report['status'] == 'Verified'
                    ? Icons.check_circle
                    : report['status'] == 'Rejected'
                        ? Icons.cancel
                        : Icons.pending,
                color: report['status'] == 'Verified'
                    ? Colors.green
                    : report['status'] == 'Rejected'
                        ? Colors.red
                        : Colors.orange,
              ),
            ),
          );
        },
      ),
    );
  }
}