import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../db/trip_database.dart';
import '../../../models/trips/trip_model.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<Started>(started);
  }
  started(Started event, Emitter<HomeState> emit) async {
    await TripsDatabase.instance
        .readAllNotes()
        .then((value) => emit(state.copyWith(trips: value)));
  }
}
