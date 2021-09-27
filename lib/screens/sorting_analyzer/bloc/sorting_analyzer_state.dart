import 'package:equatable/equatable.dart';

abstract class SortingAnalyzerState extends Equatable {
  const SortingAnalyzerState();
}

class SortingAnalyzerInitial extends SortingAnalyzerState {
  @override
  List<Object> get props => [];

}

class BubbleSortingState extends SortingAnalyzerState {

  final int bubble ;
  const BubbleSortingState({required this.bubble});

  @override
  List<Object> get props => [bubble];

  @override
  String toString() => 'BubbleSorting';

}

class HeapSortingState extends SortingAnalyzerState {

  final int heap ;
  HeapSortingState({required this.heap});

  @override
  List<Object> get props => [heap];

  @override
  String toString() => 'HeapSorting';

}

class SelectionSortingState extends SortingAnalyzerState {

  final int selection ;
  SelectionSortingState({required this.selection});

  @override
  List<Object> get props => [selection];

  @override
  String toString() => 'SelectionSorting';

}

class InsertionSortingState extends SortingAnalyzerState {

  final int insertion ;
  InsertionSortingState({required this.insertion});

  @override
  List<Object> get props => [insertion];

  @override
  String toString() => 'insertionSorting';

}

class MergeSortingState extends SortingAnalyzerState {

  final int merge ;
  MergeSortingState({required this.merge});

  @override
  List<Object> get props => [merge];

  @override
  String toString() => 'mergeSorting';

}