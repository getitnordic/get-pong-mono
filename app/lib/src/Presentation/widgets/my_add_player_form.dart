import 'package:flutter/material.dart';

class AddPlayerFields extends StatefulWidget {
  const AddPlayerFields({Key? key}) : super(key: key);

  @override
  State<AddPlayerFields> createState() => _AddPlayerFieldsState();
}

class _AddPlayerFieldsState extends State<AddPlayerFields> {
  final formKey = GlobalKey<FormState>();
  String email = '';
  String userName = '';

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          buildEmail(),
          buildUserName(),
          buildSubmitButton(),
        ],
      ),
    );
  }

  Widget buildEmail() => TextFormField(
        decoration: InputDecoration(
          labelText: 'email',
          prefixIcon: Icon(Icons.mail),
          border: OutlineInputBorder(),
        ),
        keyboardType: TextInputType.emailAddress,
        validator: (value) {
          final pattern =
              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
          final regExp = RegExp(pattern);

          if (!regExp.hasMatch(value!)) {
            return 'Enter a valid email';
          } else {
            return null;
          }
        },
        onSaved: (value) => setState(() => email = value!),
      );

  Widget buildUserName() => TextFormField(
        decoration: InputDecoration(
          labelText: 'userName',
          prefixIcon: Icon(Icons.person),
          border: OutlineInputBorder(),
        ),
        keyboardType: TextInputType.text,
        validator: (value) {
          if (value!.length < 4) {
            return 'UserName must at least have 4 characters';
          } else {
            return null;
          }
        },
        onSaved: (value) => setState(() => userName = value!),
      );

  Widget buildSubmitButton() => ElevatedButton(
        onPressed: () {
          final isValid = formKey.currentState!.validate();
          if (isValid) {
            formKey.currentState!.save();
            final message = 'UserName: $userName\nEmail:$email';
            final snackBar = SnackBar(
              content: Text(
                message,
                style: TextStyle(fontSize: 20),
              ),
              backgroundColor: Colors.green,
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
        child: Text('submit'),
      );
}
