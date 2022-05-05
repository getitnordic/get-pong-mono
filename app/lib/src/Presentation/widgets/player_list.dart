// // ignore_for_file: prefer_const_constructors
// import 'package:get_pong/src/Presentation/widgets/widgets.dart';

// import '../../../config/route/route.dart' as route;

// import 'package:flutter/material.dart';

// import '../providers/my_providers.dart';

// class PlayerListAvatar extends StatelessWidget {
// // const PlayerList({Key? key, required this.title, required this.onTap})



//   const PlayerListAvatar({Key? key, required this.title, required this.ranking, required this.onTap})
//       : super(key: key);
      
//   final String ranking;
//   final String title;
//   final VoidCallback onTap;
//   // final VoidCallback onTap;

//   @override
//   Widget build(BuildContext context) {
//      List<Player> players = ref.watch(playerProvider);
//     return ListTile(
//       //checkbox in här

//       onTap: () => Navigator.pushNamed(context, route.profilePage),
//       leading: CircleAvatar(
//         radius: 20.0,
//         backgroundImage: AssetImage('assets/images/monkey.jpg'),
//       ),

//       title: Container(
//         child: Row(
//           children: [
//             Padding(
//               padding: const EdgeInsets.only(right: 75.0),
//               child: Text(
//                 title,
//                 style: TextStyle(
//                   fontSize: 15,
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(top: 1),
//               child: Text(
//                 ranking,
//                 style: TextStyle(
//                   fontSize: 15,
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
