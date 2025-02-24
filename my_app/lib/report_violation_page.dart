import 'package:flutter/material.dart';
import 'home_page.dart'; // Import the Home Page

class ReportViolationPage extends StatefulWidget {
  @override
  _ReportViolationPageState createState() => _ReportViolationPageState();
}

class _ReportViolationPageState extends State<ReportViolationPage> {
  final TextEditingController _vehicleNoController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();
  final TextEditingController _timeController = TextEditingController();
  final TextEditingController _commentController = TextEditingController();
  String? _selectedViolationType;

  // Dummy list of violation types
  final List<String> _violationTypes = [
    'Over-speeding',
    'Unauthorized Parking',
    'Reckless Driving',
    'Signal Jumping',
    'Other',
  ];

  void _submitReport(BuildContext context) {
    // Simulate report submission
    if (_vehicleNoController.text.isNotEmpty &&
        _selectedViolationType != null &&
        _locationController.text.isNotEmpty &&
        _dateController.text.isNotEmpty &&
        _timeController.text.isNotEmpty &&
        _commentController.text.isNotEmpty) {
      // Show a success message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Violation Reported Successfully!')),
      );

      // Navigate to the Home Page
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else {
      // Show an error message if any field is empty
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please fill in all fields')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Report Violation'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Upload Image/Video Button
              ElevatedButton(
                onPressed: () {
                  // Add image/video upload logic here
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade800,
                  padding: EdgeInsets.symmetric(vertical: 15),
                ),
                child: Text(
                  'Upload your file (image/video)',
                  style: TextStyle(fontSize: 16),
                ),
              ),
              SizedBox(height: 20),
              // Vehicle Number Field
              TextField(
                controller: _vehicleNoController,
                decoration: InputDecoration(
                  labelText: 'Vehicle no*',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              // Violation Type Dropdown
              DropdownButtonFormField<String>(
                value: _selectedViolationType,
                decoration: InputDecoration(
                  labelText: 'Violation Type',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                ),
                items: _violationTypes.map((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedViolationType = value;
                  });
                },
              ),
              SizedBox(height: 20),
              // Location Field
              TextField(
                controller: _locationController,
                decoration: InputDecoration(
                  labelText: 'Location',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              // Date and Time Fields
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _dateController,
                      decoration: InputDecoration(
                        labelText: 'Date (DD/MM/YYYY)',
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      controller: _timeController,
                      decoration: InputDecoration(
                        labelText: 'Time',
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              // Comment Field
              TextField(
                controller: _commentController,
                maxLines: 3,
                maxLength: 200,
                decoration: InputDecoration(
                  labelText: 'Comment (Max 200 characters)',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              SizedBox(height: 20),
              // Submit Button
              ElevatedButton(
                onPressed: () => _submitReport(context), // Call the submit function
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade800,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                ),
                child: Text(
                  'Submit',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}