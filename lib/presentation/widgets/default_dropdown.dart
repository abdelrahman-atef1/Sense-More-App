// import 'package:akwad/shared/color_manager.dart';
// import 'package:akwad/shared/widgets/decorated_input_border.dart';
// import 'package:dropdown_search/dropdown_search.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';


// class DefaultDropdown<T> extends StatelessWidget {
//   const DefaultDropdown({
//     Key? key,
//     required this.items,
//     this.selectedItem,
//     this.hint,
//     this.enabled = true,
//     this.hasBorder = false,
//     this.hasShadow = true,
//     this.filled = true,
//     this.maxHeight,
//     this.dropDownKey,
//     this.textStyle,
//     this.decoration,
//     this.fillColor,
//     this.borderRadius,
//     this.itemAsString,
//     this.selectedAlign,
//     this.dropdownAlign,
//     this.onChanged,
//     this.dropdownButtonBuilder,
//   }) : super(key: key);
//   final List<T> items;
//   final String? hint;
//   final T? selectedItem;
//   final bool enabled,hasBorder,hasShadow,filled;
//   final double? maxHeight;
//   final Key? dropDownKey;
//   final TextStyle? textStyle;
//   final BoxDecoration? decoration;
//   final Color? fillColor;
//   final BorderRadius? borderRadius;
//   final void Function(T?)? onChanged;
//   final String Function(T?)? itemAsString;
//   final AlignmentGeometry? selectedAlign,dropdownAlign;
//   final Widget Function(BuildContext)? dropdownButtonBuilder; 
//   @override
//   Widget build(BuildContext context) {
//   final relativeMenuHeight = (items.length* ((14 + 5.h) *1.6)); //Item count * approximate Item height
//   var inputBorder = OutlineInputBorder(borderRadius:borderRadius?? BorderRadius.circular(7),borderSide: hasBorder?const BorderSide(color: ColorManager.primary,width:0.5):BorderSide.none);
//     return DropdownSearch<T>(
//       key: dropDownKey,
//       enabled: enabled,
//       // mode: Mode.MENU,
//       selectedItem:selectedItem,
//       itemAsString: itemAsString,
//       popupProps: PopupProps.menu(
//       constraints: BoxConstraints(maxHeight: relativeMenuHeight),
//       menuProps: MenuProps(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),),
//       itemBuilder: (context, item, isSelected) {
//           return Container(
//             alignment:dropdownAlign?? AlignmentDirectional.centerStart,
//             padding:  EdgeInsetsDirectional.fromSTEB(10.w,5.h,0.w,5.h),
//             child: Text(itemAsString !=null?itemAsString!(item):item.toString(),maxLines: 2,overflow: TextOverflow.ellipsis, style:textStyle?? TextStyle(
//                 color: ColorManager.primary,
//                 fontSize: 16,
//               ),),
//           );
//       },
//       ),
//       dropdownButtonProps: DropdownButtonProps(
//         splashRadius: 12,
//           icon: Icon(Icons.keyboard_arrow_down,color: enabled ? ColorManager.primary : const Color(0xff636363),
//               size: 20.r),
//         iconSize: 20.r,
//         padding: EdgeInsets.zero
//       ),
//       dropdownDecoratorProps: DropDownDecoratorProps(
//         dropdownSearchDecoration:  InputDecoration(
//             // isCollapsed: true,
//             fillColor: fillColor??(enabled?ColorManager.white:ColorManager.lightGrey),
//             filled:filled,
//             border: inputBorder,
//             errorBorder: hasShadow? DecoratedInputBorder(child:inputBorder):inputBorder,
//             enabledBorder: hasShadow? DecoratedInputBorder(child:inputBorder):inputBorder,        
//             focusedBorder: hasShadow? DecoratedInputBorder(child:inputBorder):inputBorder,
//             disabledBorder: hasShadow? DecoratedInputBorder(child:inputBorder):inputBorder,
//             focusedErrorBorder: hasShadow? DecoratedInputBorder(child:inputBorder):inputBorder,
//             contentPadding:  EdgeInsetsDirectional.zero,
//           ),
//         ),
//       items: items,
//       dropdownBuilder: (ctx,value){
//         if (value==null||(value is String &&(value==''))){
//           return Container(
//           alignment:selectedAlign?? AlignmentDirectional.center,
//           padding:  const EdgeInsetsDirectional.only(start: 10),
//           child: Text(hint??'',maxLines: 2,overflow: TextOverflow.ellipsis,style: TextStyle(
//             color: const Color(0xABA5A5A5),
//             fontSize: 16
//           ),),
//         );
//         }
//         return  Container(
//           alignment:selectedAlign?? AlignmentDirectional.center,
//           padding: const EdgeInsetsDirectional.only(start: 10),
//           child:  FittedBox(
//             alignment: Alignment.center,fit: BoxFit.scaleDown,
//             child: Text(value is String?value :itemAsString==null?value.toString():itemAsString!(value),maxLines: 1,overflow: TextOverflow.ellipsis,style:textStyle?? TextStyle(
//               color: enabled? ColorManager.primary:const Color(0xff636363),
//               fontSize: 16,
//             ),),
//           ),
//         );
//       },
//       onChanged:onChanged
//     );
//   }
// }
