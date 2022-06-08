// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:glassmorphism/glassmorphism.dart';

class MyPlayerAvatar extends StatelessWidget {
  const MyPlayerAvatar({
    Key? key,
    required this.title,
    required this.onTap,
    required this.withCheckbox,
    this.isSelected = false,
    this.onChanged,
    required this.imageUrl,
  }) : super(key: key);
  final VoidCallback onTap;
  final String title;
  final bool withCheckbox;
  final bool isSelected;
  final String imageUrl;
  final void Function(bool? value)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 6,
      ),
      child: GlassmorphicContainer(
        width: double.infinity,
        height: 50,
        borderRadius: 15,
        blur: 20,
        alignment: Alignment.center,
        border: 0.5,
        linearGradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFFffffff).withOpacity(0.1),
              Color(0xFFFFFFFF).withOpacity(0.05),
            ],
            stops: const [
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                  child: CircleAvatar(
                    radius: 20.0,
                    backgroundImage: NetworkImage(imageUrl),
                  ),
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 17,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
            if (withCheckbox)
              Checkbox(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
                checkColor: Colors.white70,
                activeColor: Color.fromARGB(255, 248, 114, 39),
                value: isSelected,
                onChanged: onChanged,
              ),
          ],
        ),
      ),
    );
  }
}
