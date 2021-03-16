class Response {
  Response.fromJson(Map<String, dynamic> json)
      : lastTransactionID = json['lastTransactionID'];

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
        unrealizedPL = json['unrealizedPL'];

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
  final String unrealizedPL;
}

class Margin {
  Margin.fromJson(Map<String, dynamic> json) : name = json['name'];

  final String name;
}
