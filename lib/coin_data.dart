import 'dart:convert';

import 'package:http/http.dart' as http;

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
  String selectedCurrency;
  String cryptoCurrency;
  final String _apiKey = '4C67FE9A-9FCA-4C3D-9E08-15526A979FF6';
  CoinData({required this.selectedCurrency, required this.cryptoCurrency});

  Future<dynamic> getData() async {
    String baseURL =
        'https://rest.coinapi.io/v1/exchangerate/$cryptoCurrency/$selectedCurrency?apikey=$_apiKey';
    var url = Uri.parse(baseURL);
    http.Response response = await http.get(url);
    if (response.statusCode == 200) {
      var data = response.body;
      return jsonDecode(data);
    }

    return null;
  }
}
