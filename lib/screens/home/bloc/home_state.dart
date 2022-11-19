part of 'home_bloc.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default([]) final List<TripModel> trips,
  }) = _HomeState;
}
