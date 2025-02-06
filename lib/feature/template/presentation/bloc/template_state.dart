part of 'template_bloc.dart';

sealed class TemplateState extends Equatable {
  const TemplateState();
  
  @override
  List<Object> get props => [];
}

final class TemplateInitial extends TemplateState {}
