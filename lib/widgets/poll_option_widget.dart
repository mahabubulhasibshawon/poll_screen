import 'package:flutter/material.dart';

class PollOptionWidget extends StatelessWidget {
  final String text;
  final int votes;
  final bool isSelected;
  final VoidCallback onTap;

  PollOptionWidget({
    required this.text,
    required this.votes,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Radio<bool>(
        value: true,
        groupValue: isSelected,
        onChanged: (_) => onTap(),
      ),
      title: Text(text, style: TextStyle(fontSize: 16)),
      trailing: Text(
        votes.toString(),
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
    );
  }
}
