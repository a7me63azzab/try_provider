// To parse this JSON data, do
//
//     final allProductsModel = allProductsModelFromJson(jsonString);

import 'dart:convert';

AllProductsModel allProductsModelFromJson(String str) => AllProductsModel.fromJson(json.decode(str));

String allProductsModelToJson(AllProductsModel data) => json.encode(data.toJson());

class AllProductsModel {
    bool message;
    List<Product> products;

    AllProductsModel({
        this.message,
        this.products,
    });

    factory AllProductsModel.fromJson(Map<String, dynamic> json) => AllProductsModel(
        message: json["message"],
        products: List<Product>.from(json["data"].map((x) => Product.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "message": message,
        "data": List<dynamic>.from(products.map((x) => x.toJson())),
    };
}

class Product {
    int id;
    ImageData image;
    String title;
    int price;
    int offer;
    int discountprice;
    int rate;
    int favorited;

    Product({
        this.id,
        this.image,
        this.title,
        this.price,
        this.offer,
        this.discountprice,
        this.rate,
        this.favorited,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        image: ImageData.fromJson(json["image"]),
        title: json["title"],
        price: json["price"],
        offer: json["offer"],
        discountprice: json["discountprice"] == null ? null : json["discountprice"],
        rate: json["rate"],
        favorited: json["favorited"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "image": image.toJson(),
        "title": title,
        "price": price,
        "offer": offer,
        "discountprice": discountprice == null ? null : discountprice,
        "rate": rate,
        "favorited": favorited,
    };
}

class ImageData {
    int id;
    int itemId;
    String image;

    ImageData({
        this.id,
        this.itemId,
        this.image,
    });

    factory ImageData.fromJson(Map<String, dynamic> json) => ImageData(
        id: json["id"],
        itemId: json["item_id"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "item_id": itemId,
        "image": image,
    };
}