class PatientRequestModel {
  final String doctorId;
  final String patientId;
  final String slotValue;
  final String status;
  final String createdOn;
  final String scheduledDate;
  final String createdBy;

  PatientRequestModel({
    required this.doctorId,
    required this.patientId,
    required this.slotValue,
    required this.status,
    required this.createdOn,
    required this.scheduledDate,
    required this.createdBy,
  });

  Map<String, dynamic> toJson() {
    return {
      'doctor_id': doctorId,
      'patient_id': patientId,
      'slot_value': slotValue,
      'status': status,
      'created_on': createdOn,
      'scheduled_date': scheduledDate,
      'created_by': createdBy,
    };
  }
}
