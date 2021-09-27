import 'package:equatable/equatable.dart';

abstract class SortingAnalyzerEvent extends Equatable {
  const SortingAnalyzerEvent();
}

class SortPressed extends SortingAnalyzerEvent {
  final List<int> list;

  SortPressed({required this.list});

  @override
  List<Object> get props => [];

  @override
  String toString() =>
      'SortPressed';
}
