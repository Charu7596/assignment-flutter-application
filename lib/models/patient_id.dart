class PatientId {
  final int id;

  PatientId({
    required this.id,
  });

  factory PatientId.fromJson(Map<String, dynamic> json) {
    return PatientId(
      id: json['id'],
    );
  }
}
