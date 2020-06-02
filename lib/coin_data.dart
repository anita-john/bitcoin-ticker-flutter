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

const coinAPIURL ='https://rest.coinapi.io/v1/exhangerare';
const apiKey = '7FDF978D-4457-4D0D-986F-F0A44A79FD32';

class CoinData {
  Future getCoinData() async {
    String requestURL = '$coinAPIURL/BTC,CAD?apikey=$apiKey';
    http.Response response = await http.get(requestURL);

    if (response.statusCode == 200){
      var decodedData = jsonDecode(response.body);
      var lastPrice = decodedData['Rate'];
      return lastPrice;
    }
    else {
      print(response.statusCode);
      throw 'Issue with getting data';
    }


  }
}