import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sense_more/core/network/network_exceptions.dart';
import 'package:sense_more/core/shared/color_manager.dart';
import 'package:sense_more/core/shared/font_manager.dart';
import 'package:sense_more/core/shared/style_manager.dart';
import 'package:sense_more/core/shared/values_manager.dart';
import 'package:sense_more/data/models/room_model.dart';
import 'package:sense_more/data/models/user_model.dart';
import 'package:sense_more/data/repository/search_repository.dart';
import 'package:sense_more/presentation/widgets/toast.dart';
import 'package:collection/collection.dart';

part 'search_state.dart';
part 'search_cubit.freezed.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchRepository repository;
  SearchCubit(this.repository) : super(const SearchState.initial());
  List<RoomModel> rooms = [];
  TextEditingController searchController = TextEditingController();
  getAllRooms() async{
    var response = await repository.getAllRooms();
    response.when(
      success: (data){
        rooms = data;
        emit(SearchState.getSearchFilterSuccess(data));
      }, 
      failure: (e){
        DefaultToast.showMyToast(NetworkExceptions.getErrorMessage(e));
      });
  }
  List<UserModel> searchResults = [];
  searchRoom(int selectedRoomId) async{
    var response = await repository.getUsersInRoom(roomId: selectedRoomId);
    response.when(
      success: (data){
        searchResults = data;
        for (var element in searchResults) {
          element.room = rooms.firstWhere((e) => e.id == element.roomID);
        }
        //  .map((element) => element.room = rooms.firstWhere((e) => e.id == element.roomID));
        emit(SearchState.getSearchResultsSuccess(data));
      }, 
      failure: (e){
        DefaultToast.showMyToast(NetworkExceptions.getErrorMessage(e));
      });
  }
  searchName() async{
    var response = await repository.getUsersByName(name: searchController.text);
    response.when(
      success: (data){
        searchResults = data;
        for (var element in searchResults) {
          element.room = rooms.firstWhereOrNull((e) => e.id == element.roomID);
        }
        //  .map((element) => element.room = rooms.firstWhere((e) => e.id == element.roomID));
        emit(SearchState.getSearchResultsSuccess(data));
      }, 
      failure: (e){
        DefaultToast.showMyToast(NetworkExceptions.getErrorMessage(e));
      });
  }

  int? selectedRoomId;
  selectFilter(BuildContext context,int number){
    if(selectedRoomId == number){
      selectedRoomId = null;
    }else{
      selectedRoomId = number;
    }
    Navigator.of(context, rootNavigator: true).pop();
    searchRoom(number);
    emit(SearchState.changeSearchFilter(selectedRoomId));
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
                    'Select Room',
                    style: getBoldStyle(
                      fontSize: FontSize.s22.sp,
                      color: ColorManager.primary,
                    ),
                  ),
                  GridView.builder(
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 130.w),
                      itemCount: rooms.length,
                      itemBuilder: (_, i) {
                        RoomModel room = rooms[i];
                        int roomId = room.id??-1;
                        bool isSelected = selectedRoomId == room.id;
                        return GestureDetector(
                        onTap: ()=> selectFilter(context,roomId),
                        child: Container(
                              alignment: Alignment.center,
                              margin: const EdgeInsets.all(5),
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: isSelected? ColorManager.primary : null,
                                  borderRadius: BorderRadius.circular(AppSize.s12),
                                  border: Border.all(color: isSelected? ColorManager.white : ColorManager.primary)),
                              child: Text(
                                '#${room.name}',
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: getBoldStyle(
                                    color: isSelected? ColorManager.white : ColorManager.black,
                                    fontSize: FontSize.s12.sp),
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
  
  // void getSearchResults(){
  //   repository.
  // }

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
