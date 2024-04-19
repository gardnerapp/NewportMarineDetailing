import 'package:flutter/material.dart';
import 'booking_floating_action.dart';


class BookAppointment extends StatefulWidget {
  final Function handleDateChange;
  final Function handleTImeChange;

  const BookAppointment({super.key,
    required this.handleDateChange,
    required this.handleTImeChange});

  @override
  State<BookAppointment> createState() => _BookAppointmentState();
}

class _BookAppointmentState extends State<BookAppointment> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        BookingFloatingAction(
            onPressed: () async {
              await _selectDate(context);
              widget.handleDateChange(selectedDate);
            },
            iconData: Icons.calendar_today,
            heroTag: 'Date'
        ),
        BookingFloatingAction(
            onPressed: () async {
              await _selectTime(context);
              widget.handleTImeChange(selectedTime);
            },
            iconData: Icons.timer,
            heroTag: 'Time'
        ),

      ],
    );
  }

  _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime(
          2500, DateTime.september, 01
      ),
      helpText: "Please set a date for your appointment.",
      errorFormatText: "Enter a valid date",
      errorInvalidText: "Enter a valid date",
      builder: (context,child) {
        return DatePickerDialog(
            firstDate: DateTime.now(),
            lastDate: DateTime(
            2500, DateTime.september, 01
        )
        );
      }
    );
    if (picked != null){
      setState(() {
        selectedDate = picked;
      });
    }
  } // _selectDate

  _selectTime(BuildContext context) async {
    final TimeOfDay? newTime = await showTimePicker(
        context: context,
        initialTime: const TimeOfDay(hour: 7, minute: 00));

    if (newTime != null){
      setState(() {
        selectedTime = newTime;
      });
    }

  } // _selectTime

}

