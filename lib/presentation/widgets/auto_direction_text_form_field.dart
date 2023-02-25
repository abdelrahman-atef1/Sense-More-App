import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart' as intl;
import 'package:sense_more/core/shared/color_manager.dart';

class AutoDirectionFormField extends StatefulWidget {
  const AutoDirectionFormField(
      {this.enabled,
      this.onChanged,
      this.fontSize,
      this.textAlignment = TextAlign.start,
      this.obscureText = false,
      this.onSaved,
      this.controller,
      this.validator,
      this.decoration,
      this.keyboardType,
      this.autovalidateMode = AutovalidateMode.onUserInteraction,
      Key? key})
      : super(key: key);
  final bool  obscureText;
  final TextEditingController? controller;
  final void Function(String?)? onSaved;
  final String? Function(String?)? validator;
  final bool? enabled;
  final void Function(String)? onChanged;
  final double? fontSize;
  final TextAlign textAlignment;
  final InputDecoration? decoration;
  final AutovalidateMode? autovalidateMode;
  final TextInputType? keyboardType;

  @override
  State<AutoDirectionFormField> createState() => _AutoDirectionFormFieldState();
}

class _AutoDirectionFormFieldState extends State<AutoDirectionFormField> {
  TextDirection _direction = TextDirection.ltr;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        cursorColor: ColorManager.primary,
        autovalidateMode: widget.autovalidateMode,
        obscureText: widget.obscureText,
        keyboardType: widget.keyboardType,
        textAlign: widget.textAlignment,
        textDirection: _direction,
        onChanged: (v){
            if((_direction == TextDirection.rtl) != isRTL(v)){
                setState((){
                _direction = isRTL(v)? TextDirection.rtl:TextDirection.ltr;
                });
            }
            widget.onChanged?.call(v);
          },
        enabled: widget.enabled??true,
        decoration: widget.decoration,
        controller:widget.controller,
        onSaved: widget.onSaved,
        validator: widget.validator,
    );
  }
}

///Check if entered text is RTL or LTR
//in state
  bool isRTL(String text) {
    return intl.Bidi.detectRtlDirectionality(text==''?'ض':text);
  }