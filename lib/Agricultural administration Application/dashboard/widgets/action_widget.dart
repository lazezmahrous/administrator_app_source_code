// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class ActionWidget extends StatelessWidget {
  ActionWidget({super.key, required this.actionName, required this.onTap});
  final String actionName;
  VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Card(
        child: Center(
          child: Text(
            actionName,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
