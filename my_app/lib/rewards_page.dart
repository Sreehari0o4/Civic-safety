import 'package:flutter/material.dart';

class RewardsPage extends StatelessWidget {
  // Dummy data for demonstration
  final List<Map<String, String>> rewards = [
    {
      'amount': '₹100',
      'date': '2023-10-01',
    },
    {
      'amount': '₹50',
      'date': '2023-10-02',
    },
    {
      'amount': '₹200',
      'date': '2023-10-03',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final totalEarnings = rewards.fold(0, (sum, reward) {
      return sum + int.parse(reward['amount']!.replaceAll('₹', ''));
    });

    return Scaffold(
      appBar: AppBar(
        title: Text('Rewards'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Total Earnings: ₹$totalEarnings',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: rewards.length,
              itemBuilder: (context, index) {
                final reward = rewards[index];
                return Card(
                  margin: EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text('Amount: ${reward['amount']}'),
                    subtitle: Text('Date: ${reward['date']}'),
                    trailing: Icon(Icons.currency_rupee, color: Colors.green),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}