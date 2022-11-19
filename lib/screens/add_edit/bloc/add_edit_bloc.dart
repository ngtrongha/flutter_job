import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_job/db/trip_database.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/get.dart';

import '../../../models/trips/trip_model.dart';

part 'add_edit_event.dart';
part 'add_edit_state.dart';
part 'add_edit_bloc.freezed.dart';

class AddEditBloc extends Bloc<AddEditEvent, AddEditState> {
  final formKey = GlobalKey<FormState>();
  final trip = Get.arguments as TripModel?;
  final nameControl = TextEditingController();
  final destionationControl = TextEditingController();
  final desControl = TextEditingController();
  AddEditBloc() : super(const AddEditState()) {
    on<Started>((event, emit) {
      if (trip != null) {
        nameControl.text = trip!.name;
        destionationControl.text = trip!.destionation;
        desControl.text = trip!.des;
        emit(state.copyWith(date: trip!.date, require: trip!.require));
      }
      emit(state.copyWith(trip: trip));
    });
    on<AddNew>(addNew);
    on<Update>(update);
    on<ChooseDate>(chooseDate);
    on<Delete>(delete);
    on<ChooseRequire>(chooseRequire);
  }
  delete(Delete event, Emitter<AddEditState> emit) async {
    await TripsDatabase.instance.delete(state.trip!.id!).then((value) {
      Get.back();
      Get.snackbar('Notify', 'Successfully delete', colorText: Colors.green);
    });
  }

  chooseRequire(ChooseRequire event, Emitter<AddEditState> emit) async {
    emit(state.copyWith(require: event.value));
  }

  chooseDate(ChooseDate event, Emitter<AddEditState> emit) async {
    await showDatePicker(
            context: Get.context!,
            initialDate: state.date ?? DateTime.now(),
            firstDate: DateTime.now(),
            lastDate: DateTime.now().add(const Duration(days: 365)))
        .then((value) => emit(state.copyWith(date: value)));
  }

  addNew(AddNew event, Emitter<AddEditState> emit) async {
    await TripsDatabase.instance
        .create(TripModel(
            name: nameControl.text,
            destionation: destionationControl.text,
            date: state.date,
            require: state.require,
            des: desControl.text))
        .then((value) {
      Get.back();
      Get.snackbar('Notify', 'Successfully added new', colorText: Colors.green);
    });
  }

  update(Update event, Emitter<AddEditState> emit) async {
    await TripsDatabase.instance
        .update(state.trip!.copyWith(
            name: nameControl.text,
            destionation: destionationControl.text,
            date: state.date,
            require: state.require,
            des: desControl.text))
        .then((value) {
      Get.snackbar('Notify', 'Successfully update', colorText: Colors.green);
      emit(state.copyWith(
          trip: state.trip!.copyWith(
              name: nameControl.text,
              destionation: destionationControl.text,
              date: state.date,
              require: state.require,
              des: desControl.text)));
    });
  }
}
