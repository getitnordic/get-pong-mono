import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';
import 'package:uuid/uuid.dart';
import '../../../config/route/route.dart' as route;
import '../providers/my_providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SaveButton extends StatefulWidget {
  final String buttonText;
  // final String value1;
  const SaveButton({
    Key? key,
    required this.buttonText,
  }) : super(key: key);

  @override
  State<SaveButton> createState() => _SaveButtonState();
}

class _SaveButtonState extends State<SaveButton> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GestureDetector(
        onTap: () {},
        // ref.read(playerProvider.notifier).addPlayer(Player(
        //       name: "jesper", email: "", id: Uuid().v4(), score: widget.value1,));}
        // onTap: () => Navigator.pushNamed(context, route.resultPage),
        child: GlassmorphicContainer(
          width: 250,
          height: 30,
          borderRadius: 20,
          blur: 20,
          alignment: Alignment.bottomCenter,
          border: 0,
          linearGradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFFffffff).withOpacity(0.1),
                Color(0xFFFFFFFF).withOpacity(0.1),
              ],
              stops: [
                0.1,
                1,
              ]),
          borderGradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFffffff).withOpacity(0.5),
              Color((0xFFFFFFFF)).withOpacity(0.5),
            ],
          ),
          // ignore: prefer_const_constructors
          child: Center(
            child: Text(
              widget.buttonText,
              // ignore: prefer_const_constructors
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}


// Container(
//           // color: Colors.blue,
//           width: 300,
//           height: 30,
//           decoration: BoxDecoration(
//             border: Border.all(color: Theme.of(context).primaryColor),
//             borderRadius: BorderRadius.circular(10),
//           ),
//           child: Center(
//             child: Text(
//               widget.buttonText,
//               style: Theme.of(context).textTheme.bodyText2,
//             ),
//           ),
//         ),