import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

abstract class SortingVisualizerEvent extends Equatable {
  const SortingVisualizerEvent();
}

class BubbleSelected extends SortingVisualizerEvent {
  final List<int> list;

  BubbleSelected({required this.list});

  @override
  List<Object> get props => [list];

  @override
  String toString() => 'BubbleSelected';
}

class UpdateList extends SortingVisualizerEvent {
  final List<int> list;

  UpdateList({required this.list});

  @override
  List<Object> get props => [list];

  @override
  String toString() => 'UpdateList';
}

class InsertionSelected extends SortingVisualizerEvent {
  final List<int> list;

  InsertionSelected({required this.list});

  @override
  List<Object> get props => [list];

  @override
  String toString() => 'InsertionSelected';
}

class MergeSelected extends SortingVisualizerEvent {
  final BuildContext context;
  final List<int> list;

  MergeSelected({required this.list, required this.context});

  @override
  List<Object> get props => [list];

  @override
  String toString() => 'MargeSelected';
}

class QuickSelected extends SortingVisualizerEvent {
  final List<int> list;
  final BuildContext context;

  QuickSelected({required this.list, required this.context});

  @override
  List<Object> get props => [list];

  @override
  String toString() => 'QuickSelected';
}

class HeapSelected extends SortingVisualizerEvent {
  final List<int> list;
  final BuildContext context;

  HeapSelected({required this.list, required this.context});

  @override
  List<Object> get props => [list];

  @override
  String toString() => 'HeapSelected';
}


