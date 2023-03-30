class CartListModel {
  int? statusCode;
  List<MyCart>? myCart;
  int? numberOfItems;

  CartListModel({this.statusCode, this.myCart, this.numberOfItems});

  CartListModel.fromJson(Map<String, dynamic> json) {
    statusCode = json['status_code'];
    if (json['my_cart'] != null) {
      myCart = <MyCart>[];
      json['my_cart'].forEach((v) {
        myCart!.add(new MyCart.fromJson(v));
      });
    }
    numberOfItems = json['number_of_items'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status_code'] = statusCode;
    if (myCart != null) {
      data['my_cart'] = myCart!.map((v) => v.toJson()).toList();
    }
    data['number_of_items'] = numberOfItems;
    return data;
  }
}

class MyCart {
  int? id;
  int? user;
  int? variations;
  int? product;
  Null? cart;
  int? quantity;
  bool? isActive;

  MyCart(
      {this.id,
      this.user,
      this.variations,
      this.product,
      this.cart,
      this.quantity,
      this.isActive});

  MyCart.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    user = json['user'];
    variations = json['variations'];
    product = json['product'];
    cart = json['cart'];
    quantity = json['quantity'];
    isActive = json['is_active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user'] = user;
    data['variations'] = variations;
    data['product'] = product;
    data['cart'] = cart;
    data['quantity'] = quantity;
    data['is_active'] = isActive;
    return data;
  }
}