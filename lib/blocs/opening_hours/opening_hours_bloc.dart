import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_food_delivery_backend/models/models.dart';

part 'opening_hours_event.dart';
part 'opening_hours_state.dart';

class OpeningHoursBloc extends Bloc<OpeningHoursEvent, OpeningHoursState> {
  OpeningHoursBloc() : super(OpeningHoursLoading()) {
    on<LoadOpeningHours>(_onLoadOpeningHours);
    on<UpdateOpeningHours>(_onUpdateOpeningHours);
  }

  void _onLoadOpeningHours(
    LoadOpeningHours event,
    Emitter<OpeningHoursState> emit,
  ) async {
    await Future<void>.delayed(
      const Duration(seconds: 1),
    );
    emit(
      OpeningHoursLoaded(openingHoursList: event.openingHoursList),
    );
  }

  void _onUpdateOpeningHours(
    UpdateOpeningHours event,
    Emitter<OpeningHoursState> emit,
  ) {
    final state = this.state;
    if (state is OpeningHoursLoaded) {
      List<OpeningHours> openingHoursList = (state.openingHoursList.map(
        (openingHours) {
          return openingHours.id == event.openingHours.id
              ? event.openingHours
              : openingHours;
        },
      )).toList();

      emit(OpeningHoursLoaded(openingHoursList: openingHoursList));
    }
  }
}
