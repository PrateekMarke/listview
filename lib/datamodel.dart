class LoginDataModel {
  String email;
  String password;
  LoginDataModel({required this.email, required this.password});
}
class SignDataMOdel {
  
  String first;
  String last;
  String confirmpass;
  String phone;

  SignDataMOdel({required this.confirmpass, required this.first, required this.last, required this.phone});
}
class ItemDataModel{
  final String name,Image,price,desc;
  ItemDataModel(this.name, this.Image, this.price,this.desc);
}
