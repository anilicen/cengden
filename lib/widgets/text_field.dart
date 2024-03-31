import 'package:flutter/material.dart';

class CengdenTextField extends StatelessWidget {
  const CengdenTextField({
    super.key,
    required this.size,
    required this.title,
    required this.hintText,
    required this.isObscure,
    required this.onChanged,
    this.color,
    this.text,
  });

  final Size size;
  final String title;
  final String hintText;
  final bool isObscure;
  final void Function(String text) onChanged;
  final Color? color;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Container(
            child: Text(
              title,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          SizedBox(height: 6),
          TextField(
            controller: TextEditingController()..text = text ?? "",
            style: TextStyle(height: 1),
            obscureText: isObscure,
            decoration: InputDecoration(
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: color ?? Colors.black.withOpacity(0.2)),
                borderRadius: BorderRadius.circular(10),
              ),
              filled: false,
              hintStyle: TextStyle(color: Colors.black.withOpacity(0.2)),
              hintText: hintText,
            ),
            onChanged: (value) {
              onChanged(value);
            },
          ),
        ],
      ),
    );
  }
}
