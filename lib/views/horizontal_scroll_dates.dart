import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/constants.dart';

class HorizontalScrollDates extends StatefulWidget {
  final Function(String month, String date, String day) onDateSelected;

  const HorizontalScrollDates({super.key, required this.onDateSelected});

  @override
  State<HorizontalScrollDates> createState() => _HorizontalScrollDatesState();
}

class _HorizontalScrollDatesState extends State<HorizontalScrollDates> {
  int _selectedIndex = -1;
  late List<DateTime> dates;

  @override
  void initState() {
    super.initState();
    dates =
        List.generate(30, (index) => DateTime.now().add(Duration(days: index)));
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150.0,
      child: Expanded(
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: dates.length,
          itemBuilder: (BuildContext context, int index) {
            DateTime currentDate = dates[index];
            String month = Constants.getMonthName(currentDate.month);
            String date = '${currentDate.day}';
            String dayOfWeek = Constants.getDayOfWeek(currentDate);

            return GestureDetector(
              onTap: () {
                setState(() {
                  _selectedIndex = index;
                });
                widget.onDateSelected(month, date, dayOfWeek);
              },
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Container(
                    decoration: BoxDecoration(
                      color: _selectedIndex == index
                          ? const Color.fromARGB(255, 162, 190, 237)
                              .withOpacity(0.3)
                          : null,
                      border: Border.all(
                          color: _selectedIndex == index
                              ? const Color.fromARGB(255, 162, 190, 237)
                                  .withOpacity(0.3)
                              : Colors.grey),
                      borderRadius: BorderRadius.circular(25.0),
                    ),
                    child: Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // Month
                          Padding(
                            padding: const EdgeInsets.only(left: 12.0, right: 12.0, bottom: 8.0),
                            child: Text(month),
                          ),
                          const SizedBox(width: 8.0),
                          // Date
                          Padding(
                            padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 8.0, bottom: 8.0),
                            child: Text(date),
                          ),
                          const SizedBox(width: 8.0),
                          // Day
                          Padding(
                            padding: const EdgeInsets.only(left: 12.0, right: 12.0, top: 8.0),
                            child: Text(dayOfWeek),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

}
