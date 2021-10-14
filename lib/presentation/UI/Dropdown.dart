import 'package:flutter/material.dart';

abstract class Dropdown<T> extends StatefulWidget {
  final List<DropdownMenuItem<T>> items;
  T? value;
  final Function(T? value) callBack;

  Dropdown({
    required this.items,
    required this.callBack,
    T? value,
  }) : this.value = value ?? null;
}

class AndroidDropdown<T> extends Dropdown<T> {
  AndroidDropdown({
    required List<DropdownMenuItem<T>> items,
    required Function(T? value) callBack,
  }) : super(
          items: items,
          callBack: callBack,
        );

  @override
  _AndroidDropdownState createState() => _AndroidDropdownState();
}

class _AndroidDropdownState extends State<AndroidDropdown> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class IOSDropdown<T> extends Dropdown<T> {
  IOSDropdown({
    required List<DropdownMenuItem<T>> items,
    required Function(T? value) callBack,
  }) : super(
          items: items,
          callBack: callBack,
        );

  @override
  _IOSDropdownState<T> createState() => _IOSDropdownState<T>(parent: this);
}

class _IOSDropdownState<T> extends State<Dropdown> {
  Dropdown<T> parent;

  _IOSDropdownState({required this.parent});

  @override
  Widget build(BuildContext context) {
    return DropdownButton<T>(
      value: parent.value,
      items: parent.items,
      onChanged: (T? newValue) {
        setState(() {
          parent.value = newValue;
          parent.callBack(newValue);
        });
      },
    );
  }
}
