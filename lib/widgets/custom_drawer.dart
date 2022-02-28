import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> screens = {
      // 'Dashboard': {
      //   'routeName': '/dash',
      //   'icon': const Icon(Icons.dashboard),
      // },
      'Menu': {
        'routeName': '/menu',
        'icon': const Icon(Icons.menu_book),
      },
      'Settings': {
        'routeName': '/settings',
        'icon': const Icon(Icons.lock_clock),
      },
      'Logout': {
        'routeName': '/logout',
        'icon': const Icon(Icons.logout_outlined),
      },
    };

    return Drawer(
      child: ListView(
        children: [
          SizedBox(
            height: 65.0,
            child: DrawerHeader(
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
              ),
              child: Text(
                'Your Restaurant Name',
                style: Theme.of(context)
                    .textTheme
                    .headline2!
                    .copyWith(color: Colors.white),
              ),
            ),
          ),
          ...screens.entries.map((screen) {
            return ListTile(
              leading: screen.value['icon'],
              title: Text(screen.key),
              onTap: () {
                Navigator.pushNamed(
                  context,
                  screen.value['routeName'],
                );
              },
            );
          }).toList(),
        ],
      ),
    );
  }
}
