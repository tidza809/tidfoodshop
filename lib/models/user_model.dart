class UserModel {
  //final
  int id;
  String Name, User, Password;

  //Constructor ทำหน้าให้กับตัวเเปร ให้
  UserModel(this.id, this.Name, this.Password);

  UserModel.fromJSON(Map<String, dynamic> parseJSON) {
    id = int.parse(parseJSON['id']);
    Name = parseJSON['Name'];
    User = parseJSON['User'];
    Password = parseJSON['Password'];
  }
}
