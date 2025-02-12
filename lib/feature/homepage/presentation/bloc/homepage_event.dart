part of 'homepage_bloc.dart';

@immutable
sealed class HomepageEvent {}

class SelectCategory extends HomepageEvent {
  final int index;

  SelectCategory(this.index);
}
