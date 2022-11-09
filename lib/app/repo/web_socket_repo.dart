import 'dart:async';
import 'dart:convert';

import 'package:crypto_app/app/models/coin_base_request.dart';
import 'package:crypto_app/app/models/coin_base_response.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

abstract class WebSocketRepo {
  Stream<CoinbaseResponseModel> get btcStream;
  Stream<CoinbaseResponseModel> get ethStream;
  void send(CoinbaseRequestModel message);
  void close();
}

/*class WebSocketRepoImpl implements WebSocketRepo {
  final WebSocketChannel _channel =
      WebSocketChannel.connect(Uri.parse('wss://ws-feed.pro.coinbase.com'));

  @override
  Stream<CoinbaseResponseModel> get btcStream {
    _channel.sink.add(jsonEncode({
      "type": 'subscribe',
      "product_ids": ['BTC-USD', 'ETH-USD'],
      "channels": ['ticker']
    }));
    return _channel.stream.map((event) {
      return CoinbaseResponseModel.fromJson(jsonDecode(event));
    });
  }

  @override
  void send(CoinbaseRequestModel message) {
    _channel.sink.add(jsonEncode(message));
  }

  @override
  void close() {
    _channel.sink.close();
  }
}*/

final webSocketRepoProvider = Provider<WebSocketRepo>((ref) {
  final WebSocketChannel channel =
      WebSocketChannel.connect(Uri.parse('wss://ws-feed.pro.coinbase.com'));
  return WebSocketRepoImpl(channel: channel);
});

class WebSocketRepoImpl implements WebSocketRepo {
  final WebSocketChannel channel;
  WebSocketRepoImpl({required this.channel});

  static const String _btc = 'BTC-USD';
  static const String _eth = 'ETH-USD';

  /*@override
  Stream<CoinbaseResponseModel> get events {
    return _controller.stream;
  }

  @override
  void send(CoinbaseRequestModel message) {
    _controller.sink.add(message);
  }

  @override
  void close() {
    _controller.close();
  }

  final _controller = StreamController<CoinbaseResponseModel>();

  WebSocketChannel? _channel;

  void _init() {
    _channel = IOWebSocketChannel.connect(url);
    _channel!.stream.listen((event) {
      final response = CoinbaseResponseModel.fromJson(jsonDecode(event));
      _controller.sink.add(response);
    });
  }

  void _dispose() {
    _channel!.sink.close();
  }

  void _onData(dynamic event) {
    final response = CoinbaseResponseModel.fromJson(jsonDecode(event));
    _controller.sink.add(response);
  }

  void _onDone() {
    _controller.close();
  }

  void _onError(Object error) {
    _controller.addError(error);
  }*/

  @override
  void close() {
    channel.sink.close();
  }

  @override
  Stream<CoinbaseResponseModel> get btcStream => channel.stream.map((event) {
        return CoinbaseResponseModel.fromJson(jsonDecode(event));
      }).skipWhile((element) => element.productId != _btc);

  @override
  void send(CoinbaseRequestModel message) {
    channel.sink.add(jsonEncode(message));
  }

  @override
  Stream<CoinbaseResponseModel> get ethStream => channel.stream.map((event) {
        return CoinbaseResponseModel.fromJson(jsonDecode(event));
      }).skipWhile((element) => element.productId == _eth);
}
