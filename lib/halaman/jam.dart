    import 'package:flutter/material.dart';
    import 'package:intl/intl.dart';

    class TimeConverter extends StatefulWidget {
      @override
      _TimeConverterState createState() => _TimeConverterState();
    }

    class _TimeConverterState extends State<TimeConverter> {
      DateTime _selectedTime = DateTime.now();

      @override
      Widget build(BuildContext context) {
        return Scaffold(
          backgroundColor: Colors.red[100],
          appBar: AppBar(
            title: Text('Time Converter'),
            backgroundColor: Colors.red,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildTimePicker(),
                SizedBox(height: 20),
                _buildConvertedTimes(),
              ],
            ),
          ),
        );
      }

      Widget _buildTimePicker() {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Selected Time: ${DateFormat('HH:mm:ss').format(_selectedTime.toLocal())}',
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(width: 20),
            ElevatedButton(
              onPressed: () => _selectTime(context),
              child: Text('Pick Time'),
            ),
          ],
        );
      }

      Widget _buildConvertedTimes() {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _buildConvertedTime('WIB', Duration(hours: 7)),
            _buildConvertedTime('WITA', Duration(hours: 8)),
            _buildConvertedTime('WIT', Duration(hours: 9)),
            _buildConvertedTime('London', Duration(hours: 0)),
          ],
        );
      }

      Widget _buildConvertedTime(String location, Duration timeDifference) {
        DateTime convertedTime = _selectedTime.add(timeDifference);

        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Text(
            '$location: ${DateFormat('HH:mm:ss').format(convertedTime)}',
            style: TextStyle(fontSize: 18),
          ),
        );
      }

      Future<void> _selectTime(BuildContext context) async {
        TimeOfDay? pickedTime = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.fromDateTime(_selectedTime.toLocal()), // Initial time in local timezone
        );

        if (pickedTime != null) {
          DateTime selectedDateTime = DateTime(
            _selectedTime.year,
            _selectedTime.month,
            _selectedTime.day,
            pickedTime.hour,
            pickedTime.minute,
          );

          // Convert selectedDateTime to WIB timezone
          DateTime selectedTimeWIB = selectedDateTime.toUtc().subtract(Duration(hours: 0));

          setState(() {
            _selectedTime = selectedTimeWIB;
          });
        }
      }
    }