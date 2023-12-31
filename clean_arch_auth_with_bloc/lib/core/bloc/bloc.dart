import 'dart:async';
import 'package:clean_arch_auth_with_bloc/core/bloc/bloc_state.dart';
import 'package:clean_arch_auth_with_bloc/core/bloc/event.dart';

abstract class Bloc {
  late StreamController<BlocState> _state;
  Stream<BlocState> get state => _state.stream;

  late StreamController<Event> _event;
  Sink<Event> get event => _event.sink;

  Bloc() {
    _state = StreamController.broadcast();
    _event = StreamController.broadcast();

    _event.stream.listen(mapListenEvent);
  }

  dispatchState(BlocState state) {
    _state.add(state);
  }

  dispatchEvent(Event event) {
    _event.add(event);
  }

  mapListenEvent(Event event);
}
