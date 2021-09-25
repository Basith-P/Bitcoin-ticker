import 'dart:convert';
import 'package:http/http.dart' as http;

import '/utils/api_key.dart';
import '/utils/constants.dart';

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
  Future getCoinData(selectedCurrency) async {
    String reqUrl = '$url/BTC/$selectedCurrency?apikey=$apiKey';

    http.Response response = await http.get(Uri.parse(reqUrl));

    if (response.statusCode == 200) {
      var decodedData = jsonDecode(response.body);
      return decodedData['rate'];
    } else {
      print(response.statusCode);
      throw 'Problem with getting data';
    }
  }
}
