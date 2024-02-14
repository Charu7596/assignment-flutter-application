class CreatePatientId {
  final String id;

  CreatePatientId({
    required this.id,
  });

  factory CreatePatientId.fromJson(Map<String, dynamic> json) {
    return CreatePatientId(
      id: json['patient_id'],
    );
  }
}
