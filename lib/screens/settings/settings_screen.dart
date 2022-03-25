import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/config/responsive.dart';
import '/blocs/blocs.dart';
import '/widgets/widgets.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      drawer: const CustomDrawer(),
      body: CustomLayout(
        title: 'Settings',
        widgets: [
          _buildImage(),
          Responsive.isDesktop(context) || Responsive.isWideDesktop(context)
              ? IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: _buildBasicInformation(context),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: _buildRestaurantDescription(context),
                      ),
                    ],
                  ),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildBasicInformation(context),
                    const SizedBox(height: 10),
                    _buildRestaurantDescription(context),
                  ],
                ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Text(
              'Opening Hours',
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
          _buildOpeningHours(),
        ],
      ),
    );
  }

  BlocBuilder<SettingsBloc, SettingsState> _buildOpeningHours() {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        if (state is SettingsLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is SettingsLoaded) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: state.restaurant.openingHours!.length,
            itemBuilder: (BuildContext context, int index) {
              var openingHours = state.restaurant.openingHours![index];
              return OpeningHoursSettings(
                openingHours: openingHours,
                onCheckboxChanged: (value) {
                  context.read<SettingsBloc>().add(
                        UpdateOpeningHours(
                          openingHours: openingHours.copyWith(
                              isOpen: !openingHours.isOpen),
                        ),
                      );
                },
                onSliderChanged: (value) {
                  context.read<SettingsBloc>().add(
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
    );
  }

  BlocBuilder<SettingsBloc, SettingsState> _buildImage() {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        if (state is SettingsLoading) {
          return const SizedBox();
        }
        if (state is SettingsLoaded) {
          // https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1470&q=80
          return (state.restaurant.imageUrl != null)
              ? Container(
                  height: 200,
                  width: double.infinity,
                  margin: const EdgeInsets.only(bottom: 20),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(state.restaurant.imageUrl!),
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              : const SizedBox();
        } else {
          return const Text('Something went wrong.');
        }
      },
    );
  }

  Container _buildRestaurantDescription(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      color: Theme.of(context).colorScheme.background,
      child: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, state) {
          if (state is SettingsLoading) {
            return Center(
              child: CircularProgressIndicator(
                  color: Theme.of(context).colorScheme.primary),
            );
          }
          if (state is SettingsLoaded) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Restaurant Description',
                  style: Theme.of(context).textTheme.headline4,
                ),
                const SizedBox(height: 20),
                CustomTextFormField(
                  maxLines: 5,
                  title: 'Description',
                  hasTitle: false,
                  initialValue: (state.restaurant.description != null)
                      ? state.restaurant.description!
                      : '',
                  onChanged: (value) {
                    context.read<SettingsBloc>().add(
                          UpdateSettings(
                            restaurant:
                                state.restaurant.copyWith(description: value),
                          ),
                        );
                  },
                  onFocusChanged: (hasFocus) {
                    context.read<SettingsBloc>().add(
                          UpdateSettings(
                            isUpdateComplete: true,
                            restaurant: state.restaurant,
                          ),
                        );
                  },
                ),
              ],
            );
          } else {
            return const Text('Something went wrong.');
          }
        },
      ),
    );
  }

  Container _buildBasicInformation(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      color: Theme.of(context).colorScheme.background,
      child: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, state) {
          if (state is SettingsLoading) {
            return Center(
              child: CircularProgressIndicator(
                  color: Theme.of(context).colorScheme.primary),
            );
          }
          if (state is SettingsLoaded) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Basic Information',
                  style: Theme.of(context).textTheme.headline4,
                ),
                const SizedBox(height: 20),
                CustomTextFormField(
                  maxLines: 1,
                  title: 'Name',
                  hasTitle: true,
                  initialValue: (state.restaurant.name != null)
                      ? state.restaurant.name!
                      : '',
                  onChanged: (value) {
                    context.read<SettingsBloc>().add(
                          UpdateSettings(
                            restaurant: state.restaurant.copyWith(name: value),
                          ),
                        );
                  },
                  onFocusChanged: (hasFocus) {
                    context.read<SettingsBloc>().add(
                          UpdateSettings(
                            isUpdateComplete: true,
                            restaurant: state.restaurant,
                          ),
                        );
                  },
                ),
                CustomTextFormField(
                  maxLines: 1,
                  title: 'Image',
                  hasTitle: true,
                  initialValue: (state.restaurant.imageUrl != null)
                      ? state.restaurant.imageUrl!
                      : '',
                  onChanged: (value) {
                    context.read<SettingsBloc>().add(
                          UpdateSettings(
                            restaurant:
                                state.restaurant.copyWith(imageUrl: value),
                          ),
                        );
                  },
                  onFocusChanged: (hasFocus) {
                    context.read<SettingsBloc>().add(
                          UpdateSettings(
                            isUpdateComplete: true,
                            restaurant: state.restaurant,
                          ),
                        );
                  },
                ),
                CustomTextFormField(
                  maxLines: 1,
                  title: 'Tag',
                  hasTitle: true,
                  initialValue: (state.restaurant.tags != null)
                      ? state.restaurant.tags!.join(', ')
                      : '',
                  onChanged: (value) {
                    context.read<SettingsBloc>().add(
                          UpdateSettings(
                            restaurant: state.restaurant
                                .copyWith(tags: value.split(', ')),
                          ),
                        );
                  },
                  onFocusChanged: (hasFocus) {
                    context.read<SettingsBloc>().add(
                          UpdateSettings(
                            isUpdateComplete: true,
                            restaurant: state.restaurant,
                          ),
                        );
                  },
                ),
              ],
            );
          } else {
            return const Text('Something went wrong.');
          }
        },
      ),
    );
  }
}


//  Padding(
//             padding: const EdgeInsets.symmetric(vertical: 20.0),
//             child: Text(
//               'Opening Hours',
//               style: Theme.of(context).textTheme.headline4,
//             ),
//           ),
//           BlocBuilder<OpeningHoursBloc, OpeningHoursState>(
//             builder: (context, state) {
//               if (state is OpeningHoursLoading) {
//                 return const Center(
//                   child: CircularProgressIndicator(),
//                 );
//               }
//               if (state is OpeningHoursLoaded) {
//                 return ListView.builder(
//                   shrinkWrap: true,
//                   itemCount: state.openingHoursList.length,
//                   itemBuilder: (BuildContext context, int index) {
//                     var openingHours = state.openingHoursList[index];
//                     return OpeningHoursSettings(
//                       openingHours: openingHours,
//                       onCheckboxChanged: (value) {
//                         context.read<OpeningHoursBloc>().add(
//                               UpdateOpeningHours(
//                                 openingHours: openingHours.copyWith(
//                                     isOpen: !openingHours.isOpen),
//                               ),
//                             );
//                       },
//                       onSliderChanged: (value) {
//                         context.read<OpeningHoursBloc>().add(
//                               UpdateOpeningHours(
//                                 openingHours: openingHours.copyWith(
//                                   openAt: value.start,
//                                   closeAt: value.end,
//                                 ),
//                               ),
//                             );
//                       },
//                     );
//                   },
//                 );
//               } else {
//                 return const Text('Something went wrong.');
//               }
//             },
//           ),