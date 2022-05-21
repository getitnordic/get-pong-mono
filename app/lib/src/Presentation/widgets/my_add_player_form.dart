import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_pong/src/Presentation/providers/players_notifier.dart';
import '../../domain/entities/player.dart';
import '../../../config/route/route.dart' as route;

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
  Widget build(BuildContext context) {

    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            buildEmail(),
            buildUserName(),
            buildSubmitButton(),
          ],
        )
      ),
    );
  }

  Widget buildEmail() => Padding(
        padding: const EdgeInsets.only(
          top: 20,
        ),
        child: TextFormField(
          decoration: const InputDecoration(
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
            const pattern =
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
          decoration: const InputDecoration(
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
              return 'Username must at least have 4 characters';
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

            ref.read(playersProvider.notifier).addPlayer(Player(DateTime.now().toString(), userName, 0, 0, 'https://moonvillageassociation.org/wp-content/uploads/2018/06/default-profile-picture1-744x744.jpg'));
            const message = 'Player created!';

            final snackBar = SnackBar(
              content: SizedBox(
                width: 400,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      message,
                      style: TextStyle(fontSize: 15),
                    ),
                  ],
                ),
              ),
              duration: const Duration(seconds: 1),
              backgroundColor: const Color.fromARGB(255, 23, 44, 63),
              elevation: 1000,
              behavior: SnackBarBehavior.floating,
            );
            ScaffoldMessenger.of(context).showSnackBar(snackBar);
            Navigator.pop(context);
          }
        },
        child: const Text('submit'),
      );
}
// ranking: "1"