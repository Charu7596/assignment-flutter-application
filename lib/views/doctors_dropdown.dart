import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/constants.dart';

class DoctorDropdown extends StatefulWidget {
  final Function(String doctorName) onDoctorSelected;
  final Function(String time) onTimeSelected;

  const DoctorDropdown(
      {super.key,
      required this.onDoctorSelected,
      required this.onTimeSelected});

  @override
  _DoctorDropdownState createState() => _DoctorDropdownState();
}

class _DoctorDropdownState extends State<DoctorDropdown> {
  String selectedTime = '';

  @override
  Widget build(BuildContext context) {
    List<String> doctors = [
      'Dr. Smith',
      'Dr. Johnson',
      'Dr. Williams',
      'Dr. Jones',
      'Dr. Brown',
    ];
    String selectedDoctor = doctors[0];

    return Row(
      children: [
        Container(
            width: 180,
            decoration: BoxDecoration(
              border:
                  Border.all(color: const Color.fromARGB(255, 162, 190, 237)),
              borderRadius: BorderRadius.circular(15.0),
            ),
            child: DropdownButtonFormField<String>(
              value: selectedDoctor,
              items: doctors.map((String doctor) {
                return DropdownMenuItem<String>(
                  value: doctor,
                  child: Text(doctor),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedDoctor = value ?? '';
                });
                widget.onDoctorSelected(selectedDoctor);
              },
            )),
        const SizedBox(
          width: 10,
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              selectedTime = Constants.am;
            });
            widget.onTimeSelected(selectedTime);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: selectedTime == Constants.am
                ? const Color.fromARGB(255, 162, 190, 237).withOpacity(0.3)
                : null,
          ),
          child: Text(Constants.am),
        ),
        const SizedBox(width: 10),
        ElevatedButton(
          onPressed: () {
            setState(() {
              selectedTime = Constants.pm;
            });
            widget.onTimeSelected(selectedTime);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: selectedTime == Constants.pm
                ? const Color.fromARGB(255, 162, 190, 237).withOpacity(0.3)
                : null,
          ),
          child: Text(Constants.pm),
        ),
      ],
    );
  }
}
