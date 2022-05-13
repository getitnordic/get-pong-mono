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
  }) : super(key: key);
  final VoidCallback onTap;
  final String title;
  final bool withCheckbox;
  final bool isSelected;
  final void Function(bool? value)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 8.0,
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // contentPadding: EdgeInsets.zero,
          // onTap: onTap,
          // leading: Padding(
          //   padding: const EdgeInsets.all(8.0),
          children: [
            Container(
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                    child: CircleAvatar(
                      radius: 20.0,
                      backgroundImage: AssetImage('assets/images/monkey.jpg'),
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
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: Text(
                'Rank:',
                style: TextStyle(color: Colors.white70),
              ),
            ),
            if (withCheckbox)
              Checkbox(
                checkColor: Colors.white,
                value: isSelected,
                onChanged: onChanged,
              ),
          ],
        ),
      ),
    );
  }
}
