import 'package:equatable/equatable.dart';

abstract class SortingVisualizerState extends Equatable {
  const SortingVisualizerState();
}

class SortingVisualizerInitial extends SortingVisualizerState {
  @override
  List<Object> get props => [];

}

class UpdateListState extends SortingVisualizerState {

  final List<int> list ;
  UpdateListState({required this.list});

  @override
  List<Object> get props => [list];

  @override
  String toString() => 'UpdateListState';

}
