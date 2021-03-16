class Response {
  Response.fromJson(Map<String, dynamic> json)
      : account = Account.fromJson(json['account']),
        lastTransactionID = json['lastTransactionID'];

  final Account account;
  final String lastTransactionID;
}

class Account {
  Account.fromJson(Map<String, dynamic> json)
      : guaranteedStopLossOrderMode = json['guaranteedStopLossOrderMode'],
        hedgingEnabled = json['hedgingEnabled'],
        id = json['id'],
        createdByUserID = json['createdByUserID'],
        alias = json['alias'],
        balance = json['balance'],
        openTradeCount = json['openTradeCount'],
        pl = json['pl'],
        resettablePL = json['resettablePL'],
        guaranteedExecutionFees = json['guaranteedExecutionFees'],
        lastDividendAdjustmentTimestamps =
            List<Map<String, dynamic>>.from(json['lastDividendAdjustmentTimestamps'])
                .map((dynamic value) => LastDividendAdjustmentTimestamps.fromJson(value))
                .toList(),
        positions = List<Map<String, dynamic>>.from(json['positions'])
            .map((dynamic value) => Positions.fromJson(value))
            .toList(),
        trades = List<Map<String, dynamic>>.from(json['trades'])
            .map((dynamic value) => Trades.fromJson(value))
            .toList(),
        unrealizedPL = json['unrealizedPL'],
        margin = Margin.fromJson(json['margin']);

  final String guaranteedStopLossOrderMode;
  final bool hedgingEnabled;
  final String id;
  final num createdByUserID;
  final String alias;
  final String balance;
  final num openTradeCount;
  final String pl;
  final String resettablePL;
  final String guaranteedExecutionFees;
  final List<LastDividendAdjustmentTimestamps> lastDividendAdjustmentTimestamps;
  final List<Positions> positions;
  final List<Trades> trades;
  final String unrealizedPL;
  final Margin margin;
}

class LastDividendAdjustmentTimestamps {
  LastDividendAdjustmentTimestamps.fromJson(Map<String, dynamic> json)
      : instrument = json['instrument'],
        timestamp = json['timestamp'];

  final String instrument;
  final String timestamp;
}

class Positions {
  Positions.fromJson(Map<String, dynamic> json)
      : instrument = json['instrument'],
        long = Long.fromJson(json['long']),
        short = Short.fromJson(json['short']),
        pl = json['pl'],
        unrealizedPL = json['unrealizedPL'];

  final String instrument;
  final Long long;
  final Short short;
  final String pl;
  final String unrealizedPL;
}

class Long {
  Long.fromJson(Map<String, dynamic> json)
      : units = json['units'],
        unrealizedPL = json['unrealizedPL'];

  final String units;
  final String unrealizedPL;
}

class Short {
  Short.fromJson(Map<String, dynamic> json)
      : units = json['units'],
        unrealizedPL = json['unrealizedPL'];

  final String units;
  final String unrealizedPL;
}

class Trades {
  Trades.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        instrument = json['instrument'],
        price = json['price'],
        openTime = json['openTime'];

  final String id;
  final String instrument;
  final String price;
  final String openTime;
}

class Margin {
  Margin.fromJson(Map<String, dynamic> json) : name = json['name'];

  final String name;
}
