class User {
  String? name;
  String? email;
  String? password;

  User({this.name, this.email, this.password});

  factory User.fromJson(Map<String, dynamic> parsedJson) {
    return User(
        name: parsedJson['name'] ?? "",
        email: parsedJson['email'] ?? "",
        password: parsedJson['password'] ?? "");
  }

  Map<String, dynamic> toJson() {
    return {"name": name, "email": email, "password": password};
  }
}