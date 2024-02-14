import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/api_calls.dart';
import 'package:flutter_application_1/views/constants.dart';
import 'package:flutter_application_1/views/schedule_appointment.dart';

class BookAppointment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Constants.bookAppointment),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => _buildAppointmentWidget(),
              ),
            );
          },
          child: Text(Constants.bookAppointment),
        ),
      ),
    );
  }

  Widget _buildAppointmentWidget() {
  return FutureBuilder(
    future: fetchPatientData(),
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (snapshot.hasError) {
        return Text('Error fetching patient data: ${snapshot.error}');
      } else {
        return ScheduleAppointmentScreen();
      }
    },
  );
}

}
