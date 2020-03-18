import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:blocpattern/src/user/ui/screens/RegisterUserView.dart';
import 'package:blocpattern/src/user/ui/screens/DetailUserView.dart';
import 'package:blocpattern/src/user/bloc/UserBloc.dart';


void main() => runApp( new MyApp() );

class MyApp extends StatelessWidget {

  @override
  Widget build( BuildContext context ) {
    return BlocProvider(
      bloc: UserBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Sample Bloc Pattern',
        initialRoute: '/register',
        routes: <String, WidgetBuilder>{
          '/register' : ( context ) => RegisterUserView(),
          '/detail'   : ( context ) => DetailUserView()
        }
      )
    );
  }
}