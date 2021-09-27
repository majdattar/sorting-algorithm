import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nexttwo/screens/sorting_analyzer/bloc/sorting_analyzer_bloc.dart';
import 'package:nexttwo/screens/sorting_analyzer/bloc/sorting_analyzer_state.dart';
import 'package:nexttwo/screens/sorting_visualizer/bloc/sorting_visualizer_bloc.dart';
import 'package:nexttwo/screens/sorting_visualizer/sorting_visualizer_page.dart';
import 'package:nexttwo/widgets/analyzer_card.dart';

import 'bloc/sorting_analyzer_event.dart';

class SortingAnalyzerPage extends StatefulWidget {
  const SortingAnalyzerPage({Key? key}) : super(key: key);

  @override
  _SortingAnalyzerPageState createState() => _SortingAnalyzerPageState();
}

class _SortingAnalyzerPageState extends State<SortingAnalyzerPage> {
  TextEditingController controller = TextEditingController();
  String error = "";
  int bubble = 0;
  int heap = 0;
  int selection = 0;
  int insertion = 0;
  int merge = 0;

  @override
  Widget build(BuildContext context) {
    return BlocListener<SortingAnalyzerBloc, SortingAnalyzerState>(
        listener: (context, state) {
      if (state is BubbleSortingState) {
        bubble = state.bubble;
      }
      if (state is HeapSortingState) {
        heap = state.heap;
      }
      if (state is SelectionSortingState) {
        selection = state.selection;
      }
      if (state is InsertionSortingState) {
        insertion = state.insertion;
      }
      if (state is MergeSortingState) {
        merge = state.merge;
      }
    }, child: BlocBuilder<SortingAnalyzerBloc, SortingAnalyzerState>(
            builder: (context, state) {
      return Scaffold(
          appBar: AppBar(
            title: const Text("Sorting Algorithm Analyzer"),
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
                      child: TextField(
                        controller: controller,
                        onChanged: (val) {
                          setState(() {
                            error = "";
                          });
                        },
                        decoration: InputDecoration(
                            label: const Text("Enter your array"),
                            filled: true,
                            fillColor: Colors.white,
                            errorText: error,
                            border: const OutlineInputBorder(),
                            suffixIcon: IconButton(
                              icon: const Icon(
                                Icons.sort,
                                size: 30,
                              ),
                              onPressed: () {
                                try {
                                  List list = json.decode(controller.text);
                                  List<int> myList =
                                      list.map((e) => e as int).toList();
                                  BlocProvider.of<SortingAnalyzerBloc>(context)
                                      .add(SortPressed(list: myList));
                                } catch (e) {
                                  setState(() {
                                    if (controller.text.isNotEmpty) {
                                      error = "it's not array";
                                    } else {
                                      error = "enter your array";
                                    }
                                  });
                                }
                              },
                            )),
                      ),
                    ),
                    const SizedBox(
                      height: 60,
                    ),
                    AnalyzerCard(title: "Bubble Sort :  ", sortValue: bubble ),
                    AnalyzerCard(title: "Heap Sort :  ", sortValue: heap,),
                    AnalyzerCard(title: "Selection Sort :  ", sortValue: selection,),
                    AnalyzerCard(title: "Insertion Sort :  " , sortValue: insertion,),
                    AnalyzerCard(title: "Merge Sort :  ", sortValue: merge,),
                  ],
                )),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (ctx) => BlocProvider(
                      create: (context) => SortingVisualizerBloc(),
                      child: SortingVisualizerPage())));
            },
            child: const Icon(Icons.remove_red_eye),
          ));
    }));
  }
}
