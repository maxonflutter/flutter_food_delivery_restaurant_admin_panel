import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_food_delivery_backend/models/models.dart';

import '../../repositories/repositories.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final RestaurantRepository _restaurantRepository;
  StreamSubscription? _restaurantSubscription;

  SettingsBloc({
    required RestaurantRepository restaurantRepository,
  })  : _restaurantRepository = restaurantRepository,
        super(SettingsLoading()) {
    on<LoadSettings>(_onLoadSettings);
    on<UpdateSettings>(_onUpdateSettings);
    on<UpdateOpeningHours>(_onUpdateOpeningHours);

    _restaurantSubscription =
        _restaurantRepository.getRestaurant().listen((restaurant) {
      print(restaurant);

      add(
        LoadSettings(restaurant: restaurant),
      );
    });
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
    if (event.isUpdateComplete) {
      _restaurantRepository.editRestaurantSettings(event.restaurant);
    }
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

      _restaurantRepository.editRestaurantOpeningHours(openingHoursList);

      emit(
        SettingsLoaded(
          state.restaurant.copyWith(openingHours: openingHoursList),
        ),
      );
    }
  }

  @override
  Future<void> close() async {
    _restaurantSubscription?.cancel();
    super.close();
  }
}
