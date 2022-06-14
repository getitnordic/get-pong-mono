import 'package:flutter/material.dart';

class AddResultForm extends StatefulWidget {
  final Function(double) callback;

  const AddResultForm({Key? key, required this.callback}) : super(key: key);

  @override
  State<AddResultForm> createState() => _AddResultFormState();
}

class _AddResultFormState extends State<AddResultForm> {
  final formKey = GlobalKey<FormState>();
  double _currentSliderValue = 5;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: buildResultSlider(),
    );
  }

  Widget buildResultSlider() => Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Slider(
          value: _currentSliderValue,
          max: 11,
          divisions: 11,
          label: _currentSliderValue.round().toString(),
          onChanged: (double value) {
            setState(() {
              _currentSliderValue = value;
            });
            widget.callback(_currentSliderValue);
          },
        ),
      );
}
