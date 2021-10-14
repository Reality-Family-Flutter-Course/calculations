import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class Button extends StatelessWidget {
  final String title;
  final Function() callBack;

  Button({
    required this.title,
    required this.callBack,
  });
}

class AndroidButton extends Button {
  AndroidButton({
    required String title,
    required Function() callBack,
  }) : super(
          title: title,
          callBack: callBack,
        );

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: super.callBack,
      child: Text(
        super.title,
      ),
    );
  }
}

class IOSButton extends Button {
  IOSButton({
    required String title,
    required Function() callBack,
  }) : super(
          title: title,
          callBack: callBack,
        );

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 15,
        left: 15,
        right: 15,
        bottom: 20,
      ),
      child: CupertinoButton(
        color: Theme.of(context).colorScheme.secondary,
        child: Text(
          super.title,
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        onPressed: super.callBack,
      ),
    );
  }
}
