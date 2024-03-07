import 'package:e_commerce/home/dashboard.dart';
import 'package:e_commerce/home/profile_view.dart';
import 'package:flutter/material.dart';

class HomeState {
  final List<Widget> lstWidget;
  final int index;

  HomeState({
    required this.lstWidget,
    required this.index,
  });

  //Making another construtor to contact with StateNotifier
  factory HomeState.intitial() {
    return HomeState(
        lstWidget: [Dashboard_View(), ProfilePageView()],
        index: 0);
  }

  //Making copy with function to change the index number
  HomeState copywith({
    int? index,
  }) {
    return HomeState(lstWidget: lstWidget, index: index ?? this.index);
  }
}
