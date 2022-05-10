import 'package:flutter/material.dart';

class MyPlayerAvatar extends StatelessWidget {
  const MyPlayerAvatar({Key? key, required this.title, required this.onTap})
      : super(key: key);
  final VoidCallback onTap;
  final String title;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 8.0,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.black12,
        ),
        child: ListTile(
          contentPadding: EdgeInsets.zero,
          onTap: onTap,
          leading: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: CircleAvatar(
              radius: 20.0,
              backgroundImage: AssetImage('assets/images/monkey.jpg'),
            ),
          ),
          title: Text(
            title,
            style: TextStyle(
              fontSize: 15,
              color: Colors.white,
            ),
          ),
          trailing: Checkbox(
              checkColor: Colors.white,
              value: false,
              onChanged: (bool? value) {}),
        ),
      ),
    );
  }
}
