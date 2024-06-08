class UserUserDb {
    int id;
    String username;
    String password;
    String name;
    String lastname;
    String email;
    String phone;
    String type;
    String gender;

    UserUserDb({
        required this.id,
        required this.username,
        required this.password,
        required this.name,
        required this.lastname,
        required this.email,
        required this.phone,
        required this.type,
        required this.gender,
    });

    factory UserUserDb.fromJson(Map<String, dynamic> json) => UserUserDb(
        id: json["id"],
        username: json["username"],
        password: json["password"],
        name: json["name"],
        lastname: json["lastname"],
        email: json["email"],
        phone: json["phone"],
        type: json["type"],
        gender: json["gender"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "password": password,
        "name": name,
        "lastname": lastname,
        "email": email,
        "phone": phone,
        "type": type,
        "gender": gender,
    };
}
