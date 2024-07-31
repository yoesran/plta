import 'package:flutter/material.dart';

class TextFieldWidget extends StatefulWidget {
  const TextFieldWidget({
    super.key,
    required this.keyboardType,
    required this.onSaved,
    required this.borderRadius,
    required this.suffixIcon,
  });

  final TextInputType keyboardType;
  final Function onSaved;
  final BorderRadius borderRadius;
  final IconData suffixIcon;

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.black,
      decoration: InputDecoration(
        prefixIcon: Icon(widget.suffixIcon),
        prefixIconColor: Colors.black,
        focusedBorder: OutlineInputBorder(
          borderRadius: widget.borderRadius,
          borderSide: const BorderSide(
            color: Colors.grey,
            width: 1,
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: widget.borderRadius,
          borderSide: const BorderSide(
            color: Colors.grey,
            width: 1,
          ),
        ),
        fillColor: Colors.white,
        filled: true,
      ),
      onSaved: (value) => widget.onSaved(value),
      keyboardType: widget.keyboardType,
    );
  }
}
