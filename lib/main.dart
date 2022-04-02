import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/repositories/repositories.dart';
import '/blocs/blocs.dart';
import '/models/models.dart';
import '/screens/screens.dart';
import '/config/theme.dart';
import '/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => RestaurantRepository(),
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => CategoryBloc()
              ..add(
                LoadCategories(categories: Category.categories),
              ),
          ),
          BlocProvider(
            create: (context) => ProductBloc(
              restaurantRepository: context.read<RestaurantRepository>(),
              categoryBloc: BlocProvider.of<CategoryBloc>(context),
            ),
          ),
          BlocProvider(
            create: (context) => SettingsBloc(
              restaurantRepository: context.read<RestaurantRepository>(),
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
      ),
    );
  }
}
