import 'dart:convert';
import 'package:http/http.dart' as http;

const apiKey = 'C6BB37FB-A012-4FDD-B12F-652C858712EB';
const baseUrl = 'https://rest.coinapi.io/v1/exchangerate';
String sampleUrl = '$baseUrl/BTC/USD?apikey=$apiKey';

const List<String> currenciesList = ['AUD', 'CAD', 'EUR', 'INR', 'JPY', 'PKR', 'USD'];

const List<String> cryptoList = [
  'BTC',
  'ETH',
  'LTC',
];

class CoinData {
  Future getRates(String currency) async {
    List<String>? rates = [];
    http.Response res;
    for (String coin in cryptoList) {
      try {
        res = await http.get(Uri.parse('$baseUrl/${coin}/$currency?apikey=$apiKey'));
      } catch (e) {
        return null;
      }
      if (res.statusCode == 200) {
        double rate = json.decode(res.body)['rate'];
        rates.add(rate.toStringAsFixed(0));
      } else
        return null;
    }
    return rates;
  }
}
