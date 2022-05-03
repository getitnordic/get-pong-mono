import 'package:flutter/material.dart';
import 'package:get_pong/src/presentation/widgets/widgets.dart';

class AddPlayer extends StatefulWidget {
  const AddPlayer({Key? key}) : super(key: key);

  @override
  State<AddPlayer> createState() => _AddPlayerState();
}

class _AddPlayerState extends State<AddPlayer> {
  final _formKey = GlobalKey<FormState>();
  // final emailController = TextEditingController();

  /// som useeffect ////
  @override
  void initState() {
    super.initState();
    print('init olof');
    // emailController.addListener(() => setState(() {}));
  }
//// lägg till dispose

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print('dispose olof');
    // emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('rebuild');
    return MyKeyboardUnfocus(
      child: Scaffold(
        appBar: AppBar(title: Text('GetPong')),
        body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: <Widget>[
                Text('Add player'),
                AddPlayerFields(),
              ],
            )),
      ),
    );
  }
}
