import 'dart:convert';
import 'package:http/http.dart' as http;

const apiKey = 'C6BB37FB-A012-4FDD-B12F-652C858712EB';
const baseUrl = 'https://rest.coinapi.io/v1/exchangerate';
String sampleUrl = '$baseUrl/BTC/USD?apikey=$apiKey';

const List<String> currenciesList = [
  'AUD',
  'BRL',
  'CAD',
  'CNY',
  'EUR',
  'GBP',
  'HKD',
  'IDR',
  'ILS',
  'INR',
  'JPY',
  'MXN',
  'NOK',
  'NZD',
  'PLN',
  'RON',
  'RUB',
  'SEK',
  'SGD',
  'USD',
  'ZAR'
];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  Future getCoinData(String currency) async {
    http.Response res;
    try {
      res = await http.get(Uri.parse('$baseUrl/BTC/$currency?apikey=$apiKey'));
    } catch (e) {
      return null;
    }
    if (res.statusCode == 200)
      return json.decode(res.body);
    else
      return null;
  }
}
