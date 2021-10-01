import 'package:flutter/material.dart';
import 'package:github_followers/resources/colors/app_colors.dart';

class AppTextFormField extends StatefulWidget {
  final String label;
  final String? keyTag;
  final TextEditingController controller;
  final TextInputType? textInputType;
  final functionValidator;
  final onChange;
  final AutovalidateMode? autoValidateMode;
  final onFieldSubmitted;
  final String? errorText;
  final Color? errorColor;
  final FocusNode? focusNodeOf;
  final FocusNode? focusNodeFor;

  const AppTextFormField({
    Key? key,
    this.keyTag,
    required this.label,
    required this.controller,
    this.textInputType,
    this.functionValidator,
    this.onChange,
    this.autoValidateMode,
    this.onFieldSubmitted,
    this.errorText,
    this.errorColor,
    this.focusNodeFor,
    this.focusNodeOf,
  }) : super(key: key);

  @override
  _AppTextFormFieldState createState() => _AppTextFormFieldState();
}

class _AppTextFormFieldState extends State<AppTextFormField> {
  bool? _labelError;

  @protected
  @mustCallSuper
  void initState() {
    _labelError = false;
    super.initState();
  }

  TextStyle _returnTextStyle(BuildContext context) {
    return TextStyle(
      color: ((widget.errorColor != null) ? widget.errorColor : _labelError == true ? AppColors.of(context).inputError : AppColors.of(context).inputColor),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: widget.focusNodeOf,
      key: Key(widget.keyTag ?? ""),
      cursorColor: AppColors.of(context).inputColor,
      autovalidateMode: widget.autoValidateMode,
      controller: widget.controller,
      keyboardType: widget.textInputType,
      onChanged: (value) {
        return widget.onChange(value);
      },
      validator: (String? value) {
        return widget.functionValidator;
      },
      style: TextStyle(fontSize: 16, color: AppColors.of(context).appText),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(left: 12),
        errorText: widget.errorText,
        labelText: widget.label,
        labelStyle: _returnTextStyle(context),
        focusColor: AppColors.of(context).appText,
        errorStyle: TextStyle(
          color: widget.errorColor ?? AppColors.of(context).inputError,
          fontSize: 12,
        ),
        errorBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: widget.errorColor ?? AppColors.of(context).inputError,
            width: 2.0,
          ),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
              color: AppColors.of(context).inputColor,
              width: 2.0
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: AppColors.of(context).inputColor, width: 2.0),
        ),
      ),
      onFieldSubmitted: widget.onFieldSubmitted != null ? widget.onFieldSubmitted : (value) {
        FocusScope.of(context).requestFocus(widget.focusNodeFor);
      },
    );
  }
}
