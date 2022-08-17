import 'main_state.dart';
class LoadingState extends MainState {}
class Loaded extends MainState {
  dynamic data;
  Loaded(
      {required this.data,
     });

  dynamic getdata() => data;
}
class ErrorState extends MainState {}
class Empty extends MainState {}

