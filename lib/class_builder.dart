

import 'package:atta_mobile_app/src/screens/event_screen.dart';
import 'package:atta_mobile_app/src/screens/news_screen.dart';
import 'package:atta_mobile_app/src/widgets/layout.dart';

typedef T Constructor<T>();

final Map<String, Constructor<Object>> _constructors = <String, Constructor<Object>>{};

void register<T>(Constructor<T> constructor) {
  _constructors[T.toString()] = constructor;
}

class ClassBuilder {
  static void registerClasses() {
    register<LayoutScreen>(() => LayoutScreen());
    register<EventScreen>(() => EventScreen());
    register<NewsScreen>(() => NewsScreen());
  }

  static dynamic fromString(String type) {
    return _constructors[type]();
  }
}
