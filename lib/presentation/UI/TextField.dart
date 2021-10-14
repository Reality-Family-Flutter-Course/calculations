import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

abstract class AbstractTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;

  AbstractTextField({
    required this.controller,
    String? hintText,
  }) : this.hintText = hintText ?? "";
}

class AndroidTextField extends AbstractTextField {
  AndroidTextField({
    required TextEditingController controller,
    String? hintText,
  }) : super(
          controller: controller,
          hintText: hintText,
        );

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: true,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        hintText: hintText,
      ),
      keyboardType: TextInputType.numberWithOptions(
        signed: false,
        decimal: true,
      ),
      controller: controller,
    );
  }
}

class IOSTextField extends AbstractTextField {
  IOSTextField({
    required TextEditingController controller,
    String? hintText,
  }) : super(
          controller: controller,
          hintText: hintText,
        );

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: true,
      textAlign: TextAlign.center,
      decoration: InputDecoration(
        hintText: hintText,
      ),
      keyboardType: TextInputType.numberWithOptions(
        signed: false,
        decimal: true,
      ),
      controller: controller,
    );
  }
}
