import 'package:flutter/material.dart';

class HorizontalRadioButton extends StatefulWidget {
  const HorizontalRadioButton({super.key, required this.radioValue, required this.activeValue});

  final Function(String) radioValue;
  final String activeValue;

  @override
  // ignore: library_private_types_in_public_api
  _HorizontalRadioButtonsDemoState createState() =>
      _HorizontalRadioButtonsDemoState();
}

class _HorizontalRadioButtonsDemoState
    extends State<HorizontalRadioButton> {
  String _selectedValue = '';

  void _handleRadioValueChanged(String? value) {
    setState(() {
      _selectedValue = value ?? '';
      widget.radioValue(value ?? '');
    });
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      _selectedValue = widget.activeValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Row(
        children: <Widget>[
          Radio(
            value: 'true',
            groupValue: _selectedValue,
            onChanged: _handleRadioValueChanged,
          ),
          const Text('Yes'),
          const SizedBox(width: 10,),
          Radio(
            value: 'false',
            groupValue: _selectedValue,
            onChanged: _handleRadioValueChanged,
          ),
          const Text('No'),
          // Radio(
          //   value: 'Option 3',
          //   groupValue: _selectedValue,
          //   onChanged: _handleRadioValueChanged,
          // ),
          // Text('Option 3'),
        ],
      ),
    );
  }
}
