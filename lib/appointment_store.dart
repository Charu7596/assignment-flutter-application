import 'package:mobx/mobx.dart';

part 'appointment_store.g.dart';

class AppointmentStore = _AppointmentStore with _$AppointmentStore;

abstract class _AppointmentStore with Store {
  @observable
  String selectedMonth = '';

  @observable
  String selectedDate = '';

  @observable
  String selectedDay = '';

  @observable
  String selectedDoctor = '';

  @observable
  String selectedTime = '';

  @observable
  String selectedGender = '';

  @observable
  String name = '';

  @observable
  String number = '';

  @observable
  int timeValue = 0;

  @action
  void setTimeValue(int value) {
    timeValue = value;
  }

  @action
  void setName(String newName) {
    name = newName;
  }

  @action
  void setNumber(String newPhoneNumber) {
    number = newPhoneNumber;
  }

  @action
  void setSelectedGender(String value) {
    selectedGender = value;
  }

  @action
  void updateState({
    String? month,
    String? date,
    String? day,
    String? doctor,
    String? time,
  }) {
    selectedMonth = month ?? selectedMonth;
    selectedDate = date ?? selectedDate;
    selectedDay = day ?? selectedDay;
    selectedDoctor = doctor ?? selectedDoctor;
    selectedTime = time ?? selectedTime;
  }
}
