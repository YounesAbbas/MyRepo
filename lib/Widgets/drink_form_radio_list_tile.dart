

import '../utils/drink.dart';
import '../Widgets/digits_text_field.dart';
import 'package:flutter/material.dart';

/// A [RadioListTile] that, if selected, shows a form for creating a
/// customized caffeinated drink.
class DrinkFormRadioListTile extends StatelessWidget {
  const DrinkFormRadioListTile({
    Key? key,
    this.selectedSuggestion,
    this.onSelected,
    this.caffeineInputController,
    this.servingSizeInputController,
    this.onInputChanged,
    this.servingSizeLabelText,
    this.servingSizeSuffixText,
    this.caffeineAmountLabelText,
    this.caffeineAmountSuffixText,
    this.titleText,
  }) : super(key: key);

  final TextEditingController? caffeineInputController;
  final TextEditingController? servingSizeInputController;

  /// The currently selected drink.
  final Drink? selectedSuggestion;
  final VoidCallback? onSelected;

  /// Called if the serving size or caffeine amount input value changes.
  final VoidCallback? onInputChanged;
  final String? titleText;
  final String? servingSizeLabelText;
  final String? servingSizeSuffixText;
  final String? caffeineAmountLabelText;
  final String? caffeineAmountSuffixText;

  @override
  Widget build(BuildContext context) {
    final radio = RadioListTile<Drink?>(
      dense: true,
      groupValue: selectedSuggestion,
      // As this is not a suggested drink, the value representing it
      // is null.
      value: null,
      onChanged: (_) {
        if (onSelected != null) {
          onSelected!();
        }
      },
      title: Text(titleText!),
    );
    // If this radio is not selected, we shouldn't display the form.
    if (selectedSuggestion != null) {
      return radio;
    }
    return Column(
      children: <Widget>[
        radio,
        Padding(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
            bottom: 4,
          ),
          child: _DrinkFormRow(
            caffeineInputController: caffeineInputController!,
            servingSizeInputController: servingSizeInputController!,
            servingSizeLabelText: servingSizeLabelText!,
            servingSizeSuffixText: servingSizeSuffixText!,
            caffeineAmountLabelText: caffeineAmountLabelText!,
            caffeineAmountSuffixText: caffeineAmountSuffixText!,
            onInputChanged: onInputChanged!,
          ),
        )
      ],
    );
  }
}

/// Row containing the serving size and caffeine amount input fields.
class _DrinkFormRow extends StatelessWidget {
  const _DrinkFormRow({
    Key? key,
    this.caffeineInputController,
    this.servingSizeInputController,
    this.onInputChanged,
    this.servingSizeLabelText,
    this.servingSizeSuffixText,
    this.caffeineAmountLabelText,
    this.caffeineAmountSuffixText,
  }) : super(key: key);

  final TextEditingController? caffeineInputController;
  final TextEditingController? servingSizeInputController;
  final VoidCallback? onInputChanged;
  final String? servingSizeLabelText;
  final String? servingSizeSuffixText;
  final String? caffeineAmountLabelText;
  final String? caffeineAmountSuffixText;

  @override
  Widget build(BuildContext context) => Row(
        children: <Widget>[
          Flexible(
            flex: 3,
            child: DigitsTextField(
              controller: servingSizeInputController,
              labelText: servingSizeLabelText,
              suffixText: servingSizeSuffixText,
              onChanged: (_) {
                if (onInputChanged != null) {
                  onInputChanged!();
                }
              },
              contentPadding: const EdgeInsets.all(0),
            ),
          ),
          const Spacer(),
          Flexible(
            flex: 3,
            child: DigitsTextField(
              controller: caffeineInputController,
              labelText: caffeineAmountLabelText,
              suffixText: caffeineAmountSuffixText,
              onChanged: (_) {
                if (onInputChanged != null) {
                  onInputChanged!();
                }
              },
              contentPadding: const EdgeInsets.all(0),
            ),
          ),
        ],
      );
}
