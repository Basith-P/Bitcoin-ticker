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
    Map<String, String> cryptoPrices = {};

    for (var crypto in cryptoList) {
      String reqUrl = '$url/$crypto/$selectedCurrency?apikey=$apiKey';

      http.Response response = await http.get(Uri.parse(reqUrl));

      if (response.statusCode == 200) {
        var decodedData = jsonDecode(response.body);
        var lastPrice = decodedData['rate'];
        cryptoPrices[crypto] = lastPrice.toStringAsFixed(0);
      } else {
        print(response.statusCode);
        throw 'Problem with getting data';
      }
    }
    return cryptoPrices;
  }
}
