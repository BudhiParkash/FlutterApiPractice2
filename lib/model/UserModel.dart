class UserModel{
  final String gender;
  final String email;
  final String phone;
  final String cell;
  final String nat;
  final UserName name;

  UserModel({
    required this.gender,
    required this.email,
    required this.phone,
    required this.cell,
    required this.nat,
    required this. name

  });


  factory UserModel.fromMap(Map<String , dynamic> e){
    final name = UserName(
        title: e['name']['title'],
        first: e['name']['first'],
        last: e['name']['last']);
    return UserModel(
        gender: e['gender'],
        email: e['email'],
        phone: e['phone'],
        cell: e['cell'],
        nat: e['nat'],
        name: name

    );
  }

  String get fullName{
    return '${name.title} ${name.first} ${name.last}';
  }

}

class UserName{
  final String title;
  final String first;
  final String last;

  UserName({
    required this.title,
    required this.first,
    required this.last});
}