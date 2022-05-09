import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_pong/main_dev.dart';
import 'package:uuid/uuid.dart';
import '../providers/my_providers.dart';

class AddPlayerFields extends ConsumerStatefulWidget {
  const AddPlayerFields({Key? key}) : super(key: key);

  @override
  _AddPlayerFieldsState createState() => _AddPlayerFieldsState();
}

class _AddPlayerFieldsState extends ConsumerState<AddPlayerFields> {
  final formKey = GlobalKey<FormState>();
  String email = '';
  String userName = '';
  @override
  Widget build(
    BuildContext context,
  ) {
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

  Widget buildEmail() => Padding(
        padding: const EdgeInsets.only(top: 10),
        child: TextFormField(
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color.fromARGB(255, 130, 164, 193),
              ),
            ),
            labelText: 'Email',
            labelStyle: TextStyle(color: Color.fromARGB(255, 130, 164, 193)),
            prefixIcon:
                Icon(Icons.mail, color: Color.fromARGB(255, 130, 164, 193)),
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
        ),
      );

  Widget buildUserName() => Padding(
        padding: const EdgeInsets.only(top: 10),
        child: TextFormField(
          decoration: InputDecoration(
            labelText: 'User name',
            labelStyle: TextStyle(color: Color.fromARGB(255, 130, 164, 193)),
            prefixIcon:
                Icon(Icons.person, color: Color.fromARGB(255, 130, 164, 193)),
            border: OutlineInputBorder(),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Color.fromARGB(255, 130, 164, 193),
              ),
            ),
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
        ),
      );

  Widget buildSubmitButton() => ElevatedButton(
        onPressed: () {
          final isValid = formKey.currentState!.validate();
          if (isValid) {
            formKey.currentState!.save();

            ref.read(playerProvider.notifier).addPlayer(
                Player(name: userName, email: email, id: Uuid().v4()));
            final message = 'UserName: $userName\nEmail:$email';

            final snackBar = SnackBar(
              content: Text(
                message,
                style: TextStyle(fontSize: 20),
              ),
              backgroundColor: Color.fromARGB(255, 23, 44, 63),
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
          }
        },
        child: Text('submit'),
      );
}
// ranking: "1"