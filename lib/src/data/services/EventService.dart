import 'dart:convert';

import 'package:atta_mobile_app/src/TextFiledController.dart';
import 'package:atta_mobile_app/src/data/SharedPreference.dart';
import 'package:atta_mobile_app/src/data/models/EventModel.dart';
import 'package:atta_mobile_app/src/data/models/EventsAttendes.dart';
import 'package:atta_mobile_app/src/data/models/MemperInfoModel.dart';
import 'package:atta_mobile_app/src/data/repository/EventRepository.dart';
import 'package:http/http.dart' as http;

class EventService extends EventRepository {
  @override
  Future<List<EventModel>> getAllEvent() async {
    return await http.get(
      TextFieldController.apiUrl + "Event",
      headers: {'Authorization': 'bearer ${TextFieldController.token}'},
    ).then((response) {
      if (response.statusCode == 200) {
        var jsonValue = json.decode(response.body);
        return (jsonValue as List)
            .map((f) => new EventModel.fromJson(f))
            .toList();
      } else
        return List<EventModel>();
    });
  }

  Future<List<EventModel>> getFavoritEvents() async {
    MemperInfoModel memperInfoModel = await SharedPreference.getMemperInfo();
    return await http.get(
      TextFieldController.apiUrl +
          "FavoriteEvent/" +
          memperInfoModel.memberId.toString(),
      headers: {'Authorization': 'bearer ${TextFieldController.token}'},
    ).then((response) {
      if (response.statusCode == 200) {
        var jsonValue = json.decode(response.body);
        print(jsonValue);
        return (jsonValue as List)
            .map((f) => new EventModel.fromJson(f))
            .toList();
      } else
        return List<EventModel>();
    });
  }

  @override
  Future<List<EventModel>> getFavoritEvints() {
    // TODO: implement getFavoritEvints
    return null;
  }

  Future<EventsAttendes> reserveEvent(EventsAttendes model) async {
    MemperInfoModel memperInfoModel = await SharedPreference.getMemperInfo();
    model.memberId = memperInfoModel.memberId;
    EventsAttendes eventsAttendes = new EventsAttendes();
    await http
        .post(TextFieldController.apiUrl + "MemberEvent",
            headers: {'Authorization': 'bearer ${TextFieldController.token}'},
            body: jsonEncode(model))
        .then((response) {
      if (response.statusCode == 200) {
        eventsAttendes = EventsAttendes.fromJson(jsonDecode(response.body));
        return eventsAttendes;
      } else {
        return eventsAttendes;
      }
    }).catchError((error) {
      print(error);
    });
  }
}
