import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  final int maxLines;
  final String title;
  final bool hasTitle;
  final String initialValue;
  final Function(String)? onChanged;
  final Function(bool)? onFocusChanged;

  const CustomTextFormField({
    Key? key,
    required this.maxLines,
    required this.title,
    required this.hasTitle,
    required this.initialValue,
    required this.onChanged,
    this.onFocusChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        children: [
          hasTitle
              ? SizedBox(
                  width: 75,
                  child: Text(
                    title,
                    style: Theme.of(context).textTheme.headline6,
                  ),
                )
              : const SizedBox(),
          SizedBox(width: hasTitle ? 20 : 0),
          Expanded(
            child: Focus(
              child: TextFormField(
                maxLines: maxLines,
                initialValue: initialValue,
                onChanged: onChanged,
                onEditingComplete: () {},
                style: Theme.of(context).textTheme.headline6,
                decoration: InputDecoration(
                  isDense: true,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
                  ),
                ),
              ),
              onFocusChange: onFocusChanged ?? (hasFocus) {},
            ),
          ),
        ],
      ),
    );
  }
}
