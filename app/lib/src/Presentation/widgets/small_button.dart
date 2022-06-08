// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';

class SmallButton extends StatelessWidget {
  const SmallButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(width: 15),
        SizedBox(width: 10),
        // OutlineButton(
        //   shape: StadiumBorder(),
        //   textColor: Color.fromARGB(255, 248, 114, 39),
        //   child: Text('Create game'),
        //   borderSide: BorderSide(
        //       color: Color.fromARGB(255, 248, 114, 39),
        //       style: BorderStyle.solid,
        //       width: 1),
        //   onPressed: () => Navigator.pushNamed(context, route.homePage),
        // ),
      ],
    );
  }
}

// ignore_for_file: prefer_const_constructors, deprecated_member_use

// import 'package:flutter/material.dart';
// import '../route/route.dart' as route;

// class SmallButton extends StatelessWidget {
//   const SmallButton({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       child: Stack(
//         fit: StackFit.expand,

//         children: <Widget>[
//           Align(
//             alignment: Alignment.centerLeft,
//              child: OutlineButton(
//               shape: StadiumBorder(),
//               textColor: Color.fromARGB(255, 248, 114, 39),
//               child: Text('Add player'),
//               borderSide: BorderSide(
//                   color: Color.fromARGB(255, 248, 114, 39),
//                   style: BorderStyle.solid,
//                   width: 1),
//               onPressed: () => Navigator.pushNamed(context, route.addPlayer),
//             ),
//           ),
//           Align(
//             alignment: Alignment.center,
//              child: OutlineButton(
//               shape: StadiumBorder(),
//               textColor: Color.fromARGB(255, 248, 114, 39),
//               child: Text('Create game'),
//               borderSide: BorderSide(
//                   color: Color.fromARGB(255, 248, 114, 39),
//                   style: BorderStyle.solid,
//                   width: 1),
//               onPressed: () => Navigator.pushNamed(context, route.homePage),
//              ),
//           ),
//         ],
//       ),
//     );
//   }
// }
