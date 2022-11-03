class CoinbaseResponseModel {
  String? type;
  int? sequence;
  String? productId;
  String? price;
  String? open24h;
  String? volume24h;
  String? low24h;
  String? high24h;
  String? volume30d;
  String? bestBid;
  String? bestBidSize;
  String? bestAsk;
  String? bestAskSize;
  String? side;
  String? time;
  int? tradeId;
  String? lastSize;

  CoinbaseResponseModel(
      {this.type,
      this.sequence,
      this.productId,
      this.price,
      this.open24h,
      this.volume24h,
      this.low24h,
      this.high24h,
      this.volume30d,
      this.bestBid,
      this.bestBidSize,
      this.bestAsk,
      this.bestAskSize,
      this.side,
      this.time,
      this.tradeId,
      this.lastSize});

  CoinbaseResponseModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    sequence = json['sequence'];
    productId = json['product_id'];
    price = json['price'];
    open24h = json['open_24h'];
    volume24h = json['volume_24h'];
    low24h = json['low_24h'];
    high24h = json['high_24h'];
    volume30d = json['volume_30d'];
    bestBid = json['best_bid'];
    bestBidSize = json['best_bid_size'];
    bestAsk = json['best_ask'];
    bestAskSize = json['best_ask_size'];
    side = json['side'];
    time = json['time'];
    tradeId = json['trade_id'];
    lastSize = json['last_size'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['sequence'] = sequence;
    data['product_id'] = productId;
    data['price'] = price;
    data['open_24h'] = open24h;
    data['volume_24h'] = volume24h;
    data['low_24h'] = low24h;
    data['high_24h'] = high24h;
    data['volume_30d'] = volume30d;
    data['best_bid'] = bestBid;
    data['best_bid_size'] = bestBidSize;
    data['best_ask'] = bestAsk;
    data['best_ask_size'] = bestAskSize;
    data['side'] = side;
    data['time'] = time;
    data['trade_id'] = tradeId;
    data['last_size'] = lastSize;
    return data;
  }
}
