import 'dart:convert';

UserUserDb userUserDbFromJson(String str) => UserUserDb.fromJson(json.decode(str));

String userUserDbToJson(UserUserDb data) => json.encode(data.toJson());

class UserUserDb {
    final int id;
    final String username;
    final String name;
    final String lastname;
    final String phone;
    final String password;
    final String email;
    final List<Patient> patients;

    UserUserDb({
        required this.id,
        required this.username,
        required this.name,
        required this.lastname,
        required this.phone,
        required this.password,
        required this.email,
        required this.patients,
    });

    factory UserUserDb.fromJson(Map<String, dynamic> json) => UserUserDb(
        id: json["id"],
        username: json["username"],
        name: json["name"],
        lastname: json["lastname"],
        phone: json["phone"],
        password: json["password"],
        email: json["email"],
        patients: List<Patient>.from(json["patients"].map((x) => Patient.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "name": name,
        "lastname": lastname,
        "phone": phone,
        "password": password,
        "email": email,
        "patients": List<dynamic>.from(patients.map((x) => x.toJson())),
    };
}

class Patient {
    final int id;
    final String name;
    final String address;
    final String date;
    final String phone;
    final double weight;
    final double height;

    Patient({
        required this.id,
        required this.name,
        required this.address,
        required this.date,
        required this.phone,
        required this.weight,
        required this.height,
    });

    factory Patient.fromJson(Map<String, dynamic> json) => Patient(
        id: json["id"],
        name: json["name"],
        address: json["address"],
        date: json["date"],
        phone: json["phone"],
        weight: json["weight"],
        height: json["height"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "address": address,
        "date": date,
        "phone": phone,
        "weight": weight,
        "height": height,
    };
}
