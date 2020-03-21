// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
    bool message;
    User user;

    UserModel({
        this.message,
        this.user,
    });

    factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        message: json["message"],
        user: User.fromJson(json["data"]),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": user.toJson(),
    };
}

class User {
    int id;
    String name;
    String phone;
    String address;
    String firebaseToken;
    dynamic forgetcode;
    String registercode;
    int activate;
    int suspensed;
    dynamic userHash;

    User({
        this.id,
        this.name,
        this.phone,
        this.address,
        this.firebaseToken,
        this.forgetcode,
        this.registercode,
        this.activate,
        this.suspensed,
        this.userHash,
    });

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        name: json["name"],
        phone: json["phone"],
        address: json["address"],
        firebaseToken: json["firebase_token"],
        forgetcode: json["forgetcode"],
        registercode: json["registercode"],
        activate: json["activate"],
        suspensed: json["suspensed"],
        userHash: json["user_hash"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "phone": phone,
        "address": address,
        "firebase_token": firebaseToken,
        "forgetcode": forgetcode,
        "registercode": registercode,
        "activate": activate,
        "suspensed": suspensed,
        "user_hash": userHash,
    };
}
