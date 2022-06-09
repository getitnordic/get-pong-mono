import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_pong/config/themes/color_constants.dart';
import 'package:get_pong/enums/streak_enum.dart';
import 'package:get_pong/src/Presentation/providers/players_notifier.dart';

import '../../domain/models/player.dart';

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
          )),
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
                color: ColorConstants.formColor,
              ),
            ),
            labelText: 'Email',
            labelStyle: TextStyle(color: ColorConstants.formColor),
            prefixIcon: Icon(Icons.mail, color: ColorConstants.formColor),
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
            labelStyle: TextStyle(color: ColorConstants.formColor),
            prefixIcon: Icon(Icons.person, color: ColorConstants.formColor),
            border: OutlineInputBorder(),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: ColorConstants.formColor,
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

  Widget buildSubmitButton() => Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: ElevatedButton(
          onPressed: () {
            final isValid = formKey.currentState!.validate();
            if (isValid) {
              formKey.currentState!.save();

              ref.read(playersProvider.notifier).addPlayer(Player(
                  DateTime.now().toString(),
                  userName,
                  0,
                  0,
                  'https://moonvillageassociation.org/wp-content/uploads/2018/06/default-profile-picture1-744x744.jpg',
                  '',
                  '',
                  '',
                  0,
                  0,
                  StreakEnum.none));
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
                duration: const Duration(seconds: 2),
                backgroundColor: ColorConstants.appBarColor,
                elevation: 1000,
                behavior: SnackBarBehavior.floating,
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
              Navigator.pop(context);
            }
          },
          style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            )),
            minimumSize: MaterialStateProperty.all<Size>(const Size(300, 50)),
            backgroundColor: MaterialStateProperty.resolveWith<Color>(
              (Set<MaterialState> states) {
                if (states.contains(MaterialState.pressed)) {
                  return ColorConstants.primaryColor;
                } else if (states.contains(MaterialState.disabled)) {
                  return ColorConstants.disabledButtonColor;
                }
                return ColorConstants.primaryColor;
              },
            ),
          ),
          child: const Text('submit'),
        ),
      );
}
// ranking: "1"
