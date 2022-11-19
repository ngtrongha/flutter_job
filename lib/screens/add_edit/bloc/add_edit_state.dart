part of 'add_edit_bloc.dart';

@freezed
class AddEditState with _$AddEditState {
  const factory AddEditState({
    final TripModel? trip,
    final DateTime? date,
    @Default('Yes') final String require,
  }) = _AddEditState;
}
