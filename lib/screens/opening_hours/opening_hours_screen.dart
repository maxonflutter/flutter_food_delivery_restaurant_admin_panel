import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/blocs/blocs.dart';
import '/widgets/widgets.dart';

class OpeningHoursScreen extends StatelessWidget {
  const OpeningHoursScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const CustomDrawer(),
      body: CustomLayout(
        title: 'Opening Hours',
        widgets: [
          BlocBuilder<OpeningHoursBloc, OpeningHoursState>(
            builder: (context, state) {
              if (state is OpeningHoursLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (state is OpeningHoursLoaded) {
                return ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.openingHoursList.length,
                  itemBuilder: (BuildContext context, int index) {
                    var openingHours = state.openingHoursList[index];
                    return OpeningHoursSettings(
                      openingHours: openingHours,
                      onCheckboxChanged: (value) {
                        context.read<OpeningHoursBloc>().add(
                              UpdateOpeningHours(
                                openingHours: openingHours.copyWith(
                                    isOpen: !openingHours.isOpen),
                              ),
                            );
                      },
                      onSliderChanged: (value) {
                        context.read<OpeningHoursBloc>().add(
                              UpdateOpeningHours(
                                openingHours: openingHours.copyWith(
                                  openAt: value.start,
                                  closeAt: value.end,
                                ),
                              ),
                            );
                      },
                    );
                  },
                );
              } else {
                return const Text('Something went wrong.');
              }
            },
          ),
        ],
      ),
    );
  }
}
