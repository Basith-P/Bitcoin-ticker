import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '/widgets/crypto_card.dart';
import '/data/coin_data.dart';

class PriceScreen extends StatefulWidget {
  const PriceScreen({Key? key}) : super(key: key);

  @override
  _PriceScreenState createState() => _PriceScreenState();
}

class _PriceScreenState extends State<PriceScreen> {
  String selectedCurrency = 'USD';

  Widget getAndroidDropdown() {
    List<DropdownMenuItem<String>> dropdownItems = [];

    for (var currency in currenciesList) {
      var newItem = DropdownMenuItem(
        alignment: AlignmentDirectional.center,
        child: Text(currency),
        value: currency,
      );

      dropdownItems.add(newItem);
    }

    return DropdownButton<String>(
      value: selectedCurrency,
      items: dropdownItems,
      onChanged: (value) {
        setState(() {
          selectedCurrency = value!;
          getData();
        });
      },
    );
  }

  Widget getIosPicker() {
    List<Text> pickerItems = [];
    for (var item in currenciesList) {
      pickerItems.add(Text(item));
    }

    return CupertinoPicker(
      itemExtent: 32,
      onSelectedItemChanged: (index) {},
      children: pickerItems,
    );
  }

  Map<String, String> coinValues = {};
  bool isWaiting = false;

  void getData() async {
    isWaiting = true;
    try {
      var data = await CoinData().getCoinData(selectedCurrency);
      isWaiting = false;
      setState(() {
        coinValues = data;
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('🤑 Coin Ticker'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          CryptoCard(
            cruptoCurrency: 'BTC',
            value: isWaiting ? '?' : coinValues['BTC']!,
            selectedCurrency: selectedCurrency,
          ),
          CryptoCard(
            cruptoCurrency: 'ETH',
            value: isWaiting ? '?' : coinValues['ETH']!,
            selectedCurrency: selectedCurrency,
          ),
          CryptoCard(
            cruptoCurrency: 'LTC',
            value: isWaiting ? '?' : coinValues['LTC']!,
            selectedCurrency: selectedCurrency,
          ),
          Container(
            height: 150.0,
            alignment: Alignment.center,
            padding: const EdgeInsets.only(bottom: 30.0),
            color: Colors.teal,
            child: getAndroidDropdown(),
          ),
        ],
      ),
    );
  }
}
