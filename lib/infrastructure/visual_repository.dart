import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nexttwo/screens/sorting_visualizer/bloc/sorting_visualizer_bloc.dart';
import 'package:nexttwo/screens/sorting_visualizer/bloc/sorting_visualizer_event.dart';

class VisualRepository {


  mergeSortVisualiser(
      List<int> mergeArr, int low, int high, BuildContext context) async {
    if (low < high) {
      int mid = (low + (high - low) / 2).toInt();
      await mergeSortVisualiser(mergeArr, low, mid, context);
      await mergeSortVisualiser(mergeArr, mid + 1, high, context);

      await merge(mergeArr, low, mid, high, context);
      await Future.delayed(const Duration(milliseconds: 300), () {
        BlocProvider.of<SortingVisualizerBloc>(context)
            .add(UpdateList(list: mergeArr));
      });
    }
  }


  merge(List<int> mergeArr, int low, int mid, int high,
      BuildContext context) async {
    int i, j, k;
    int n1 = mid - low + 1;
    int n2 = high - mid;

    List<int> L = [], R = [];

    for (i = 0; i < n1; i++) {
      L.add(mergeArr[low + i]);
    }
    for (j = 0; j < n2; j++) {
      R.add(mergeArr[mid + 1 + j]);
    }
    i = 0;
    j = 0;
    k = low;
    while (i < n1 && j < n2) {
      if (L[i] <= R[j]) {
        mergeArr[k] = L[i];
        i++;
      } else {
        mergeArr[k] = R[j];
        j++;
      }
      await Future.delayed(const Duration(milliseconds: 300), () {
        BlocProvider.of<SortingVisualizerBloc>(context)
            .add(UpdateList(list: mergeArr));
      });
      k++;
    }
    while (i < n1) {
      mergeArr[k] = L[i];
      i++;
      k++;
    }
    while (j < n2) {
      mergeArr[k] = R[j];
      j++;
      k++;
    }
  }


  heapSortVisualiser(List<int> heapArr, BuildContext context) async {
    int n = heapArr.length;

    for (int i = n ~/ 2 - 1; i >= 0; i--) {
      await heapify(heapArr, n, i, context);
    }

    for (int i = n - 1; i >= 0; i--) {
      int temp = heapArr[0];
      heapArr[0] = heapArr[i];
      heapArr[i] = temp;
      await Future.delayed(const Duration(milliseconds: 300), () {
        BlocProvider.of<SortingVisualizerBloc>(context)
            .add(UpdateList(list: heapArr));
      });
      await heapify(heapArr, i, 0, context);
    }
  }


  heapify(List<int> heapArr, int n, int i, BuildContext context) async {
    int largest = i;
    int l = 2 * i + 1;
    int r = 2 * i + 2;

    if (l < n && heapArr[l] > heapArr[largest]) largest = l;

    if (r < n && heapArr[r] > heapArr[largest]) largest = r;

    if (largest != i) {
      int swap = heapArr[i];
      heapArr[i] = heapArr[largest];
      heapArr[largest] = swap;

      await Future.delayed(const Duration(milliseconds: 300), () {
        BlocProvider.of<SortingVisualizerBloc>(context)
            .add(UpdateList(list: heapArr));
      });
      await heapify(heapArr, n, largest, context);
    }
  }


  quickSortVisualiser(
      List<int> quickArr, int low, int high, BuildContext context) async {
    int pivot;
    if (low < high) {
      pivot = await _partition(quickArr, low, high, context);
      await quickSortVisualiser(quickArr, low, pivot - 1, context);
      await quickSortVisualiser(quickArr, pivot + 1, high, context);
    }
  }


  Future<int> _partition(
      List<int> quickArr, int low, int high, BuildContext context) async {
    int pivot = quickArr[high];
    int i = (low - 1);
    int temp;
    for (int j = low; j <= high - 1; j++) {
      if (quickArr[j] < pivot) {
        i++;
        temp = quickArr[i];
        quickArr[i] = quickArr[j];
        quickArr[j] = temp;
        await Future.delayed(const Duration(milliseconds: 300), () {
          BlocProvider.of<SortingVisualizerBloc>(context)
              .add(UpdateList(list: quickArr));
        });
      }
    }
    temp = quickArr[i + 1];
    quickArr[i + 1] = quickArr[high];
    quickArr[high] = temp;
    await Future.delayed(const Duration(milliseconds: 300), () {
      BlocProvider.of<SortingVisualizerBloc>(context)
          .add(UpdateList(list: quickArr));
    });
    return (i + 1);
  }
}
