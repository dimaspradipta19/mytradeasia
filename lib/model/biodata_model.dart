class BiodataModel {
  late int? id;
  late String firstName;
  late String lastName;
  late String companyName;
  late String country;
  late String password;
  late String uid;

  BiodataModel({
    this.id,
    required this.firstName,
    required this.lastName,
    required this.companyName,
    required this.country,
    required this.password,
    required this.uid,
  });

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "firstName": firstName,
      "lastName": lastName,
      "companyName": companyName,
      "country": country,
      "password": password,
      "uid": uid,
    };
  }

  BiodataModel.fromMap(Map<String, dynamic> map) {
    id = map["id"];
    firstName = map["firstName"];
    lastName = map["lastName"];
    companyName = map["companyName"];
    country = map["country"];
    password = map["password"];
    uid = map["uid"];
  }
}
