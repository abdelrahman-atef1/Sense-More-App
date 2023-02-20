import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'side_menu_model.freezed.dart';

@freezed
class SideMenuModel with _$SideMenuModel {
  const SideMenuModel._();
  const factory SideMenuModel(
    {required String name,
    required IconData icon,
    required VoidCallback onClick,
    }
  ) = _SideMenuModel;
}