import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_food_delivery_backend/blocs/settings/settings_bloc.dart';
import '/blocs/blocs.dart';
import '/config/theme.dart';

import 'models/models.dart';
import 'screens/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CategoryBloc()
            ..add(
              LoadCategories(categories: Category.categories),
            ),
        ),
        BlocProvider(
          create: (context) => ProductBloc(
            categoryBloc: BlocProvider.of<CategoryBloc>(context),
          )..add(
              LoadProducts(products: Product.products),
            ),
        ),
        BlocProvider(
          create: (context) => SettingsBloc()
            ..add(
              LoadSettings(
                restaurant:
                    Restaurant(openingHours: OpeningHours.openingHoursList),
              ),
            ),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: theme(),
        initialRoute: '/menu',
        routes: {
          '/menu': (context) => const MenuScreen(),
          '/settings': (context) => const SettingsScreen(),
          // '/dash': (context) => const DashboardScreen(),
        },
      ),
    );
  }
}
