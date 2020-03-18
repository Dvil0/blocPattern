import 'package:blocpattern/src/user/model/UserDTO.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:blocpattern/src/user/bloc/UserBloc.dart';

class DetailUserView extends StatefulWidget {

  @override
  createState() => DetailUserState();
  
}

class DetailUserState extends State<DetailUserView> {

  UserBloc _userBloc;

  @override
  Widget build( BuildContext context ) {

    _userBloc = BlocProvider.of<UserBloc>( context );

    return Scaffold(
      body: Center(
        child: Padding(
          padding: EdgeInsets.all( 30.0 ),
          child: StreamBuilder(
              stream: _userBloc.outputStream,
              initialData: _userBloc.currentUser,
              builder: ( BuildContext context, AsyncSnapshot<UserDTO> snapshot ) {

                Widget widget;

                if( snapshot.hasData ){

                  widget = Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Usuario',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold
                        )
                      ),
                      // Text( 'Email: ${userBloc.currentUser.getEmail}' ),
                      // Text( 'Nombre: ${userBloc.currentUser.getName}' ),
                      // Text( 'Apellido: ${userBloc.currentUser.getLastName}' ),
                      Text( 'Email: ${snapshot.data.getEmail}' ),
                      Text( 'Nombre: ${snapshot.data.getName}' ),
                      Text( 'Apellido: ${snapshot.data.getLastName}' ),
                    ]
                  );
                }
                else {
                  widget = Center( child: Text( 'Empty Stream' ) );
                }
                return widget;
              }
            )
          )
        )
      );
  }
}

