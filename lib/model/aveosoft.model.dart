class AveosoftModel {
  late String date;
  late double open;
  late double low;
  late double high;
  late double close;
  late int volume;

  AveosoftModel(
      {this.date = "",
      this.open = 0.0,
      this.low = 0.0,
      this.high = 0.0,
      this.close = 0.0,
      this.volume = 0});

  AveosoftModel.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    open = json.containsKey('open') ? json['open'].toDouble() : 0.0;
    low = json.containsKey('low') ? json['low'].toDouble() : 0.0;
    high = json.containsKey('high') ? json['high'].toDouble() : 0.0;
    close = json['close'].toDouble();
    volume = json.containsKey('volume') ? json['volume'] : 0;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date;
    data['open'] = open;
    data['low'] = low;
    data['high'] = high;
    data['close'] = close;
    data['volume'] = volume;
    return data;
  }
}
