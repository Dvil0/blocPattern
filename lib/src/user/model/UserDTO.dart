class UserDTO {

  String _email;
  String _name;
  String _lastName;

  String get getEmail => _email;
  String get getName => _name;
  String get getLastName => _lastName;
  set email( String text ) => _email = text;
  set name( String text ) => _name = text;
  set lastName( String text ) => _lastName = text ;
}