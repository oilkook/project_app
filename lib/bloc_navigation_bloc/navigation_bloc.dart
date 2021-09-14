// import 'package:flutter/material.dart';
// import 'package:project_app/Homepage/homepage.dart';
// import 'package:bloc/bloc.dart';
// import 'package:project_app/account/Account.dart';

// enum NavigationEvents {
//   HomePageClickedEvent,
//   AccountClickedEvent,
//   SettingsClickedEvent,
// }

// abstract class NavigationStates {}

// class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {
//   @override
//   NavigationStates get initialState => HomePage();
//   @override
//   Stream<NavigationStates> mapEventToState(NavigationEvents event) async* {
//     switch (event) {
//       case NavigationEvents.HomePageClickedEvent:
//         yield HomePage();
//         break;
//       case NavigationEvents.AccountClickedEvent:
//         yield Account();
//         break;
//       case NavigationEvents.SettingsClickedEvent:
//         yield HomePage();
//         break;
//     }
//   }
// }
