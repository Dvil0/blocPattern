import 'dart:async';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:blocpattern/src/user/model/UserDTO.dart';

class UserBloc extends Bloc {

  final _streamController = new StreamController<UserDTO>.broadcast();
  UserDTO currentUser;
  Stream<UserDTO> get outputStream => _streamController.stream;
  StreamSink<UserDTO> get inputStream => _streamController.sink;
  

  /// Method that register data user into app state.
  void registerUser( String email, String name, String lastName ) async{
    
    if( email.isNotEmpty && name.isNotEmpty && lastName.isNotEmpty ){
      currentUser = new UserDTO();
      currentUser.email = email;
      currentUser.name = name;
      currentUser.lastName = lastName;

      outputStream.listen( ( data ) {
        print( data.getEmail );
      });

      inputStream.add( currentUser );
      
    }
  }

  @override
  void dispose() {
    _streamController.close();
  }
}