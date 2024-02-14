import 'package:flutter_application_1/models/create_patient_response.dart';
import 'package:flutter_application_1/models/patient_details.dart';
import 'package:flutter_application_1/models/patient_id.dart';
import 'package:flutter_application_1/models/request_body/create_patient_request_body.dart';
import 'package:flutter_application_1/models/request_body/patient_request_body.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<List<Patient>> fetchPatientData() async {
  final url = Uri.parse('https://oh5oe1gr6i.execute-api.ap-south-1.amazonaws.com/dev/admin/test?scheduled_date=2024-02-09&doctor_id=127');
  
  try {
    final response = await http.get(url);

    if (response.statusCode == 200) {
      print('Response body: ${response.body}');
      final List<dynamic> jsonArray = jsonDecode(response.body);
      final List<Patient> patients = jsonArray.map((json) => Patient.fromJson(json)).toList();
      return patients;
    }
  } catch (e) {
    print('An error occurred: $e');
  }
  return [];
}

Future<PatientId?> postPatientData() async {
  final url = Uri.parse('https://oh5oe1gr6i.execute-api.ap-south-1.amazonaws.com/dev/admin/test');

  final requestBody = PatientRequestModel(
    doctorId: '127',
    patientId: 'AR004',
    slotValue: '77',
    status: 'scheduled',
    createdOn: '',
    scheduledDate: '2024-02-09',
    createdBy: '1106',
  );

  final headers = {'Content-Type': 'application/json'};

  try {
    final response = await http.post(
      url,
      headers: headers,
      body: jsonEncode(requestBody.toJson()),
    );

    if (response.statusCode == 200) {
      print('Response body: ${response.body}');
      final jsonData = jsonDecode(response.body);
      final patientId = PatientId.fromJson(jsonData);
      return patientId;
    }
  } catch (e) {
    print('An error occurred: $e');
  }
  return null;
}

Future<CreatePatientId?> createPatient() async {
  final url = Uri.parse('https://oh5oe1gr6i.execute-api.ap-south-1.amazonaws.com/dev/admin/test/create-patient');

  final requestBody = CreatePatientRequestBody(
    fullName: 'hello world',
    phone: '9002134563',
    gender: 'Male',
  );

  final headers = {'Content-Type': 'application/json'};

  try {
    final response = await http.post(
      url,
      headers: headers,
      body: jsonEncode(requestBody.toJson()),
    );

    if (response.statusCode == 200) {
      print('Response body: ${response.body}');
      final jsonData = jsonDecode(response.body);
      final createPatientId = CreatePatientId.fromJson(jsonData);
      return createPatientId;
    }
  } catch (e) {
    print('An error occurred: $e');
  }
  return null;
}


