part of 'homepage_bloc.dart';

@immutable
sealed class HomepageState {}

final class HomepageInitial extends HomepageState {
  final int selectedIndex;

  HomepageInitial({this.selectedIndex = 0});
}
