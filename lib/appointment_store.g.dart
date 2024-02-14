// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'appointment_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AppointmentStore on _AppointmentStore, Store {
  late final _$selectedMonthAtom =
      Atom(name: '_AppointmentStore.selectedMonth', context: context);

  @override
  String get selectedMonth {
    _$selectedMonthAtom.reportRead();
    return super.selectedMonth;
  }

  @override
  set selectedMonth(String value) {
    _$selectedMonthAtom.reportWrite(value, super.selectedMonth, () {
      super.selectedMonth = value;
    });
  }

  late final _$selectedDateAtom =
      Atom(name: '_AppointmentStore.selectedDate', context: context);

  @override
  String get selectedDate {
    _$selectedDateAtom.reportRead();
    return super.selectedDate;
  }

  @override
  set selectedDate(String value) {
    _$selectedDateAtom.reportWrite(value, super.selectedDate, () {
      super.selectedDate = value;
    });
  }

  late final _$selectedDayAtom =
      Atom(name: '_AppointmentStore.selectedDay', context: context);

  @override
  String get selectedDay {
    _$selectedDayAtom.reportRead();
    return super.selectedDay;
  }

  @override
  set selectedDay(String value) {
    _$selectedDayAtom.reportWrite(value, super.selectedDay, () {
      super.selectedDay = value;
    });
  }

  late final _$selectedDoctorAtom =
      Atom(name: '_AppointmentStore.selectedDoctor', context: context);

  @override
  String get selectedDoctor {
    _$selectedDoctorAtom.reportRead();
    return super.selectedDoctor;
  }

  @override
  set selectedDoctor(String value) {
    _$selectedDoctorAtom.reportWrite(value, super.selectedDoctor, () {
      super.selectedDoctor = value;
    });
  }

  late final _$selectedTimeAtom =
      Atom(name: '_AppointmentStore.selectedTime', context: context);

  @override
  String get selectedTime {
    _$selectedTimeAtom.reportRead();
    return super.selectedTime;
  }

  @override
  set selectedTime(String value) {
    _$selectedTimeAtom.reportWrite(value, super.selectedTime, () {
      super.selectedTime = value;
    });
  }

  late final _$selectedGenderAtom =
      Atom(name: '_AppointmentStore.selectedGender', context: context);

  @override
  String get selectedGender {
    _$selectedGenderAtom.reportRead();
    return super.selectedGender;
  }

  @override
  set selectedGender(String value) {
    _$selectedGenderAtom.reportWrite(value, super.selectedGender, () {
      super.selectedGender = value;
    });
  }

  late final _$nameAtom =
      Atom(name: '_AppointmentStore.name', context: context);

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$numberAtom =
      Atom(name: '_AppointmentStore.number', context: context);

  @override
  String get number {
    _$numberAtom.reportRead();
    return super.number;
  }

  @override
  set number(String value) {
    _$numberAtom.reportWrite(value, super.number, () {
      super.number = value;
    });
  }

  late final _$timeValueAtom =
      Atom(name: '_AppointmentStore.timeValue', context: context);

  @override
  int get timeValue {
    _$timeValueAtom.reportRead();
    return super.timeValue;
  }

  @override
  set timeValue(int value) {
    _$timeValueAtom.reportWrite(value, super.timeValue, () {
      super.timeValue = value;
    });
  }

  late final _$_AppointmentStoreActionController =
      ActionController(name: '_AppointmentStore', context: context);

  @override
  void setTimeValue(int value) {
    final _$actionInfo = _$_AppointmentStoreActionController.startAction(
        name: '_AppointmentStore.setTimeValue');
    try {
      return super.setTimeValue(value);
    } finally {
      _$_AppointmentStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setName(String newName) {
    final _$actionInfo = _$_AppointmentStoreActionController.startAction(
        name: '_AppointmentStore.setName');
    try {
      return super.setName(newName);
    } finally {
      _$_AppointmentStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setNumber(String newPhoneNumber) {
    final _$actionInfo = _$_AppointmentStoreActionController.startAction(
        name: '_AppointmentStore.setNumber');
    try {
      return super.setNumber(newPhoneNumber);
    } finally {
      _$_AppointmentStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelectedGender(String value) {
    final _$actionInfo = _$_AppointmentStoreActionController.startAction(
        name: '_AppointmentStore.setSelectedGender');
    try {
      return super.setSelectedGender(value);
    } finally {
      _$_AppointmentStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateState(
      {String? month,
      String? date,
      String? day,
      String? doctor,
      String? time}) {
    final _$actionInfo = _$_AppointmentStoreActionController.startAction(
        name: '_AppointmentStore.updateState');
    try {
      return super.updateState(
          month: month, date: date, day: day, doctor: doctor, time: time);
    } finally {
      _$_AppointmentStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
selectedMonth: ${selectedMonth},
selectedDate: ${selectedDate},
selectedDay: ${selectedDay},
selectedDoctor: ${selectedDoctor},
selectedTime: ${selectedTime},
selectedGender: ${selectedGender},
name: ${name},
number: ${number},
timeValue: ${timeValue}
    ''';
  }
}
