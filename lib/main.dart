import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_food_delivery_backend/blocs/blocs.dart';
import 'package:flutter_food_delivery_backend/config/theme.dart';
import 'package:flutter_food_delivery_backend/models/category_model.dart';

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
          create: (_) => CategoryBloc()
            ..add(
              LoadCategories(categories: Category.categories),
            ),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: theme(),
        initialRoute: '/menu',
        routes: {
          '/menu': (context) => const MenuScreen(),
          // '/dash': (context) => const DashboardScreen(),
          // '/opening-hours': (context) => const OpeningHoursScreen(),
        },
      ),
    );
  }
}
