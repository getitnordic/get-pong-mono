import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../constants/color_constants.dart';
import '../../../protos/base.pb.dart';
import '../../../utils/mixins/validation_mixin.dart';
import '../providers/players_providers.dart';

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
  String fullName = '';

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
              buildFullName(),
              const SizedBox(
                height: 5,
              ),
              buildNickname(),
              //buildEmail(),
              buildSubmitButton(),
            ],
          )),
    );
  }

  Widget buildEmail() => SizedBox(
        height: 90,
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

  Widget buildNickname() => SizedBox(
        height: 60,
        child: TextFormField(
          decoration: const InputDecoration(
            labelText: 'Nickname',
            prefixIcon: Icon(Icons.person, color: ColorConstants.formColor),
          ),
          keyboardType: TextInputType.text,
          onSaved: (value) => setState(() => userName = value!),
        ),
      );

  Widget buildFullName() => Padding(
        padding: const EdgeInsets.only(top: 10),
        child: SizedBox(
          height: 60,
          child: TextFormField(
            decoration: const InputDecoration(
              labelText: 'Name',
              prefixIcon: Icon(Icons.person, color: ColorConstants.formColor),
            ),
            keyboardType: TextInputType.text,
            onSaved: (value) => setState(() => fullName = value!),
          ),
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
                    fullName: fullName,
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
            minimumSize: MaterialStateProperty.all<Size>(const Size(300, 40)),
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
