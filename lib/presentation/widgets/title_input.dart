
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sense_more/core/shared/color_manager.dart';

class TitleInput extends StatelessWidget {
  const TitleInput({
    Key? key,
    required this.title,
    this.backGroundColor,
    this.titleBackGroundColor,
    this.titleStyle,
    this.trailing,
    this.initialValue,
    this.enabled =true,
    this.textAlign = TextAlign.start,
    this.titleTextAlign = TextAlign.center,
    this.onChanged,
    this.titleOnTap,
    this.validator,
    this.titleWidth,
    this.keyboardType,
    this.controller,
    this.focusNode,
    this.maxLength,
    this.maxLines = 1,
    this.minLines,
    this.hintText,
    this.hintStyle,
    this.textStyle,
    this.divider,
    this.decoration,
    this.titleDecoration,
    this.textDirection,
    this.contentPadding,
  }) : super(key: key);

final String title;
final Color? titleBackGroundColor,backGroundColor;
final String? initialValue;
final double? titleWidth;
final TextStyle? titleStyle;
final TextAlign textAlign,titleTextAlign;
final bool enabled;
final int? maxLength,maxLines,minLines;
final TextEditingController? controller;
final TextInputType? keyboardType;
final Widget? trailing;
final FocusNode? focusNode;
final void Function(String)? onChanged;
final void Function()? titleOnTap;
final String? Function(String?)? validator;
final String? hintText;
final TextStyle? hintStyle, textStyle;
final Widget? divider;
final BoxDecoration? decoration;
final BoxDecoration? titleDecoration;
final TextDirection? textDirection;
final EdgeInsetsGeometry? contentPadding;
  @override
  Widget build(BuildContext context) {
    return Container(
      height:maxLines==null || maxLines==1? 40.h:null,
      decoration: decoration ??
          BoxDecoration(
            color: backGroundColor??ColorManager.transparent,
            boxShadow: const [
              BoxShadow(
                  color: Color(0xFFC5CCC6),
                  blurRadius: 2.5,
                  offset: Offset(0, 0)),
            ],
            // border: Border.all(color: const Color(0xFFE9E9E9), width: 0.5),
            borderRadius: BorderRadius.circular(7.0),
          ),
      child: Row(
        children: [
          GestureDetector(
            onTap: titleOnTap,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(7),
                bottomRight: Radius.circular(7),
              ),
              child: Container(
                alignment: Alignment.center,
                width: titleWidth??90,
                padding: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                color: titleBackGroundColor?? const Color(0xffF5F5F5),
                ),
                child: FittedBox(alignment: Alignment.center,fit: BoxFit.scaleDown,
                child: Center(
                    child: Text(
                     title,
                     textAlign: titleTextAlign,
                      style:titleStyle?? const TextStyle(fontSize: 15, color: Color(0xff636363)),
                    ),
                  ),
                ),
              ),
            ),
          ),
          divider??Container(color:ColorManager.lightGrey,width:0.5 ,height:double.infinity),
          Expanded(
              child: TextFormField(
                enabled:enabled,
                controller:controller,
                focusNode:focusNode,
                initialValue: initialValue,
                keyboardType: keyboardType,
                textAlign: textAlign,
                maxLength: maxLength,
                maxLines: maxLines,
                minLines: minLines,
                validator: validator,
                style: textStyle?? TextStyle(
                    color:enabled?ColorManager.title1:const Color(0xff636363), fontSize: 16),
                onChanged:onChanged,
                textDirection: textDirection,
                decoration: InputDecoration(
                  fillColor: enabled?ColorManager.white:ColorManager.disabled,
                  filled: true,
                  hintText: hintText,
                  counterText:'' ,
                  hintStyle: hintStyle??const TextStyle(color: Colors.black54,fontSize: 16,),
                  hintTextDirection: textDirection,
                  border: const OutlineInputBorder(borderSide: BorderSide.none, borderRadius: BorderRadius.horizontal(right: Radius.circular(7))),
                  focusedBorder: const OutlineInputBorder(borderSide: BorderSide.none,borderRadius: BorderRadius.horizontal(right: Radius.circular(7))),
                  enabledBorder: const OutlineInputBorder(borderSide: BorderSide.none,borderRadius: BorderRadius.horizontal(right: Radius.circular(7))),
                  errorBorder: const OutlineInputBorder(borderSide: BorderSide.none,borderRadius: BorderRadius.horizontal(right: Radius.circular(7))),
                  disabledBorder: const OutlineInputBorder(borderSide: BorderSide.none,borderRadius: BorderRadius.horizontal(right: Radius.circular(7))),
                  contentPadding:contentPadding?? const EdgeInsets.only(left: 15, bottom: 8, right: 15),
                ),
              )),
        trailing??const SizedBox() 
        ],
      ),
    );
  }
}