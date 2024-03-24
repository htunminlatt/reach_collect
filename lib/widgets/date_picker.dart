import 'package:flutter/material.dart';

class DatePicker extends StatefulWidget {
  const DatePicker({super.key, required this.dateString});
  final Function(String) dateString;

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  DateTime selectedDate = DateTime.now();

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(1900),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
        widget.dateString("${selectedDate.toLocal()}".split(' ')[0]);
      });
    }
  }
  @override
  Widget build(BuildContext context) {
     return InkWell(
      onTap: () {
        _selectDate(context);
      },
       child: Container(
        height: 50,
        width: 250,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: const [
              BoxShadow(blurRadius: 5.0, spreadRadius: 5.0, color: Colors.black12)
            ]),
            child:  Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                "${selectedDate.toLocal()}".split(' ')[0],
                style:const TextStyle(fontSize: 17),
              ),
               const Icon(Icons.date_range)
              ],
            ),
           ),
     );
  }
}