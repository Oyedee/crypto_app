import 'package:crypto_app/app/views/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async {
  runApp(const ProviderScope(child: MyApp()));

  /*final channel =
      WebSocketChannel.connect(Uri.parse('wss://ws-feed.pro.coinbase.com'));

  channel.sink.add(jsonEncode({
    "type": 'subscribe',
    "product_ids": ['BTC-USD', 'ETH-USD'],
    "channels": ['ticker']
  }));

  channel.stream.listen((message) {
    log(message);
  }, onDone: () {
    log('done');
  }, onError: (error) {
    log(error);
  });

  await Future.delayed(const Duration(seconds: 5));
  channel.sink.close();*/
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      themeMode: ThemeMode.dark,
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}
