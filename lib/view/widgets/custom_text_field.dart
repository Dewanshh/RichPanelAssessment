import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:richpanel/utils/themes.dart';

class CustomInputTextField extends StatefulWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final FormFieldValidator<String>? validator;
  final bool password;

  CustomInputTextField(this.textEditingController, this.hintText,
      {super.key, this.validator, this.password = false});

  @override
  State<CustomInputTextField> createState() => _CustomInputTextFieldState();
}

class _CustomInputTextFieldState extends State<CustomInputTextField> {
  bool passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [RichPanelShadows.level1]),
      child: TextFormField(
        controller: widget.textEditingController,
        obscureText: widget.password
            ? passwordVisible
                ? false
                : true
            : false,
        validator: widget.validator,
        style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500),
        decoration: InputDecoration(
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(5.0),
          ),
          suffixIcon: widget.password
              ? GestureDetector(
                  child: Icon(
                    passwordVisible ? Icons.visibility : Icons.visibility_off,
                    size: 20,
                    color: RichPanelTheme.primaryColor,
                  ),
                  onTap: () {
                    setState(() {
                      passwordVisible = !passwordVisible;
                    });
                  })
              : null,
          hintText: widget.hintText,
          hintStyle: RichPanelTextStyle.bodyMedium,
          filled: true,
        ),
      ),
    );
  }
}

class CustomCardInputTextField extends StatefulWidget {
  final TextEditingController textEditingController;
  final String hintText;
  final FormFieldValidator<String>? validator;
  final bool password;
  final bool prefixIcon;
  final IconData prefixIco;

  CustomCardInputTextField(this.textEditingController, this.hintText,
      {super.key,
      this.validator,
      this.password = false,
      this.prefixIcon = false,
      this.prefixIco = Icons.verified_user});

  @override
  State<CustomCardInputTextField> createState() =>
      _CustomCardInputTextFieldState();
}

class _CustomCardInputTextFieldState extends State<CustomCardInputTextField> {
  bool passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextFormField(
        controller: widget.textEditingController,
        obscureText: widget.password
            ? passwordVisible
                ? false
                : true
            : false,
        validator: widget.validator,
        style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500),
        decoration: InputDecoration(
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(5.0),
            ),
            suffixIcon: widget.password
                ? GestureDetector(
                    child: Icon(
                      passwordVisible ? Icons.visibility : Icons.visibility_off,
                      size: 20,
                      color: RichPanelTheme.primaryColor,
                    ),
                    onTap: () {
                      setState(() {
                        passwordVisible = !passwordVisible;
                      });
                    })
                : null,
            hintText: widget.hintText,
            hintStyle: RichPanelTextStyle.bodyMedium,
            filled: true,
            prefixIcon: widget.prefixIcon
                ? Icon(
                    widget.prefixIco,
                    color: Colors.grey.withOpacity(0.4),
                  )
                : null),
      ),
    );
  }
}
