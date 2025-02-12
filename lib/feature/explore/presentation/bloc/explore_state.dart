part of 'explore_bloc.dart';

sealed class ExploreState extends Equatable {
  const ExploreState();
  
  @override
  List<Object> get props => [];
}

final class ExploreInitial extends ExploreState {}
