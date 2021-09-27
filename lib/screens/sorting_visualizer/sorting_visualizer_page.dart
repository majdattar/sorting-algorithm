import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nexttwo/screens/sorting_analyzer/bloc/sorting_analyzer_bloc.dart';
import 'package:nexttwo/screens/sorting_analyzer/sorting_analyzer_page.dart';
import 'package:nexttwo/widgets/visualizer_widget.dart';

import 'bloc/sorting_visualizer_bloc.dart';
import 'bloc/sorting_visualizer_event.dart';
import 'bloc/sorting_visualizer_state.dart';

class SortingVisualizerPage extends StatefulWidget {
  const SortingVisualizerPage({Key? key}) : super(key: key);

  @override
  _SortingVisualizerPageState createState() => _SortingVisualizerPageState();
}

class _SortingVisualizerPageState extends State<SortingVisualizerPage> {

  String selected = 'Select a sorting Algorithm';
  List<int> arr = [
    100,
    90,
    102,
    80,
    100,
    50,
    40,
    103,
    80,
    100,
    20,
    78,
    95,
    90,
    54,
    32,
    81,
    100,
    20
  ];

  List<int> temp = [
    100,
    90,
    102,
    80,
    100,
    50,
    40,
    103,
    80,
    100,
    20,
    78,
    95,
    90,
    54,
    32,
    81,
    100,
    20
  ];

  List<String> dropDownItems = [
    'BubbleSort',
    'InsertionSort',
    'MergeSort',
    'QuickSort',
    'HeapSort'
  ];

  late Timer timer;
  @override
  void initState() {
    super.initState();
    timer= Timer.periodic( Duration(milliseconds: 100), (timer){ setState((){});});
  }

  @override
  void dispose() {
    super.dispose();
    timer.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<SortingVisualizerBloc, SortingVisualizerState>(
        listener: (context, state) {
      if (state is UpdateListState) {
          arr = state.list;
      }
    }, child: BlocBuilder<SortingVisualizerBloc, SortingVisualizerState>(
            builder: (context, state) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Sorting Algorithm Visualizer"),
        ),
        body: SingleChildScrollView(
          child: Container(
              color: Colors.grey[100],
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: DropdownButton<String>(
                      hint: Text(selected),
                      isExpanded: true,
                      style: const TextStyle(color: Colors.brown),
                      items: dropDownItems.map((e) {
                        return DropdownMenuItem<String>(
                            value: e, child: Text(e));
                      }).toList(),
                      onChanged: (val) {
                        setState(
                          () {
                            selected = val!;
                            //arr = [...temp];
                          },
                        );
                      },
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 26),
                      child: OutlinedButton(
                          onPressed: () {

                            if(arr[arr.length-1]==103) {
                              arr=[...temp];
                            }

                                if (selected == "BubbleSort") {
                                  BlocProvider.of<SortingVisualizerBloc>(context)
                                      .add(BubbleSelected(list: arr));
                                } else if (selected == "InsertionSort") {
                                  BlocProvider.of<SortingVisualizerBloc>(context)
                                      .add(InsertionSelected(list: arr));
                                } else if (selected == "MergeSort") {
                                  BlocProvider.of<SortingVisualizerBloc>(context)
                                      .add(MergeSelected(list: arr, context:context));
                                } else if (selected == "HeapSort") {
                                  BlocProvider.of<SortingVisualizerBloc>(context)
                                      .add(HeapSelected(list: arr, context: context));
                                } else if (selected == "QuickSort") {
                                  BlocProvider.of<SortingVisualizerBloc>(context)
                                      .add(QuickSelected(list: arr, context: context));
                                }



                          },
                          child: const Text("Start")),
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                  ),
                  Container(
                    padding: const EdgeInsets.only(top: 26.0),
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:
                            arr.map((val) => VisualizerWidget(val)).toList()),
                  ),
                ],
              )),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
                builder: (ctx) => BlocProvider(
                    create: (ctx) => SortingAnalyzerBloc(),
                    child: const SortingAnalyzerPage())));
          },
          child: const Icon(Icons.sort),
        ),
      );
    }));
  }
}
