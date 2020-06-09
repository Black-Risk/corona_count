import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import './providers/corona_provider.dart';
import './home.dart';

void main() => runApp(MyApp());

/*checkInternetConnected()async {
  var result = await (Connectivity().checkConnectivity());
  if (result == ConnectivityResult.none) {
    return AlertDialog(
      title: Text('Connection Timed Out'),
      content: const Text('Periksa kembali koneksi WiFi / Cellular Data Anda!'),
      actions: <Widget>[FlatButton(
        child: Text('OK'),
        onPressed: () => exit(1),
      )
      ],
    );
  }
}*/

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CoronaProvider(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Home(),
        title: 'Corona Count IDN',
      ),
    );
  }
}

