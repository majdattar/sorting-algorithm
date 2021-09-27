
class AnalyzerRepo {


  int bubbleSort(List list) {
    Stopwatch stopwatch = Stopwatch()..start();
    for (var i = 0; i < list.length; i++) {
      bool swapped = false;
      for (var j = i + 1; j < list.length; j++) {
        if (list[i] > list[j]) {
          var tmp = list[i];
          list[i] = list[j];
          list[j] = tmp;
          swapped = true;
        }}
      if (!swapped) break;
    }
    int stop = stopwatch.elapsedMicroseconds;
    return stop;
  }

  int selectionSort(List list) {
    Stopwatch stopwatch2 = Stopwatch()..start();
    for (var i = 0; i < list.length; i++) {
      var x = list[i], j = i;

      while (j > 0 && list[j - 1] > x) {
        list[j] = list[j - 1];
        list[j - 1] = x;
        j--;
      }
      list[j] = x;
    }
    int stop = stopwatch2.elapsedMicroseconds;
    return stop;
  }

  int insertionSort(List list) {
    Stopwatch stopwatch3 = Stopwatch()..start();
    for (var i = list.length - 1; i >= 0; i--) {
      var first = 0, tmp;

      for (var j = 1; j <= i; j++) {
        if (list[j] > list[first]) first = j;
      }
      tmp = list[first];
      list[first] = list[i];
      list[i] = tmp;
    }
    int stop = stopwatch3.elapsedMicroseconds;
    return stop;
  }

  int heapSort(List list) {
    Stopwatch stopwatch4 = Stopwatch()..start();
    int n = list.length;
    for (int i = (n ~/ 2); i >= 0; i--) {
      heapify(list, n, i);
    }

    for (int i = n - 1; i >= 0; i--) {
      swap(list, i);
      heapify(list, i, 0);
    }
    int stop = stopwatch4.elapsedMicroseconds;
    return stop;
  }

  int mergeSort(List list, int leftIndex, int rightIndex) {
    Stopwatch stopwatch5 = Stopwatch()..start();
    if (leftIndex < rightIndex) {
      int middleIndex = (rightIndex + leftIndex) ~/ 2;

      mergeSort(list, leftIndex, middleIndex);
      mergeSort(list, middleIndex + 1, rightIndex);

      merges(list, leftIndex, middleIndex, rightIndex);
    }
    int stop = stopwatch5.elapsedMicroseconds;
    return stop;
  }

  void heapify(List list, int n, int i) {
    int largest = i;
    int l = 2 * i + 1;
    int r = 2 * i + 2;

    if (l < n && list[l] > list[largest]) {
      largest = l;
    }

    if (r < n && list[r] > list[largest]) {
      largest = r;
    }

    if (largest != i) {
      swapList(list, i, largest);
      heapify(list, n, largest);
    }
  }

  void swap(List list, int i) {
    int temp = list[0];
    list[0] = list[i];
    list[i] = temp;
  }

  void swapList(List list, int i, int largest) {
    int swap = list[i];
    list[i] = list[largest];
    list[largest] = swap;
  }

  void merges(List list, int leftIndex, int middleIndex, int rightIndex) {
    int leftSize = middleIndex - leftIndex + 1;
    int rightSize = rightIndex - middleIndex;

    List leftList =  List.filled(leftSize, null, growable: false);
    List rightList =  List.filled(rightSize, null, growable: false);

    for (int i = 0; i < leftSize; i++) leftList[i] = list[leftIndex + i];
    for (int j = 0; j < rightSize; j++) rightList[j] = list[middleIndex + j + 1];

    int i = 0, j = 0;
    int k = leftIndex;

    while (i < leftSize && j < rightSize) {
      if (leftList[i] <= rightList[j]) {
        list[k] = leftList[i];
        i++;
      } else {
        list[k] = rightList[j];
        j++;
      }
      k++;
    }

    while (i < leftSize) {
      list[k] = leftList[i];
      i++;
      k++;
    }

    while (j < rightSize) {
      list[k] = rightList[j];
      j++;
      k++;
    }
  }

}