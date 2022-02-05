import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_food_delivery_backend/blocs/blocs.dart';
import 'package:flutter_food_delivery_backend/models/models.dart';

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
                    return Container(
                      height: 55,
                      width: double.infinity,
                      margin: const EdgeInsets.only(bottom: 10),
                      padding: const EdgeInsets.all(20.0),
                      color: Theme.of(context).colorScheme.background,
                      child: Row(
                        children: [
                          Checkbox(
                            value: state.openingHoursList[index].isOpen,
                            onChanged: (value) {
                              context.read<OpeningHoursBloc>().add(
                                    UpdateOpeningHours(
                                      openingHours: state
                                          .openingHoursList[index]
                                          .copyWith(
                                        isOpen: !state
                                            .openingHoursList[index].isOpen,
                                      ),
                                    ),
                                  );
                            },
                            activeColor: Theme.of(context).colorScheme.primary,
                            fillColor: MaterialStateProperty.all(
                              Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          const SizedBox(width: 10),
                          SizedBox(
                            width: 100,
                            child: Text(
                              state.openingHoursList[index].day,
                              style: Theme.of(context).textTheme.headline5,
                            ),
                          ),
                          const SizedBox(width: 10),
                          SizedBox(
                            width: 500,
                            child: RangeSlider(
                              divisions: 24,
                              values: RangeValues(
                                state.openingHoursList[index].openAt,
                                state.openingHoursList[index].closeAt,
                              ),
                              min: 0,
                              max: 24,
                              onChanged: (value) {
                                context.read<OpeningHoursBloc>().add(
                                      UpdateOpeningHours(
                                        openingHours: state
                                            .openingHoursList[index]
                                            .copyWith(
                                          openAt: value.start,
                                          closeAt: value.end,
                                        ),
                                      ),
                                    );
                              },
                            ),
                          ),
                        ],
                      ),
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
