import 'package:flutter/material.dart';
import 'package:flutter_food_delivery_backend/blocs/blocs.dart';
import 'package:flutter_food_delivery_backend/models/models.dart';

class OpeningHoursSettings extends StatelessWidget {
  const OpeningHoursSettings({
    Key? key,
    required this.openingHours,
    required this.onCheckboxChanged,
    required this.onSliderChanged,
  }) : super(key: key);

  final OpeningHours openingHours;
  final Function(bool?)? onCheckboxChanged;
  final Function(RangeValues)? onSliderChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(20.0),
      color: Theme.of(context).colorScheme.background,
      child: Row(
        children: [
          Checkbox(
            value: openingHours.isOpen,
            onChanged: onCheckboxChanged,
            activeColor: Theme.of(context).colorScheme.primary,
            fillColor: MaterialStateProperty.all(
              Theme.of(context).colorScheme.primary,
            ),
          ),
          const SizedBox(width: 10),
          SizedBox(
            width: 100,
            child: Text(
              openingHours.day,
              style: Theme.of(context).textTheme.headline5,
            ),
          ),
          const SizedBox(width: 10),
          SizedBox(
            width: 500,
            child: RangeSlider(
              divisions: 24,
              values: RangeValues(
                openingHours.openAt,
                openingHours.closeAt,
              ),
              min: 0,
              max: 24,
              onChanged: onSliderChanged,
            ),
          ),
        ],
      ),
    );
  }
}
