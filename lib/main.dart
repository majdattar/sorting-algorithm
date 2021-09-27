import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nexttwo/screens/sorting_analyzer/bloc/sorting_analyzer_bloc.dart';
import 'package:nexttwo/screens/sorting_analyzer/sorting_analyzer_page.dart';
import 'package:nexttwo/widgets/analyzer_card.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  //runApp(const MyApp());
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_){ runApp(const MyApp());});

}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.brown,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
//961880056839213
//21

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return //SortingAnalyzerPage();
      BlocProvider(
        create: (context) => SortingAnalyzerBloc(),
        child: const SortingAnalyzerPage());
  }
}
