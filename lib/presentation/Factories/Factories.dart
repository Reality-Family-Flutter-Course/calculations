import 'package:calculations/presentation/UI/Button.dart';
import 'package:calculations/presentation/UI/Dropdown.dart';
import 'package:calculations/presentation/UI/TextField.dart';
import 'package:flutter/material.dart';

abstract class UIFactory {
  Button getButton({
    required String title,
    required Function() callBack,
  });

  Dropdown<T> getDropdown<T>({
    required List<DropdownMenuItem<T>> items,
    required Function(T? value) callBack,
  });

  AbstractTextField getTextField({
    required TextEditingController controller,
    String? hintText,
  });
}

class AndroidUI implements UIFactory {
  @override
  Button getButton({
    required String title,
    required Function() callBack,
  }) {
    return AndroidButton(
      title: title,
      callBack: callBack,
    );
  }

  @override
  Dropdown<T> getDropdown<T>({
    required List<DropdownMenuItem<T>> items,
    required Function(T? value) callBack,
  }) {
    return AndroidDropdown(
      items: items,
      callBack: callBack,
    );
  }

  @override
  AbstractTextField getTextField({
    required TextEditingController controller,
    String? hintText,
  }) {
    return AndroidTextField(
      controller: controller,
      hintText: hintText,
    );
  }
}

class IOSUI implements UIFactory {
  @override
  Button getButton({
    required String title,
    required Function() callBack,
  }) {
    return IOSButton(
      title: title,
      callBack: callBack,
    );
  }

  @override
  Dropdown<T> getDropdown<T>({
    required List<DropdownMenuItem<T>> items,
    required Function(T? value) callBack,
  }) {
    return IOSDropdown(
      items: items,
      callBack: callBack,
    );
  }

  @override
  AbstractTextField getTextField({
    required TextEditingController controller,
    String? hintText,
  }) {
    return IOSTextField(
      controller: controller,
      hintText: hintText,
    );
  }
}
