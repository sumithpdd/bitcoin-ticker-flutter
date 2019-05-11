import 'Services/networking.dart';

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
const bitCoinAverageAPIURL =
    'https://apiv2.bitcoinaverage.com/indices/global/ticker/';

class CoinData {
  Future getCoinData(String toCurrency) async {
    Map<String, String> cryptoPrices = {};
    for (String crypto in cryptoList) {
      var url = '${bitCoinAverageAPIURL + crypto + toCurrency}';
      NetworkHelper networkHelper = NetworkHelper(url);
      var tickerData = await networkHelper.getData();
      double lastPrice = tickerData['last'];
      cryptoPrices[crypto] = lastPrice.toStringAsFixed(0);
    }
    return cryptoPrices;
  }
}
