import 'package:flutter/material.dart';
import '/config/responsive.dart';

class CustomLayout extends StatelessWidget {
  const CustomLayout({
    Key? key,
    required this.title,
    required this.widgets,
  }) : super(key: key);

  final String title;
  final List<Widget> widgets;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          flex: 4,
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  const SizedBox(height: 20),
                  ...widgets,
                  const SizedBox(height: 20),
                  // Placeholder for ads.
                  Container(
                    width: double.infinity,
                    constraints: const BoxConstraints(minHeight: 75),
                    color: Theme.of(context).colorScheme.primary,
                    child: const Center(
                      child: Text('Some ads here'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        // Section on the right side of the screen. Placeholder for ads.
        Responsive.isWideDesktop(context) || Responsive.isDesktop(context)
            ? Expanded(
                flex: 1,
                child: Container(
                  margin: const EdgeInsets.only(
                    top: 20.0,
                    bottom: 20.0,
                    right: 20.0,
                  ),
                  color: Theme.of(context).colorScheme.background,
                  child: const Center(
                    child: Text('Some ads here'),
                  ),
                ),
              )
            : const SizedBox(),
      ],
    );
  }
}
