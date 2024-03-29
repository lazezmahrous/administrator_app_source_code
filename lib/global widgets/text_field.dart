// ignore_for_file: public_member_api_docs, sort_constructors_first, file_names, must_be_immutable, unused_local_variable
import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  TextFieldWidget({
    super.key,
    required this.lableName,
    required this.password,
    required this.textinput,
    required this.controller,
    required this.maxLength,
    this.onChanged,
    this.validator,
    this.onTap,
    required this.ispassword,
    this.prefixIcon,
  });
  final String lableName;
  final bool password;
  final bool ispassword;
  final int maxLength;
  final TextInputType textinput;
  Function(String)? onChanged;
  String? Function(String?)? validator;
  String? Function(String?)? onTap;
  Widget? prefixIcon;

  final TextEditingController? controller;

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  bool passwordVisible = true;

  Future<String?>? validate() async {
    if (widget.validator != null) {
      return widget.validator!(widget.controller?.text);
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: TextFormField(
        validator: widget.validator,
        maxLength: widget.maxLength,
        controller: widget.controller,
        onChanged: widget.onChanged,
        onSaved: widget.onTap,
        obscureText: widget.ispassword ? passwordVisible : false,
        textDirection: TextDirection.ltr,
        style: const TextStyle(
            // color: Colors.black,
            ),
        textAlign: TextAlign.end,
        keyboardType: widget.textinput,
        autofocus: false,
        decoration: InputDecoration(
          label: Text(widget.lableName),
          hintText: widget.lableName,
          hintTextDirection: TextDirection.ltr,
          border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10))),
          suffixIcon: widget.ispassword
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      passwordVisible = !passwordVisible;
                    });
                  },
                  icon: Icon(
                    passwordVisible ? Icons.visibility_off : Icons.visibility,
                  ),
                )
              : widget.prefixIcon ??
                  const SizedBox(
                    width: 0,
                    height: 0,
                  ),
        ),
      ),
    );
  }
}
