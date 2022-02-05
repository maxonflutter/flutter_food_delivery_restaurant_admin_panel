part of 'opening_hours_bloc.dart';

abstract class OpeningHoursEvent extends Equatable {
  const OpeningHoursEvent();

  @override
  List<Object> get props => [];
}

class LoadOpeningHours extends OpeningHoursEvent {
  final List<OpeningHours> openingHoursList;

  const LoadOpeningHours({required this.openingHoursList});

  @override
  List<Object> get props => [openingHoursList];
}

class UpdateOpeningHours extends OpeningHoursEvent {
  final OpeningHours openingHours;

  const UpdateOpeningHours({required this.openingHours});

  @override
  List<Object> get props => [openingHours];
}
