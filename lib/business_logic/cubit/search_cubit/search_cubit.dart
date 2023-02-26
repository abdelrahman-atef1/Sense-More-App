import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sense_more/core/shared/color_manager.dart';
import 'package:sense_more/core/shared/font_manager.dart';
import 'package:sense_more/core/shared/style_manager.dart';
import 'package:sense_more/core/shared/values_manager.dart';

part 'search_state.dart';
part 'search_cubit.freezed.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(const SearchState.initial());


  int? selectedFloorNumber;
  selectFilter(BuildContext context,int number){
    if(selectedFloorNumber == number){
      selectedFloorNumber = null;
    }else{
      selectedFloorNumber = number;
    }
    Navigator.of(context, rootNavigator: true).pop();
    emit(SearchState.changeSearchFilter(selectedFloorNumber));
  }
  showFilterDialogue(BuildContext context) {
    FocusManager.instance.primaryFocus?.unfocus();
    showDialog(
        context: context,
        useSafeArea: true,
        builder: (_) {
          return Center(
            child: Container(
              width: 0.9.sw,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: ColorManager.white,
                  borderRadius: BorderRadius.circular(AppSize.s8)),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Select Floor',
                    style: getBoldStyle(
                      fontSize: FontSize.s22.sp,
                      color: ColorManager.primary,
                    ),
                  ),
                  GridView.builder(
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 100.w),
                      itemCount: 8,
                      itemBuilder: (_, i) {
                        int floorNumber = i+1;
                        bool isSelected = selectedFloorNumber == floorNumber;
                        return GestureDetector(
                        onTap: ()=> selectFilter(context,floorNumber),
                        child: Container(
                              alignment: Alignment.center,
                              margin: const EdgeInsets.all(5),
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: isSelected? ColorManager.primary : null,
                                  borderRadius: BorderRadius.circular(AppSize.s12),
                                  border: Border.all(color: isSelected? ColorManager.white : ColorManager.primary)),
                              child: FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Text(
                                  '#$floorNumber${getTextEnding(floorNumber)}',
                                  style: getBoldStyle(
                                      color: isSelected? ColorManager.white : ColorManager.black,
                                      fontSize: FontSize.s22.sp),
                                ),
                              ),
                            ),
                      );
                      }),
                ],
              ),
            ),
          );
        });
  }
}

String getTextEnding(int number) {
  if (number == 1) {
    return 'st';
  } else if (number == 2) {
    return 'nd';
  } else if (number == 3) {
    return 'rd';
  } else {
    return 'th';
  }
}
