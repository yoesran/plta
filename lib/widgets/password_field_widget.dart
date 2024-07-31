import 'package:flutter/material.dart';

class PasswordFieldWidget extends StatefulWidget {
  const PasswordFieldWidget({super.key, required this.onSaved, required this.borderRadius});

  final Function onSaved;
  final BorderRadius borderRadius;

  @override
  State<PasswordFieldWidget> createState() => _PasswordFieldWidgetState();
}

class _PasswordFieldWidgetState extends State<PasswordFieldWidget> {
  var _isVisible = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.black,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.lock_open),
        prefixIconColor: Colors.black,
        suffixIcon: IconButton(
          icon: Icon(
            _isVisible ? Icons.visibility_off_outlined : Icons.visibility_outlined,
            color: Colors.grey,
          ),
          onPressed: () {
            setState(() {
              _isVisible = !_isVisible;
            });
          },
        ),
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
      obscureText: _isVisible,
      obscuringCharacter: "*",
    );
  }
}
