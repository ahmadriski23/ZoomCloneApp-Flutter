import 'package:flutter/material.dart';
import 'package:zoom_clone_app/utils/colors.dart';

class HomeMeetingButton extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData icon;
  final String text;
  const HomeMeetingButton(
      {super.key,
      required this.onPressed,
      required this.icon,
      required this.text});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
                color: buttonColor,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    color: Colors.black.withOpacity(0.06),
                    offset: Offset(0, 4),
                  )
                ]),
            width: 60,
            height: 60,
            child: Icon(
              icon,
              color: Colors.white,
              size: 30,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            text,
            style: TextStyle(color: Colors.grey),
          )
        ],
      ),
    );
  }
}
