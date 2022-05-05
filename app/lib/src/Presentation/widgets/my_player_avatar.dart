import 'package:flutter/material.dart';

class MyPlayerAvatar extends StatelessWidget {
  const MyPlayerAvatar(
      {Key? key,
      required this.title,
      required this.onTap,
      required this.ranking})
      : super(key: key);

  final VoidCallback onTap;
  final String title;
  final String ranking;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: CircleAvatar(
        radius: 20.0,
        backgroundImage: AssetImage('assets/images/monkey.jpg'),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 15,
          color: Colors.white,
        ),
      ),
      trailing: IconButton(
        onPressed: () {},
        icon: Icon(
          Icons.list,
          color: Colors.deepOrange,
        ),
      ),
    );
  }
}
