// To parse this JSON data, do
//
//     final eventsAttendes = eventsAttendesFromJson(jsonString);

import 'dart:convert';

List<EventsAttendes> eventsAttendesFromJson(String str) {
  final jsonData = json.decode(str);
  return new List<EventsAttendes>.from(
      jsonData.map((x) => EventsAttendes.fromJson(x)));
}

String eventsAttendesToJson(List<EventsAttendes> data) {
  final dyn = new List<dynamic>.from(data.map((x) => x.toJson()));
  return json.encode(dyn);
}

class EventsAttendes {
  int memberEventId;
  String eventVerificationCode;
  bool isVerified;
  int memberId;
  int eventId;
  int noOfAttendees;
  int verfieidBy;
  bool isDeleted;

  EventsAttendes({
    this.memberEventId,
    this.eventVerificationCode,
    this.isVerified,
    this.memberId,
    this.eventId,
    this.noOfAttendees,
    this.verfieidBy,
    this.isDeleted,
  });

  factory EventsAttendes.fromJson(Map<String, dynamic> json) =>
      new EventsAttendes(
        memberEventId:
            json["memberEventId"] == null ? null : json["memberEventId"],
        eventVerificationCode: json["eventVerificationCode"] == null
            ? null
            : json["eventVerificationCode"],
        isVerified: json["isVerified"] == null ? null : json["isVerified"],
        memberId: json["memberId"] == null ? null : json["memberId"],
        eventId: json["eventId"] == null ? null : json["eventId"],
        noOfAttendees:
            json["noOfAttendees"] == null ? null : json["noOfAttendees"],
        verfieidBy: json["verfieidBy"] == null ? null : json["verfieidBy"],
        isDeleted: json["isDeleted"] == null ? null : json["isDeleted"],
      );

  Map<String, dynamic> toJson() => {
        "memberEventId": memberEventId == null ? null : memberEventId,
        "eventVerificationCode":
            eventVerificationCode == null ? null : eventVerificationCode,
        "isVerified": isVerified == null ? null : isVerified,
        "memberId": memberId == null ? null : memberId,
        "eventId": eventId == null ? null : eventId,
        "noOfAttendees": noOfAttendees == null ? null : noOfAttendees,
        "verfieidBy": verfieidBy == null ? null : verfieidBy,
        "isDeleted": isDeleted == null ? null : isDeleted,
      };
}
