import 'package:flutter/material.dart';
import '../../../config/route/route.dart' as route;

class MyBigButton extends StatelessWidget {
  final String buttonText;
  const MyBigButton({Key? key, required this.buttonText}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, route.resultPage),
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Theme.of(context).primaryColor),
            borderRadius: BorderRadius.circular(10),
          ),
          width: double.infinity,
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 5),
          child: Center(
            child: Text(
              buttonText,
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ),
        ),
      ),
    );
  }
}
