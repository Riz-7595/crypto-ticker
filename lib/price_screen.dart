import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io' show Platform;
import 'coin_data.dart';

class PriceScreen extends StatefulWidget {
  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'AUD';
  List<String> rates = ['?', '?', '?'];

  Future<List<String>> getRates(String currency) async {
    CoinData coinData = CoinData();
    var rates = await coinData.getRates(currency);
    if (rates == null) return ['?', '?', '?'];
    return rates;
  }

  List<Widget> getCards() {
    List<Widget> cards = [];
    int i = 0;
    for (String coin in cryptoList) {
      cards.add(
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
                '1 $coin = ${rates[i]} $selectedCurrency',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      );
      i++;
    }
    return cards;
  }

  Widget androidDropdown() {
    List<DropdownMenuItem<String>> items = [];

    for (String currency in currenciesList) {
      DropdownMenuItem<String> item = DropdownMenuItem(
        child: Text(currency),
        value: currency,
      );
      items.add(item);
    }

    return DropdownButton(
      value: selectedCurrency,
      style: TextStyle(fontSize: 20),
      onChanged: (value) async {
        var temp = await getRates(value!);
        setState(() {
          selectedCurrency = value;
          rates = temp;
        });
      },
      items: items,
    );
  }

  Widget iOSPicker() {
    List<Text> items = [];
    for (String currency in currenciesList) {
      Text item = Text(
        currency,
        style: TextStyle(height: 1.5),
      );
      items.add(item);
    }

    return CupertinoPicker(
      itemExtent: 32,
      backgroundColor: Colors.lightBlue,
      onSelectedItemChanged: (index) {
        //TODO Apply get crypto rates
        setState(() {
          selectedCurrency = currenciesList[index];
        });
      },
      children: items,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('🤑 Crypto Ticker'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: getCards(),
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: EdgeInsets.only(bottom: 30.0),
            color: Colors.lightBlue,
            child: Platform.isIOS ? iOSPicker() : androidDropdown(),
          ),
        ],
      ),
    );
  }
}
