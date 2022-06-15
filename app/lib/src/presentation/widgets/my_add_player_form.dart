import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:get_pong/constants/color_constants.dart';
import 'package:get_pong/protos/base.pb.dart';
import 'package:get_pong/src/Presentation/providers/players_notifier.dart';
import 'package:get_pong/utils/mixins/validation_mixin.dart';

class AddPlayerFields extends ConsumerStatefulWidget {
  const AddPlayerFields({Key? key}) : super(key: key);

  @override
  _AddPlayerFieldsState createState() => _AddPlayerFieldsState();
}

class _AddPlayerFieldsState extends ConsumerState<AddPlayerFields>
    with ValidationMixin {
  final formKey = GlobalKey<FormState>();
  String email = '';
  String userName = '';
  String firstName = '';
  String lastName = '';
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
              buildFirstName(),
              buildLastName(),
              buildNickname(),
              buildEmail(),
              buildSubmitButton(),
            ],
          )),
    );
  }

  Widget buildEmail() => Padding(
        padding: const EdgeInsets.only(
          top: 10,
        ),
        child: TextFormField(
          decoration: const InputDecoration(
            labelText: 'Email',
            prefixIcon: Icon(Icons.mail, color: ColorConstants.formColor),
          ),
          keyboardType: TextInputType.emailAddress,
          validator: (value) => validateEmail(value!),
          onSaved: (value) => setState(() => email = value!),
        ),
      );

  Widget buildNickname() => Padding(
        padding: const EdgeInsets.only(top: 10),
        child: TextFormField(
          decoration: const InputDecoration(
            labelText: 'Nickname',
            prefixIcon: Icon(Icons.person, color: ColorConstants.formColor),
          ),
          keyboardType: TextInputType.text,
          validator: (value) => validateNickname(value!),
          onSaved: (value) => setState(() => userName = value!),
        ),
      );

  Widget buildFirstName() => Padding(
        padding: const EdgeInsets.only(top: 10),
        child: TextFormField(
          decoration: const InputDecoration(
            labelText: 'First name',
            prefixIcon: Icon(Icons.person, color: ColorConstants.formColor),
          ),
          keyboardType: TextInputType.text,
          validator: (value) => validateFirstName(value!),
          onSaved: (value) => setState(() => firstName = value!),
        ),
      );

  Widget buildLastName() => Padding(
        padding: const EdgeInsets.only(top: 10),
        child: TextFormField(
          decoration: const InputDecoration(
            labelText: 'Last name',
            prefixIcon: Icon(Icons.person, color: ColorConstants.formColor),
          ),
          keyboardType: TextInputType.text,
          validator: (value) => validateLastName(value!),
          onSaved: (value) => setState(() => lastName = value!),
        ),
      );

  Widget buildSubmitButton() => Padding(
        padding: const EdgeInsets.symmetric(vertical: 15),
        child: ElevatedButton(
          onPressed: () {
            final isValid = formKey.currentState!.validate();
            if (isValid) {
              formKey.currentState!.save();

              ref.read(playersProvider.notifier).createPlayer(PlayerModel(
                    firstName: firstName,
                    lastName: lastName,
                    nickname: userName,
                    email: email,
                  ));
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
