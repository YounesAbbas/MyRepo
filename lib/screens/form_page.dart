
import '../utils/drink.dart';
import 'results_page.dart';
import '../Widgets/digits_text_field.dart';
import '../Widgets/drink_form_radio_list_tile.dart';
import '../Widgets/listItem_padding.dart';
import 'package:flutter/material.dart';


class FormPage extends StatefulWidget {
  @override
  _FormPageState createState() => _FormPageState();
}

class _FormPageState extends State<FormPage> {
  final _weightTextController = TextEditingController();
  final _servingSizeTextController = TextEditingController();
  final _caffeineTextController = TextEditingController();

  /// The currently selected [Drink] option from the radio list.
  Drink? _selectedDrinkSuggestion;

  /// Tells if the form is in a valid state. Useful for enabling/disabling the
  /// action button.
  bool get _isValidInput =>
      _weightTextController.intValue > 0 &&
          (_selectedDrinkSuggestion != null ||
              (_servingSizeTextController.intValue > 0 &&
                  _caffeineTextController.intValue > 0));

  final _drinkSuggestions = const [
    Drink(
      name: 'Drip Coffee (Cup)',
      caffeineAmount: 145,
      servingSize: 8,
    ),
    Drink(
      name: 'Espresso (Shot)',
      caffeineAmount: 77,
      servingSize: 1.5,
    ),
    Drink(
      name: 'Latte (Mug)',
      caffeineAmount: 154,
      servingSize: 16,
    ),
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text(
          'Death by Caffeine Calculator',
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            const SizedBox(
              height: 16,
            ),
            Image.asset('images/danger.png'),
            ListItemPadding(
              child: DigitsTextField(
                controller: _weightTextController,
                labelText: 'Body Weight',
                suffixText: 'pounds',
                onChanged: (_) {
                  // The setState call enables/disables the action button if
                  // the serving size or caffeine amount input changes.
                  setState(() {});
                },
              ),
            ),
            Text(
              'Choose a drink',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),

            ..._drinkSuggestions
                .map(
                  (suggestion) => RadioListTile<Drink>(
                dense: true,
                groupValue: _selectedDrinkSuggestion,
                value: suggestion,
                onChanged: _changeSelectedSuggestion,
                title: Text(suggestion.name!),
              ),
            )
                .toList(),
            // Adds the custom drink radio.
            DrinkFormRadioListTile(
              caffeineInputController: _caffeineTextController,
              servingSizeInputController: _servingSizeTextController,
              selectedSuggestion: _selectedDrinkSuggestion,
              // If the custom drink radio is selected, we set the
              // _selectedDrinkSuggestion to null, as it isn't one of
              // the suggestions.
              onSelected: () => _changeSelectedSuggestion(null),
              // Important for enabling/disabling the action button if the
              // serving size or caffeine amount input changes.
              onInputChanged: () => setState(() {}),
              titleText: 'Other',
              servingSizeLabelText: 'Serving Size',
              servingSizeSuffixText: 'fl. oz',
              caffeineAmountLabelText: 'Caffeine',
              caffeineAmountSuffixText: 'mg',
            ),
            ListItemPadding(
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: _isValidInput
                      ? () => _pushResultsPage(context)
                      : null,
                  child: Text(
                    'CALCULATE',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
  );

  void _pushResultsPage(BuildContext context) {
    final weight = _weightTextController.intValue;

    // If there's no selected suggestion, we create a new [Drink] with
    // the inputted data.
    final drink = _selectedDrinkSuggestion;
        Drink(
          caffeineAmount: _caffeineTextController.intValue,
          servingSize: _servingSizeTextController.intValue.toDouble(),
        );

    Navigator.of(context).push(
      MaterialPageRoute(
        fullscreenDialog: true,
        builder: (context) => ResultsPage(
          bodyWeight: weight,
          drink: drink,
        ),
      ),
    );
  }

  void _changeSelectedSuggestion(Drink? drink) {
    setState(() {
      _selectedDrinkSuggestion = drink;
    });
  }

  @override
  void dispose() {
    _weightTextController.dispose();
    _servingSizeTextController.dispose();
    _caffeineTextController.dispose();
    super.dispose();
  }
}



/// Parses the content of a TextEditingController as an int.
extension _NumberInput on TextEditingController {
  int get intValue {
    try {
      return int.parse(text);
    } catch (_) {
      return 0;
    }
  }
}
