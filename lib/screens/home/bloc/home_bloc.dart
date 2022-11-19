import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/get.dart';

import '../../../db/trip_database.dart';
import '../../../models/trips/trip_model.dart';

part 'home_event.dart';
part 'home_state.dart';
part 'home_bloc.freezed.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState()) {
    on<Started>(started);
    on<DeleteAll>(deleteAll);
  }
  deleteAll(DeleteAll event, Emitter<HomeState> emit) async {
    await Get.defaultDialog(
      middleText: 'Do you want to delete them all?',
      onCancel: Get.back,
      onConfirm: () async {
        Get.back();
        await TripsDatabase.instance.deleteAll().whenComplete(() {
          Get.snackbar('Notify', 'Successfully delete',
              colorText: Colors.green);
          add(Started());
        });
      },
    );
  }

  started(Started event, Emitter<HomeState> emit) async {
    await TripsDatabase.instance
        .readAllNotes()
        .then((value) => emit(state.copyWith(trips: value)));
  }
}
