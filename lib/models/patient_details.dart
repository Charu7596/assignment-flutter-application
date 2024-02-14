class Patient {
  final String patientId;
  final String fullName;
  final String firstName;
  final String phone;
  final String dateOfBirth;
  final String address;
  final String height;
  final String weight;
  final String gender;
  final String slotValue;
  final String status;
  final String scheduledDate;

  Patient({
    required this.patientId,
    required this.fullName,
    required this.firstName,
    required this.phone,
    required this.dateOfBirth,
    required this.address,
    required this.height,
    required this.weight,
    required this.gender,
    required this.slotValue,
    required this.status,
    required this.scheduledDate,
  });

  factory Patient.fromJson(Map<String, dynamic> json) {
    return Patient(
      patientId: json['patient_id'],
      fullName: json['full_name'],
      firstName: json['first_name'],
      phone: json['phone'],
      dateOfBirth: json['date_of_birth'],
      address: json['address'],
      height: json['height'],
      weight: json['weight'],
      gender: json['gender'],
      slotValue: json['slot_value'],
      status: json['status'],
      scheduledDate: json['scheduled_date'],
    );
  }
}
