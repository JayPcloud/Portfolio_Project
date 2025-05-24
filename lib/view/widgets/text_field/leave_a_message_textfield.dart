import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../common/constants/sizes.dart';
import '../../../utils/utils_func.dart';

class ContactTextField extends StatelessWidget {
  const ContactTextField({super.key, this.hintText, this.controller, this.maxLines, this.keyboardType, this.validator});

  final String? hintText;
  final TextEditingController? controller;
  final int? maxLines;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: context.textTheme.bodyLarge,
      maxLines: maxLines,
      cursorColor: context.theme.colorScheme.outline,
      keyboardType: keyboardType,
      validator: validator??(text) => UtilsFunc.textFieldValidator(text??'', true),
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: context.textTheme.bodySmall,
        contentPadding: EdgeInsets.all(Sizes.smPadding),
        focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: context.theme.colorScheme.outline, width: Sizes.underlineBorderWidth)
        ),
        enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: context.theme.colorScheme.outlineVariant, width: Sizes.underlineBorderWidth)
        ),
        errorBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: context.theme.colorScheme.error, width: Sizes.underlineBorderWidth)
        ),
      ),
    );
  }

}
