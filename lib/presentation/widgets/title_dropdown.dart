
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_spinkit/flutter_spinkit.dart';
// class TitleDropdown<T> extends StatelessWidget {
//   const TitleDropdown({
//     Key? key,
//     required this.items,
//     required this.title,
//     this.selectedItem,
//     this.isLoading = false,
//     this.isPercentage = false,
//     this.isExpanded = true,
//     this.enabled = true,
//     this.itemAsString,
//     this.textStyle,
//     this.titleTextStyle,
//     this.hint,
//     this.titleBackgroundColor,
//     this.titleWidth,
//     this.dropdownWidth,
//     this.decoration,
//     this.titleDecoration,
//     this.divider,
//     this.maxHeight,
//     this.onChanged,
//     this.dropdownAlign
//   }) : super(key: key);
//   final List<T> items;
//   final String title;
//   final String? hint;
//   final bool isLoading,enabled,isPercentage,isExpanded;
//   final T? selectedItem;
//   final TextStyle? textStyle;
//   final TextStyle? titleTextStyle;
//   final double? maxHeight,titleWidth,dropdownWidth;
//   final Color? titleBackgroundColor;
//   final BoxDecoration? titleDecoration;
//   final BoxDecoration? decoration;
//   final Widget? divider;
//   final void Function(T?)? onChanged;
//   final String Function(T?)? itemAsString;
//   final AlignmentGeometry? dropdownAlign;
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Expanded(
//                 child: Container(
//                   height: 40.h,
//                   margin: const EdgeInsets.all(1),
//                   decoration: decoration ??
//                       BoxDecoration(
//                         color: enabled ? AppColors.white : AppColors.bottomSheetTabColor,
//                         boxShadow: const [
//                           BoxShadow(
//                               color: Color(0xFFC5CCC6),
//                               blurRadius: 2.5,
//                               offset: Offset(0, 0)),
//                         ],
//                         border: Border.all(color: const Color(0xFFE9E9E9), width: 0.5),
//                         borderRadius: BorderRadius.circular(7.0),
//                       ),
//                   child: isLoading? SizedBox(height: 40.h,child: SpinKitThreeBounce(color: Colors.blue,size: 20.r)):
//                   Row(
//                     children: [
//                       ClipRRect(
//                         borderRadius: const BorderRadius.only(
//                           topRight: Radius.circular(7),
//                           bottomRight: Radius.circular(7),
//                         ),
//                         child: Container(
//                           decoration:titleDecoration??BoxDecoration(
//                           color: titleBackgroundColor,
//                           ),
//                           alignment: Alignment.center,
//                           width:titleWidth?? 65.w,
//                           child: Text(
//                             title,
//                             textAlign: TextAlign.center,
//                             style:titleTextStyle?? TextStyle(fontSize: 15, color: const Color(0xBA182A5E)),
//                           ),
//                         ),
//                       ),
//                       divider??Container(margin: EdgeInsets.symmetric(vertical:8.h), color:AppColors.logoBlueColor,width:1 ,height:24.h),
//                       Expanded(
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                            dropdownWidth==null? Expanded(
//                               child: DefaultDropdown<T>(
//                                 borderRadius: const BorderRadius.horizontal(left:Radius.circular(7)),
//                                 hasBorder: false,
//                                 hasShadow: false,
//                                 dropdownAlign: dropdownAlign,
//                                 maxHeight: maxHeight,
//                                 itemAsString:itemAsString,
//                                 enabled: enabled,
//                                 hint: hint,
//                                 textStyle: textStyle,
//                                 selectedItem:selectedItem,
//                                 items:items,
//                                 onChanged:onChanged
//                               ),
//                             ):SizedBox(
//                               width: dropdownWidth,
//                               child: DefaultDropdown<T>(
//                                   borderRadius: const BorderRadius.horizontal(left:Radius.circular(7)),
//                                   hasBorder: false,
//                                   hasShadow: false,
//                                   dropdownAlign: dropdownAlign,
//                                   maxHeight: maxHeight,
//                                   itemAsString:itemAsString,
//                                   enabled: enabled,
//                                   hint: hint,
//                                   textStyle: textStyle,
//                                   selectedItem:selectedItem,
//                                   items:items,
//                                   onChanged:onChanged
//                                 ),
//                             ),
//                           if(isPercentage) Text('%',style:TextStyle(color: AppColors.logoBlueColor,fontSize: 16,)),
//                           if(isPercentage) SizedBox(width: 10.w),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//                   ),
//       ],
//     );
//   }
// }
