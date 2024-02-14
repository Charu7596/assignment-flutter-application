class CreatePatientRequestBody {
  final String fullName;
  final String phone;
  final String gender;

  CreatePatientRequestBody({
    required this.fullName,
    required this.phone,
    required this.gender,
  });

  Map<String, dynamic> toJson() {
    return {
      'full_name': fullName,
      'phone': phone,
      'gender': gender,
    };
  }
}
