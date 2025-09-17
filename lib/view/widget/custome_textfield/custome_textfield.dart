import 'package:flutter/material.dart';
import 'package:moviers/utils/app_colors.dart';

class CustomeTextfield extends StatefulWidget {
  final TextEditingController? textfielController;
  final String hintText;
  final int? maxLines;
  final IconData prefixicon;
  final void Function(String)? onChanged;

  const CustomeTextfield({
    super.key,
    required this.hintText,
    required this.textfielController,
    this.maxLines = 1,
    required this.prefixicon,
    required this.onChanged
  });

  @override
  State<CustomeTextfield> createState() => _CustomeTextfieldState();
}

class _CustomeTextfieldState extends State<CustomeTextfield> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: widget.onChanged,
      style: TextStyle(color: AppColors.neutral60),
      controller: widget.textfielController,
      maxLines: widget.maxLines,
      decoration: InputDecoration(
        hintText: widget.hintText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(4)),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: AppColors.primaryFull),
        ),
        //ICON
        prefixIcon: Icon(widget.prefixicon),
        prefixIconColor: WidgetStateColor.resolveWith((states) {
          if (states.contains(WidgetState.focused)) {
            return AppColors.primaryFull; // focus color
          }
          return AppColors.neutral60; // unfocused color
        }),
        iconColor: AppColors.neutral60,
        isDense: true,
        contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 16),
      ),
    );
  }
}
