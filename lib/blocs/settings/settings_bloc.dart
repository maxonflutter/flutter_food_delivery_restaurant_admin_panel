import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_food_delivery_backend/models/models.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(SettingsLoading()) {
    on<LoadSettings>(_onLoadSettings);
    on<UpdateSettings>(_onUpdateSettings);
    on<UpdateOpeningHours>(_onUpdateOpeningHours);
  }

  void _onLoadSettings(
    LoadSettings event,
    Emitter<SettingsState> emit,
  ) async {
    await Future<void>.delayed(const Duration(seconds: 1));
    emit(SettingsLoaded(event.restaurant));
  }

  void _onUpdateSettings(
    UpdateSettings event,
    Emitter<SettingsState> emit,
  ) {
    emit(SettingsLoaded(event.restaurant));
  }

  void _onUpdateOpeningHours(
    UpdateOpeningHours event,
    Emitter<SettingsState> emit,
  ) {
    final state = this.state;
    if (state is SettingsLoaded) {
      List<OpeningHours> openingHoursList = (state.restaurant.openingHours!.map(
        (openingHours) {
          return openingHours.id == event.openingHours.id
              ? event.openingHours
              : openingHours;
        },
      )).toList();

      emit(
        SettingsLoaded(
          state.restaurant.copyWith(openingHours: openingHoursList),
        ),
      );
    }
  }
}
