class SocketMessage {
  Data? data;
  String? action;

  SocketMessage({this.data, this.action});

  SocketMessage.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
    action = json['action'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    data['action'] = this.action;
    return data;
  }
}

class Data {
  int? id;
  String? productName;
  String? weight;
  int? statusCode;

  Data({this.id, this.productName, this.weight, this.statusCode});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productName = json['product_name'];
    weight = json['weight'];
    statusCode = json['status_code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['product_name'] = this.productName;
    data['weight'] = this.weight;
    data['status_code'] = this.statusCode;
    return data;
  }
}
