import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'coin_data.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'USD';

  List<DropdownMenuItem<String>> getDropdownItems() {
    List<DropdownMenuItem<String>> items = [];
    for (String currency in currenciesList) {
      DropdownMenuItem<String> item = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      items.add(item);
    }
    return items;
  }

  List<Text> getPickerItems() {
    List<Text> items = [];
    for (String currency in currenciesList) {
      Text item = Text(
        currency,
        style: TextStyle(height: 1.4),
      );
      items.add(item);
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Coin Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(18.0, 18.0, 18.0, 0),
            child: Card(
              color: Colors.lightBlueAccent,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 28.0),
                child: Text(
                  '1 BTC = ? USD',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: CupertinoPicker(
              itemExtent: 32,
              backgroundColor: Colors.lightBlue,
              onSelectedItemChanged: (index) {
                print(index);
              },
              children: getPickerItems(),
            ),
          ),
        ],
      ),
    );
  }
}

// DropdownButton(
// value: selectedCurrency,
// onChanged: (value) {
// setState(() {
// selectedCurrency = value!;
// });
// },
// items: getDropdownItems(),
// )