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
    final List<Report2> reports;

    Patient({
        required this.id,
        required this.name,
        required this.address,
        required this.date,
        required this.phone,
        required this.weight,
        required this.height,
        required this.reports,
    });

    factory Patient.fromJson(Map<String, dynamic> json) => Patient(
        id: json["id"],
        name: json["name"],
        address: json["address"],
        date: json["date"],
        phone: json["phone"],
        weight: json["weight"],
        height: json["height"],
        reports: List<Report2>.from(json["reports"].map((x) => Report2.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "address": address,
        "date": date,
        "phone": phone,
        "weight": weight,
        "height": height,
        "reports": List<dynamic>.from(reports.map((x) => x.toJson())),
    };
}

class Report2 {
    final int id;
    final int heartRate;
    final int breathingFrequency;
    final int temperature;
    final String longitude;
    final String latitude;
    final String reportTime;

    Report2({
        required this.id,
        required this.heartRate,
        required this.breathingFrequency,
        required this.temperature,
        required this.longitude,
        required this.latitude,
        required this.reportTime,
    });

    factory Report2.fromJson(Map<String, dynamic> json) => Report2(
        id: json["id"],
        heartRate: json["heartRate"],
        breathingFrequency: json["breathingFrequency"],
        temperature: json["temperature"],
        longitude: json["longitude"],
        latitude: json["latitude"],
        reportTime: json["reportTime"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "heartRate": heartRate,
        "breathingFrequency": breathingFrequency,
        "temperature": temperature,
        "longitude": longitude,
        "latitude": latitude,
        "reportTime": reportTime,
    };
}