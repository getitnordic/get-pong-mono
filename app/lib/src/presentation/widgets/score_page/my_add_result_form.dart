import 'package:flutter/material.dart';

class AddResultForm extends StatefulWidget {
  final int setId;
  final Function(double) callback;
  final Function(int) getSetId;

  const AddResultForm(
      {Key? key,
      required this.callback,
      required this.setId,
      required this.getSetId})
      : super(key: key);

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

  Widget buildResultSlider() => Slider(
        value: _currentSliderValue,
        max: 11,
        divisions: 11,
        label: _currentSliderValue.round().toString(),
        onChanged: (double value) {
          setState(() {
            _currentSliderValue = value;
          });
          widget.getSetId(widget.setId);
          widget.callback(_currentSliderValue);
        },
      );
}
