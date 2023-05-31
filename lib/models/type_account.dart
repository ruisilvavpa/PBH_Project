enum Type {
  writter,
  user,
}

class Account {
  String _name = '';
  String _email = '';
  String _password = '';
  Type _type = Type.writter;

  String get name => _name;
  set name(value) => _name = value;

  String get email => _email;
  set email(value) => _email = value;

  String get password => _password;
  set password(value) => _password = value;

  Type get type => _type;
  set type(value) => _type = value;
}
