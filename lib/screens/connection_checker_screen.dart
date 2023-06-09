import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_internet_connectivity_result/services/internet_checking_service.dart';

class ConnectionCheckerScreen extends StatefulWidget {
  const ConnectionCheckerScreen({Key? key}) : super(key: key);
  @override
  State<ConnectionCheckerScreen> createState() => _ConnectionCheckerScreenState();
}
class _ConnectionCheckerScreenState extends State<ConnectionCheckerScreen> {
  Map _source = {ConnectivityResult.none: false};
  final NetworkConnectivity _networkConnectivity = NetworkConnectivity.instance;
  String string = '';

  @override
  void initState() {
    super.initState();
    _networkConnectivity.initialise();
    _networkConnectivity.myStream.listen((source) {
      _source = source;

      if (kDebugMode) {
        print('source $_source');
      }

      // 1.
      switch (_source.keys.toList()[0]) {
        case ConnectivityResult.mobile: string = _source.values.toList()[0] ? 'Yana onlayndasiz' : 'Internet aloqangiz yaxshi emas'; break;
        case ConnectivityResult.wifi: string = _source.values.toList()[0] ? 'Yana onlayndasiz' : 'Internet aloqangiz yaxshi emas'; break;
        case ConnectivityResult.none:
        default: string = "Internet aloqangiz yaxshi emas";
      }

      // 2.
      setState(() {});

      // 3.
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            string,
            style: const TextStyle(fontSize: 30),
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color(0xff6ae792),
      ),
      body: Center(
          child: Text(
            string,
            style: const TextStyle(fontSize: 54),
          )),
    );
  }

  @override
  void dispose() {
    _networkConnectivity.disposeStream();
    super.dispose();
  }

}