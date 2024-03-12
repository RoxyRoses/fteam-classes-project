import 'package:flutter/material.dart';
import 'package:fteam_classes_project/utils/text_mask.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class FormPagecontroller extends ChangeNotifier {
  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  var isLight = true;

  ThemeMode _themeMode = ThemeMode.system;
  ThemeMode get themeMode => _themeMode;
  

  final phoneMask = MaskFormatter(
    formatter: MaskTextInputFormatter(mask: "(##) #####-####"),
    hint: 'Telefone',
    textInputType: const TextInputType.numberWithOptions(),
  );

  void setTheme(bool isLight) {
    if (isLight) {
      isLight = false;

      _themeMode = ThemeMode.dark;
      notifyListeners();

    } else {
      isLight = true;

      _themeMode = ThemeMode.light;
      notifyListeners();

    }
  }

  String? validateName(String? value) {
    const pattern = r"^[A-Za-z ,.'-]+$";
    final regex = RegExp(pattern);

    if(value != null && value != '') {
      return value.isNotEmpty && !regex.hasMatch(value)
        ? 'Digite um Nome valido'
        : null;
    }
    return 'Digite um nome!';
  }

  String? validateEmail(String? value) {
    const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
    final regex = RegExp(pattern);

    return value!.isNotEmpty && !regex.hasMatch(value)
        ? 'Digite um E-mail valido'
        : null;
  }
}
