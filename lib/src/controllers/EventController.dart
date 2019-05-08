
import 'package:atta_mobile_app/src/data/models/EventModel.dart';
import 'package:atta_mobile_app/src/data/services/EventService.dart';
import 'package:mvc_pattern/mvc_pattern.dart';

class EventController extends ControllerMVC {
  //to make single instance of class
  factory EventController() {
    if (_this == null) _this = EventController._();
    return _this;
  }
  static EventController _this;

  EventController._();
  

  static EventController get con => _this;
  EventService eventService=new EventService();
  List<EventModel> events=new List<EventModel>();
  bool isLoading=false;
  Future getAllEvent() async{
    isLoading=true;
    refresh();
    events =await eventService.getAllEvent();
    isLoading=false;
    refresh();
  }

}