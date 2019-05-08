import 'package:atta_mobile_app/src/data/models/EventModel.dart';
import 'package:atta_mobile_app/src/data/models/EventsAttendes.dart';
import 'package:atta_mobile_app/src/data/repository/Repository.dart';

abstract class EventRepository extends Repository {
  Future<List<EventModel>> getAllEvent();
}