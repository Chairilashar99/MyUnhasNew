import 'dart:async';

import 'package:flutter/material.dart';

class InputDataField extends StatefulWidget {
  final TextEditingController controller;
  final String hintText;
  final String? initialValue;
  final FutureOr<void> Function(DateTime date)? action;
  const InputDataField(
      {super.key,
      required this.action,
      this.initialValue,
      required this.controller,
      required this.hintText});

  @override
  State<InputDataField> createState() => _InputDataFieldState();
}

class _InputDataFieldState extends State<InputDataField> {
  @override
  void initState() {
    super.initState();
    if (widget.initialValue != null) {
      widget.controller.text = widget.initialValue!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      readOnly: true,
      onTap: () {},
      keyboardType: TextInputType.text,
      decoration: InputDecoration(
        hintText: widget.hintText,
        filled: true,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
    );
  }
}
