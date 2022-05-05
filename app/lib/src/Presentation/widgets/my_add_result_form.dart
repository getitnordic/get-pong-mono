import 'package:flutter/material.dart';

class AddResultForm extends StatefulWidget {
  const AddResultForm({Key? key}) : super(key: key);

  @override
  State<AddResultForm> createState() => _AddResultFormState();
}

class _AddResultFormState extends State<AddResultForm> {
  final formKey = GlobalKey<FormState>();
  double _currentSliderValue = 20;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: buildResultSlider(),
    );
  }

  Widget buildResultSlider() => Padding(
        padding: EdgeInsets.only(top: 10),
        child: Slider(
          value: _currentSliderValue,
          max: 25,
          divisions: 25,
          label: _currentSliderValue.round().toString(),
          onChanged: (double value) {
            setState(() {
              _currentSliderValue = value;
            });
          },
        ),
      );
}
