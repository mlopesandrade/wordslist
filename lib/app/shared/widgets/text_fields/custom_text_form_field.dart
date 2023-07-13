import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextFormField extends StatelessWidget {
  final String? initialValue;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? labelText;
  final String? hintText;
  final TextInputType? keyboardType;
  final Function(String?)? onSaved;
  final Function(String?)? onChanged;
  final String? Function(String?)? validator;
  final void Function()? onTap;
  final void Function()? onEditingComplete;
  final bool? filled;
  final bool? autofocus;
  final bool? autovalidate;
  final bool? obscureText;
  final bool? readOnly;
  final bool? enabled;
  final Color? fillColor;
  final Color? iconColor;
  final TextInputAction? textInputAction;
  final int? maxLines;
  final FocusNode? focusNode;
  final List<TextInputFormatter>? inputFormatters;
  final TextEditingController? controller;
  final TextAlign? textAlign;
  final TextCapitalization? textCapitalization;

  const CustomTextFormField(
      {
        super.key,
        this.prefixIcon,
        this.labelText,
        this.keyboardType,
        this.onSaved,
        this.autofocus,
        this.initialValue,
        this.enabled,
        this.validator,
        this.filled,
        this.autovalidate,
        this.textInputAction,
        this.maxLines,
        this.onEditingComplete,
        this.focusNode,
        this.hintText,
        this.inputFormatters,
        this.controller,
        this.textAlign,
        this.textCapitalization,
        this.onChanged,
        this.obscureText,
        this.readOnly,
        this.onTap,
        this.suffixIcon,
        this.fillColor = Colors.white,
        this.iconColor
      });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: onTap,
      onSaved: onSaved,
      autofocus: autofocus ?? false,
      autocorrect: false,
      decoration: InputDecoration(
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          labelText: labelText,
          labelStyle: const TextStyle(color: Colors.black26),
          hintText: hintText,
          hintStyle:
          const TextStyle(color: Colors.black26,fontSize: 12),
          fillColor: fillColor,
          filled: filled ?? true,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.grey.shade300)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: Colors.grey.shade300)),
          errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Colors.red)),
          focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: const BorderSide(color: Colors.red)),
          errorStyle: const TextStyle(color: Colors.red)
      ),
      style: const TextStyle(
          color: Colors.black54, fontSize: 14, fontWeight: FontWeight.w600),
      keyboardType: keyboardType,
      validator: validator,
      initialValue: initialValue,
      enabled: enabled ?? true,
      textInputAction: textInputAction ?? TextInputAction.done,
      maxLines: maxLines ?? 1,
      onEditingComplete: onEditingComplete,
      focusNode: focusNode,
      inputFormatters: inputFormatters ?? [],
      controller: controller,
      onChanged: onChanged,
      textAlign: textAlign ?? TextAlign.start,
      textCapitalization: textCapitalization ?? TextCapitalization.none,
      obscureText: obscureText ?? false,
      readOnly: readOnly ?? false,
    );
  }
}
