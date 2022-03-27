import 'package:flutter/material.dart';
import 'package:presentation/bloc/bloc_data.dart';
import 'app_bloc.dart';
import 'app_data.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _bloc = AppBloc();
  final _navigatorKey = GlobalKey<NavigatorState>();
  final globalRootNavKey = GlobalKey<NavigatorState>();

  @override
  void initState() {
    super.initState();
    _bloc.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      navigatorKey: globalRootNavKey,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: _home(),
    );
  }

  StreamBuilder _home() => StreamBuilder<BlocData>(
        stream: _bloc.dataStream,
        builder: (context, result) {
          final blocData = result.data;
          final appData = blocData?.data;
          if (appData is AppData) {
            return _content(context, blocData, appData);
          } else {
            return Container();
          }
        },
      );

  Navigator _content(
    BuildContext context,
    BlocData? blocData,
    AppData appData,
  ) =>
      Navigator(
        key: _navigatorKey,
        onPopPage: (route, result) {
          _bloc.handleRemoveRouteSettings(route.settings);
          return route.didPop(result);
        },

        /// very important moment!!!
        pages: appData.pages.toList(),
      );
}
