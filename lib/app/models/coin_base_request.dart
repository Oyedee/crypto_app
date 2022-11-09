class CoinbaseRequestModel {
  String? type;
  List<String>? productIds;
  List<String>? channels;

  CoinbaseRequestModel({this.type, this.productIds, this.channels});

  CoinbaseRequestModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    productIds = json['product_ids'].cast<String>();
    channels = json['channels'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type'] = type;
    data['product_ids'] = productIds;
    data['channels'] = channels;
    return data;
  }
}
