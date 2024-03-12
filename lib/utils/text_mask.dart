import 'package:flutter/widgets.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class MaskFormatter {
  final TextEditingController textController = TextEditingController();
  final MaskTextInputFormatter formatter;
  final FormFieldValidator<String>? validator;
  final String hint;
  final TextInputType textInputType;

  MaskFormatter(
      {required this.formatter,
      this.validator,
      required this.hint,
      required this.textInputType});
}
