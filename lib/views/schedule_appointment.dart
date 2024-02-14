import 'package:flutter/material.dart';
import 'package:flutter_application_1/appointment_store.dart';
import 'package:flutter_application_1/controllers/api_calls.dart';
import 'package:flutter_application_1/views/circular_time.dart';
import 'package:flutter_application_1/views/constants.dart';
import 'package:flutter_application_1/views/doctors_dropdown.dart';
import 'package:flutter_application_1/views/horizontal_scroll_dates.dart';
import 'package:flutter_application_1/views/patient_profile.dart';

class ScheduleAppointmentScreen extends StatefulWidget {
  @override
  _ScheduleAppointmentScreenState createState() =>
      _ScheduleAppointmentScreenState();
}

class _ScheduleAppointmentScreenState extends State<ScheduleAppointmentScreen> {
  final AppointmentStore appointmentStore = AppointmentStore();
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Appointments',
          style: TextStyle(
            fontFamily: 'M3',
            fontWeight: FontWeight.w500,
            fontSize: 14.0,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20.0, top: 16.0, right: 20.0),
        child: _isLoading
            ? const Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  Row(
                    children: [
                      const Expanded(
                        child: Text(
                          'Pick a Date',
                          style: TextStyle(
                            fontFamily: 'M3',
                            fontWeight: FontWeight.w400,
                            fontSize: 22.0,
                            color: Color(0xFF006590),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () => _launchCalendar(context),
                        child: const Icon(
                          Icons.calendar_today,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  HorizontalScrollDates(
                    onDateSelected: (String month, String date, String day) {
                      setState(() {
                        appointmentStore.updateState(
                          month: month,
                          date: date,
                          day: day,
                        );
                      });
                    },
                  ),
                  const SizedBox(height: 40),
                  DoctorDropdown(
                    onDoctorSelected: (String doctorName) {
                      setState(() {
                        appointmentStore.selectedDoctor = doctorName;
                      });
                    },
                    onTimeSelected: (String time) {
                      setState(() {
                        appointmentStore.selectedTime = time;
                      });
                    },
                  ),
                  CircularTimeSlots(
                    availableSlot: 4,
                    time: appointmentStore.selectedTime,
                    onTap: handleCircleTap,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      postPatientData().then((patient) {
                        print(patient);
                        if (appointmentStore.selectedDate != '' &&
                            appointmentStore.selectedDoctor != '' &&
                            appointmentStore.selectedTime != '' &&
                            appointmentStore.timeValue != 0) {
                          setState(() {
                            _isLoading = true;
                          });
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PatientProfile(
                                      appointmentStore: appointmentStore,
                                    )),
                          );
                        }
                        setState(() {
                          _isLoading = false;
                        });
                      }).catchError((error) {
                        print('Error fetching patient data: $error');
                        setState(() {
                          _isLoading = false;
                        });
                      });
                    },
                    child: const Text('Schedule Appointment'),
                  ),
                ],
              ),
      ),
    );
  }

  _launchCalendar(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null) {
      final DateTime pickedDate = picked;
      final String month = Constants.getMonthName(pickedDate.month);
      final day = Constants.getDayOfWeek(pickedDate);
      final int date = pickedDate.day;
      appointmentStore.updateState(
        month: month,
        date: date.toString(),
        day: day,
      );
    }
  }

  void handleCircleTap(int tappedValue) {
    print('Tapped value: $tappedValue');
    appointmentStore.setTimeValue(tappedValue);
  }
}
