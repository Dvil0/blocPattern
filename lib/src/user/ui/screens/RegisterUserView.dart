import 'package:flutter/material.dart';
import 'package:blocpattern/src/user/bloc/UserBloc.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';

class RegisterUserView extends StatelessWidget {

  @override
  Widget build( BuildContext context ) {

    final userBloc = BlocProvider.of<UserBloc>( context );
    final email = new TextEditingController();
    final name = new TextEditingController();
    final lastName = new TextEditingController();

    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all( 50.0 ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Registro',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold
                ),
              ),
              TextField(
                controller: email,
                decoration: InputDecoration(
                  labelText: 'Email'
                ),
              ),
              TextField(
                controller: name,
                decoration: InputDecoration(
                  labelText: 'Nombre'
                ),
              ),
              TextField(
                controller: lastName,
                decoration: InputDecoration(
                  labelText: 'Apellido'
                ),
              ),
              SizedBox( height: 20 ),
              RaisedButton(
                child: Text( 'Registrar' ),
                onPressed: () {
                  
                  userBloc.registerUser(
                    email.text, 
                    name.text, 
                    lastName.text
                  );
                  
                  Navigator.pushNamed( context, '/detail' );
                  
                }
              )
            ]
          )
        )
      )
    );
  }
}