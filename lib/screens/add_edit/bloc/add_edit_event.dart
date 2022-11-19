part of 'add_edit_bloc.dart';

@freezed
class AddEditEvent with _$AddEditEvent {
  const factory AddEditEvent.started() = Started;
  const factory AddEditEvent.update() = Update;
  const factory AddEditEvent.addNew() = AddNew;
  const factory AddEditEvent.delete() = Delete;
  const factory AddEditEvent.chooseDate() = ChooseDate;
  const factory AddEditEvent.chooseRequire(final String value) = ChooseRequire;
}
