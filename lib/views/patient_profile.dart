import 'package:flutter/material.dart';
import 'package:flutter_application_1/appointment_store.dart';
// import 'package:flutter_application_1/controllers/api_calls.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class PatientProfile extends StatelessWidget {
  final AppointmentStore appointmentStore;

  const PatientProfile({super.key, required this.appointmentStore});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Patient Profile'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 60.0,
              //backgroundImage: AssetImage('path/to/profile_picture.jpg'),
            ),
            const SizedBox(height: 20.0),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Name*',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                appointmentStore.setName(value);
              },
            ),
            const SizedBox(height: 16.0),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Phone Number*',
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                appointmentStore.setNumber(value);
              },
            ),
            const SizedBox(height: 20.0),
            Observer(
              builder: (_) => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  buildRadio('M', appointmentStore.selectedGender,
                      appointmentStore.setSelectedGender),
                  buildRadio('F', appointmentStore.selectedGender,
                      appointmentStore.setSelectedGender),
                  buildRadio('Other', appointmentStore.selectedGender,
                      appointmentStore.setSelectedGender),
                ],
              ),
            ),
            const SizedBox(height: 20.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Appointment Details'),
                Observer(
                  builder: (_) => Row(
                    children: [
                      Text(
                          '${appointmentStore.selectedDoctor}, ${appointmentStore.selectedDate} ${appointmentStore.selectedMonth}, ${appointmentStore.timeValue} ${appointmentStore.selectedTime}',
                          style: const TextStyle(
                            fontFamily: 'M3',
                            fontWeight: FontWeight.w400,
                            fontSize: 22.0,
                            color: Color(0xFF006590),
                          )),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30.0),
              child: ElevatedButton(
                onPressed: () {
                  //final data = await createPatient();
                  //print('data $data');
                  if(appointmentStore.name != '' && appointmentStore.number != '') {
                    showDialog(
                    context: context,
                    builder: (_) => AlertDialog(
                      title: const Text('Appointment Details'),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Name: ${appointmentStore.name}'),
                          Text('Phone Number: ${appointmentStore.number}'),
                          Text('Doctor: ${appointmentStore.selectedDoctor}'),
                          Text(
                              'Date: ${appointmentStore.selectedDate} ${appointmentStore.selectedMonth}'),
                          Text('Time: ${appointmentStore.selectedTime}'),
                        ],
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('OK'),
                        ),
                      ],
                    ),
                  );
                  }
                },
                child: const Text('Create & Book Appointment'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildRadio(
      String value, String selectedValue, Function(String) onChanged) {
    return Row(
      children: [
        Radio(
          value: value,
          groupValue: selectedValue,
          onChanged: (newValue) {
            onChanged(newValue.toString());
          },
        ),
        Text(value),
      ],
    );
  }
}
