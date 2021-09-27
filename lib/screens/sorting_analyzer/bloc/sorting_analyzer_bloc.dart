
import 'package:bloc/bloc.dart';
import 'package:nexttwo/infrastructure/analysis_repository.dart';
import 'package:nexttwo/screens/sorting_analyzer/bloc/sorting_analyzer_event.dart';
import 'package:nexttwo/screens/sorting_analyzer/bloc/sorting_analyzer_state.dart';

class SortingAnalyzerBloc extends Bloc<SortingAnalyzerEvent, SortingAnalyzerState> {
  SortingAnalyzerBloc() : super(SortingAnalyzerInitial());

  AnalyzerRepo analyzerRepo = AnalyzerRepo();

  @override
  Stream<SortingAnalyzerState> mapEventToState(
      SortingAnalyzerEvent event,
      ) async* {
    if (event is SortPressed) {
      yield* _mapSortPressedToState(event);
    }
  }

  Stream<SortingAnalyzerState> _mapSortPressedToState(SortPressed event) async* {

    int bubbleResult = analyzerRepo.bubbleSort(event.list);
    yield BubbleSortingState(bubble:bubbleResult);

    int heapResult = analyzerRepo.heapSort(event.list);
    yield HeapSortingState(heap:heapResult);

    int selectionResult = analyzerRepo.selectionSort(event.list);
    yield SelectionSortingState(selection:selectionResult);

    int insertionResult = analyzerRepo.insertionSort(event.list);
    yield InsertionSortingState(insertion:insertionResult);

    int mergeResult = analyzerRepo.mergeSort(event.list, 0 , event.list.length-1);
    yield MergeSortingState(merge:mergeResult);
  }
}