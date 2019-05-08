  // To parse this JSON data, do
//
//     final token = tokenFromJson(jsonString);

import 'dart:convert';

Token tokenFromJson(String str) {
    final jsonData = json.decode(str);
    return Token.fromJson(jsonData);
}

String tokenToJson(Token data) {
    final dyn = data.toJson();
    return json.encode(dyn);
}

class Token {
    String token;
    String expiration;

    Token({
        this.token,
        this.expiration,
    });

    factory Token.fromJson(Map<String, dynamic> json) => new Token(
        token: json["token"],
        expiration: json["expiration"],
    );

    Map<String, dynamic> toJson() => {
        "token": token,
        "expiration": expiration,
    };
}
