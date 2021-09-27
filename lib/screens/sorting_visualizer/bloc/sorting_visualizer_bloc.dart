import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nexttwo/infrastructure/visual_repository.dart';
import 'package:nexttwo/screens/sorting_visualizer/bloc/sorting_visualizer_event.dart';
import 'package:nexttwo/screens/sorting_visualizer/bloc/sorting_visualizer_state.dart';

class SortingVisualizerBloc
    extends Bloc<SortingVisualizerEvent, SortingVisualizerState> {
  SortingVisualizerBloc() : super(SortingVisualizerInitial());

  VisualRepository visualRepository = VisualRepository();

  @override
  Stream<SortingVisualizerState> mapEventToState(
    SortingVisualizerEvent event,
  ) async* {
    if (event is BubbleSelected) {
      yield* _mapBubbleSelectedToState(event);
    }
    if (event is UpdateList) {
      yield UpdateListState(list: event.list);
    }
    if (event is InsertionSelected) {
      yield* _mapInsertionSelectedToState(event);
    }
    if (event is MergeSelected) {
      yield* _mapMergeSelectedToState(event);
    }
    if (event is HeapSelected) {
      yield* _mapHeapSelectedToState(event);
    }
    if (event is QuickSelected) {
      yield* _mapQuickSelectedToState(event);
    }
  }


  Stream<SortingVisualizerState> _mapMergeSelectedToState(
      MergeSelected event) async* {
    await visualRepository.mergeSortVisualiser(event.list, 0, event.list.length-1, event.context);
  }

  Stream<SortingVisualizerState> _mapHeapSelectedToState(
      HeapSelected event) async* {
    await visualRepository.heapSortVisualiser(event.list, event.context);
  }

  Stream<SortingVisualizerState> _mapQuickSelectedToState(
      QuickSelected event) async* {

    await visualRepository.quickSortVisualiser(event.list, 0, event.list.length-1, event.context);
  }

  Stream<SortingVisualizerState> _mapBubbleSelectedToState(
      BubbleSelected event) async* {
    List<int> list = event.list;
    for (var i = 0; i < list.length; i++) {
      bool swapped = false;
      for (var j = i + 1; j < list.length; j++) {
        if (list[i] > list[j]) {
          var tmp = list[i];
          list[i] = list[j];
          list[j] = tmp;
          swapped = true;
        }
        await Future.delayed(Duration(milliseconds: 300), () {
          list = event.list;
          add(UpdateList(list: list));
        });
      }
      if (!swapped) {
        break;
      }
    }
  }

  Stream<SortingVisualizerState> _mapInsertionSelectedToState(
      InsertionSelected event) async* {
    List<int> list = event.list;
    List<int> insertArr = list;
    int key, j;
    for (int i = 1; i < insertArr.length; i++) {
      key = insertArr[i];
      j = i - 1;
      while (j >= 0 && insertArr[j] > key) {
        insertArr[j + 1] = insertArr[j];
        j = j - 1;
      }
      insertArr[j + 1] = key;
      await Future.delayed(const Duration(milliseconds: 1000), () {
        list = insertArr;
        add(UpdateList(list: list));
      });
    }
  }


}
