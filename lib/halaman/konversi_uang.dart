import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(Konversi());
}


class CurrencyModel extends ChangeNotifier {
  double _amount = 0;
  String _selectedCurrency = 'Rupiah';

  double get amount => _amount;
  String get selectedCurrency => _selectedCurrency;

  set amount(double value) {
    _amount = value;
    notifyListeners();
  }

  set selectedCurrency(String value) {
    _selectedCurrency = value;
    notifyListeners();
  }
}

class Konversi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Currency Converter',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: ChangeNotifierProvider(
        create: (context) => CurrencyModel(),
        child: CurrencyConverter(),
      ),
    );
  }
}

class CurrencyConverter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[100],
      appBar: AppBar(
        title: Text('Currency Converter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CurrencyTextField(),
            SizedBox(height: 20),
            CurrencyDropdown(),
            SizedBox(height: 20),
            ConvertedAmount(),
          ],
        ),
      ),
    );
  }
}

class CurrencyTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var currencyModel = Provider.of<CurrencyModel>(context);

    return TextField(
      keyboardType: TextInputType.number,
      decoration: InputDecoration(labelText: 'Enter Amount'),
      onChanged: (value) {
        currencyModel.amount = double.tryParse(value) ?? 0;
      },
    );
  }
}

class CurrencyDropdown extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var currencyModel = Provider.of<CurrencyModel>(context);

    return DropdownButton<String>(
      value: currencyModel.selectedCurrency,
      items: ['Rupiah', 'Dolar', 'Peso'].map((String currency) {
        return DropdownMenuItem<String>(
          value: currency,
          child: Text(currency),
        );
      }).toList(),
      onChanged: (String? newValue) { // Perubahan disini
        if (newValue != null) {
          currencyModel.selectedCurrency = newValue;
        }
      },
    );
  }
}

class ConvertedAmount extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var currencyModel = Provider.of<CurrencyModel>(context);
    double convertedAmount = currencyModel.amount * _getExchangeRate(currencyModel.selectedCurrency);

    return Column(
      children: [
        Text(
          'Converted Amount:',
          style: TextStyle(fontSize: 18),
        ),
        SizedBox(height: 8),
        Text(
          '${convertedAmount.toStringAsFixed(2)} ${currencyModel.selectedCurrency}',
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  double _getExchangeRate(String selectedCurrency) {
    switch (selectedCurrency) {
      case 'Dolar':
        return 0.000071;
      case 'Peso':
        return 0.0015;
      default:
        return 1.0;
    }
  }
}