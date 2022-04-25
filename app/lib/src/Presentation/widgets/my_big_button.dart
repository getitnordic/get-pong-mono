import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyBigButton extends StatelessWidget {
  final String buttonText;
  const MyBigButton({Key? key, required this.buttonText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        onTap: () => print('bigButtonTap'),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.deepOrange),
            borderRadius: BorderRadius.circular(10),
          ),
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          child: Center(
            child: Text(
              buttonText,
              style: GoogleFonts.goldman(fontSize: 40, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
