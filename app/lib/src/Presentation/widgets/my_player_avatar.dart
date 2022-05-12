// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MyPlayerAvatar extends StatelessWidget {
  const MyPlayerAvatar(
      {Key? key,
      required this.title,
      required this.onTap,
      required this.withCheckbox})
      : super(key: key);
  final VoidCallback onTap;
  final String title;
  final bool withCheckbox;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 8.0,
      ),
      child: GestureDetector(
        onTap: onTap,
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
            trailing: withCheckbox
                ? Checkbox(
                    checkColor: Colors.white,
                    value: false,
                    onChanged: (bool? value) {})
                : null,
          ),
        ),
      ),
    );
  }
}
