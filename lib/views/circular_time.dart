import 'package:flutter/material.dart';
import 'package:flutter_application_1/views/constants.dart';
// import 'package:flutter_application_1/views/interval_painter.dart';

class CircularTimeSlots extends StatefulWidget {
  final int availableSlot;
  final String time;
  final Function(int) onTap;

  const CircularTimeSlots(
      {Key? key,
      required this.availableSlot,
      required this.time,
      required this.onTap})
      : super(key: key);

  @override
  State<CircularTimeSlots> createState() => _CircularTimeSlotsState();
}

class _CircularTimeSlotsState extends State<CircularTimeSlots> {
  int selectedHour = -1;

  @override
  Widget build(BuildContext context) {
    int startingHour = (widget.time == Constants.am) ? 8 : 5;
    return SizedBox(
      height: 200,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(
          4,
          (index) => Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedHour = startingHour + index;
                    });
                    widget.onTap(startingHour + index);
                  },
                  child: Container(
                    width: double.infinity,
                    height: double.infinity,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.black, width: 2),
                      color: selectedHour == startingHour + index
                          ? const Color.fromARGB(255, 162, 190, 237)
                                  .withOpacity(0.3)
                          : null,
                    ),
                  ),
                ),
                // Positioned.fill(
                //   child: CustomPaint(
                //     painter: IntervalPainter(
                //       availableSlot: availableSlot,
                //       index: index,
                //     ),
                //   ),
                // ),
                Positioned(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '${startingHour + index}',
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
