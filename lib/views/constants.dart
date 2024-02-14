class Constants {

  static String get bookAppointment => "Book Appointment";

  static String get am => "AM";

  static String get pm => "PM";

  static String get patientProfile => "Patient Profile";

  static String get labelNumber => "Phone Number*";

  static String get labelName => "Name*";

  static String get appointMentDetails => "Appointment Details";

  static String getMonthName(int month) {
    final List<String> monthNames = [
      '',
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];

    return monthNames[month];
  }

  static String getDayOfWeek(DateTime date) {
  switch (date.weekday) {
    case 1:
      return 'Mon';
    case 2:
      return 'Tue';
    case 3:
      return 'Wed';
    case 4:
      return 'Thu';
    case 5:
      return 'Fri';
    case 6:
      return 'Sat';
    case 7:
      return 'Sun';
    default:
      return '';
  }
  }
}