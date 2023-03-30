class ProductList {
  int? id;
  String? productName;
  String? slug;
  String? description;
  String? mobileImage;
  String? originalImage;
  int? category;
  String? createdDate;
  String? modifiedDate;
  List<Variation>? variation;

  ProductList(
      {this.id,
      this.productName,
      this.slug,
      this.description,
      this.mobileImage,
      this.originalImage,
      this.category,
      this.createdDate,
      this.modifiedDate,
      this.variation});

  ProductList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productName = json['product_name'];
    slug = json['slug'];
    description = json['description'];
    mobileImage = json['mobile_image'];
    originalImage = json['original_image'];
    category = json['category'];
    createdDate = json['created_date'];
    modifiedDate = json['modified_date'];
    if (json['variation'] != null) {
      variation = <Variation>[];
      json['variation'].forEach((v) {
        variation!.add(Variation.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['product_name'] = productName;
    data['slug'] = slug;
    data['description'] = description;
    data['mobile_image'] = mobileImage;
    data['original_image'] = originalImage;
    data['category'] = category;
    data['created_date'] = createdDate;
    data['modified_date'] = modifiedDate;
    if (variation != null) {
      data['variation'] = variation!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Variation {
  int? id;
  int? product;
  String? variationCategory;
  String? variationValue;
  String? isbn;
  int? price;
  int? stock;
  bool? isActive;
  String? createdDate;

  Variation(
      {this.id,
      this.product,
      this.variationCategory,
      this.variationValue,
      this.isbn,
      this.price,
      this.stock,
      this.isActive,
      this.createdDate});

  Variation.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    product = json['product'];
    variationCategory = json['variation_category'];
    variationValue = json['variation_value'];
    isbn = json['isbn'];
    price = json['price'];
    stock = json['stock'];
    isActive = json['is_active'];
    createdDate = json['created_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['product'] = product;
    data['variation_category'] = variationCategory;
    data['variation_value'] = variationValue;
    data['isbn'] = isbn;
    data['price'] = price;
    data['stock'] = stock;
    data['is_active'] = isActive;
    data['created_date'] = createdDate;
    return data;
  }
}