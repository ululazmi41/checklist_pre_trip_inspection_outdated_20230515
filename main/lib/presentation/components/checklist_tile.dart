import 'package:flutter/material.dart';

class ChecklistTile extends StatelessWidget {
  const ChecklistTile({
    Key? key,
    required this.icon,
    required this.title,
    required this.trailing,
  }) : super(key: key);

  final Icon icon;
  final Text title;
  final Widget trailing;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            margin: const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 12.0,
            ),
            padding: const EdgeInsets.symmetric(
              vertical: 8.0,
              horizontal: 12.0,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(4.0),
            ),
            height: 60.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    icon,
                    const SizedBox(width: 20.0),
                    title,
                  ],
                ),
                trailing,
              ],
            ),
          ),
        ),
      ],
    );
  }
}
