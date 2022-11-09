import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/coin_base_request.dart';
import '../models/coin_base_response.dart';
import '../repo/web_socket_repo.dart';

final getBtcStream = StreamProvider.autoDispose<CoinbaseResponseModel>((ref) {
  final repo = ref.watch(webSocketRepoProvider);
  final message = CoinbaseRequestModel(
      type: 'subscribe', productIds: ['BTC-USD'], channels: ['ticker']);
  repo.send(message);
  return repo.btcStream;
});

final getEthStream = StreamProvider.autoDispose<CoinbaseResponseModel>((ref) {
  final repo = ref.watch(webSocketRepoProvider);
  final message = CoinbaseRequestModel(
      type: 'subscribe', productIds: ['ETH-USD'], channels: ['ticker']);
  repo.send(message);
  return repo.ethStream;
});

final webSocketNotifierProvider = StateProvider<WebSocketNotifier>((ref) {
  final repo = ref.watch(webSocketRepoProvider);
  return WebSocketNotifier(repo);
});

class WebSocketNotifier extends StateNotifier<WebSocketRepo> {
  WebSocketNotifier(WebSocketRepo state) : super(state);

  void send(CoinbaseRequestModel message) {
    state.send(message);
  }

  void close() {
    state.close();
  }

  Stream<CoinbaseResponseModel> get btcStream => state.btcStream;
  Stream<CoinbaseResponseModel> get ethStream => state.ethStream;
}
