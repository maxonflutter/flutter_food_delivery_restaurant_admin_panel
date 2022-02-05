part of 'opening_hours_bloc.dart';

abstract class OpeningHoursState extends Equatable {
  const OpeningHoursState();

  @override
  List<Object> get props => [];
}

class OpeningHoursLoading extends OpeningHoursState {}

class OpeningHoursLoaded extends OpeningHoursState {
  final List<OpeningHours> openingHoursList;

  const OpeningHoursLoaded({required this.openingHoursList});

  @override
  List<Object> get props => [openingHoursList];
}
