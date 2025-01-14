
import 'dart:convert';

ProductModel productModelFromJson(String str) => ProductModel.fromJson(json.decode(str));

String productModelToJson(ProductModel data) => json.encode(data.toJson());

class ProductModel {
    List<Product> products;
    int total;
    int skip;
    int limit;

    ProductModel({
        required this.products,
        required this.total,
        required this.skip,
        required this.limit,
    });

    factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        products: List<Product>.from(json["products"].map((x) => Product.fromJson(x))),
        total: json["total"],
        skip: json["skip"],
        limit: json["limit"],
    );

    Map<String, dynamic> toJson() => {
        "products": List<dynamic>.from(products.map((x) => x.toJson())),
        "total": total,
        "skip": skip,
        "limit": limit,
    };
}

class Product {
    int id;
    String title;
    String description;
    String category;
    double price;
    double discountPercentage;
    double rating;
    int stock;
    List<String> tags;
    String? brand;
    String sku;
    int weight;
    Dimensions dimensions;
    String warrantyInformation;
    ShippingInformation shippingInformation;
    AvailabilityStatus availabilityStatus;
    List<Review> reviews;
    ReturnPolicy returnPolicy;
    int minimumOrderQuantity;
    Meta meta;
    List<String> images;
    String thumbnail;

    Product({
        required this.id,
        required this.title,
        required this.description,
        required this.category,
        required this.price,
        required this.discountPercentage,
        required this.rating,
        required this.stock,
        required this.tags,
        this.brand,
        required this.sku,
        required this.weight,
        required this.dimensions,
        required this.warrantyInformation,
        required this.shippingInformation,
        required this.availabilityStatus,
        required this.reviews,
        required this.returnPolicy,
        required this.minimumOrderQuantity,
        required this.meta,
        required this.images,
        required this.thumbnail,
    });

    factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["id"],
        title: json["title"],
        description: json["description"],
        category: json["category"],
        price: json["price"]?.toDouble(),
        discountPercentage: json["discountPercentage"]?.toDouble(),
        rating: json["rating"]?.toDouble(),
        stock: json["stock"],
        tags: List<String>.from(json["tags"].map((x) => x)),
        brand: json["brand"],
        sku: json["sku"],
        weight: json["weight"],
        dimensions: Dimensions.fromJson(json["dimensions"]),
        warrantyInformation: json["warrantyInformation"],
        shippingInformation: shippingInformationValues.map[json["shippingInformation"]]!,
        availabilityStatus: availabilityStatusValues.map[json["availabilityStatus"]]!,
        reviews: List<Review>.from(json["reviews"].map((x) => Review.fromJson(x))),
        returnPolicy: returnPolicyValues.map[json["returnPolicy"]]!,
        minimumOrderQuantity: json["minimumOrderQuantity"],
        meta: Meta.fromJson(json["meta"]),
        images: List<String>.from(json["images"].map((x) => x)),
        thumbnail: json["thumbnail"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
        "category": category,
        "price": price,
        "discountPercentage": discountPercentage,
        "rating": rating,
        "stock": stock,
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "brand": brand,
        "sku": sku,
        "weight": weight,
        "dimensions": dimensions.toJson(),
        "warrantyInformation": warrantyInformation,
        "shippingInformation": shippingInformationValues.reverse[shippingInformation],
        "availabilityStatus": availabilityStatusValues.reverse[availabilityStatus],
        "reviews": List<dynamic>.from(reviews.map((x) => x.toJson())),
        "returnPolicy": returnPolicyValues.reverse[returnPolicy],
        "minimumOrderQuantity": minimumOrderQuantity,
        "meta": meta.toJson(),
        "images": List<dynamic>.from(images.map((x) => x)),
        "thumbnail": thumbnail,
    };
}

enum AvailabilityStatus {
    IN_STOCK,
    LOW_STOCK,
    OUT_OF_STOCK
}

final availabilityStatusValues = EnumValues({
    "In Stock": AvailabilityStatus.IN_STOCK,
    "Low Stock": AvailabilityStatus.LOW_STOCK,
    "Out of Stock": AvailabilityStatus.OUT_OF_STOCK
});

class Dimensions {
    double width;
    double height;
    double depth;

    Dimensions({
        required this.width,
        required this.height,
        required this.depth,
    });

    factory Dimensions.fromJson(Map<String, dynamic> json) => Dimensions(
        width: json["width"]?.toDouble(),
        height: json["height"]?.toDouble(),
        depth: json["depth"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "width": width,
        "height": height,
        "depth": depth,
    };
}

class Meta {
    DateTime createdAt;
    DateTime updatedAt;
    String barcode;
    String qrCode;

    Meta({
        required this.createdAt,
        required this.updatedAt,
        required this.barcode,
        required this.qrCode,
    });

    factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        barcode: json["barcode"],
        qrCode: json["qrCode"],
    );

    Map<String, dynamic> toJson() => {
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "barcode": barcode,
        "qrCode": qrCode,
    };
}

enum ReturnPolicy {
    NO_RETURN_POLICY,
    THE_30_DAYS_RETURN_POLICY,
    THE_60_DAYS_RETURN_POLICY,
    THE_7_DAYS_RETURN_POLICY,
    THE_90_DAYS_RETURN_POLICY
}

final returnPolicyValues = EnumValues({
    "No return policy": ReturnPolicy.NO_RETURN_POLICY,
    "30 days return policy": ReturnPolicy.THE_30_DAYS_RETURN_POLICY,
    "60 days return policy": ReturnPolicy.THE_60_DAYS_RETURN_POLICY,
    "7 days return policy": ReturnPolicy.THE_7_DAYS_RETURN_POLICY,
    "90 days return policy": ReturnPolicy.THE_90_DAYS_RETURN_POLICY
});

class Review {
    int rating;
    String comment;
    DateTime date;
    String reviewerName;
    String reviewerEmail;

    Review({
        required this.rating,
        required this.comment,
        required this.date,
        required this.reviewerName,
        required this.reviewerEmail,
    });

    factory Review.fromJson(Map<String, dynamic> json) => Review(
        rating: json["rating"],
        comment: json["comment"],
        date: DateTime.parse(json["date"]),
        reviewerName: json["reviewerName"],
        reviewerEmail: json["reviewerEmail"],
    );

    Map<String, dynamic> toJson() => {
        "rating": rating,
        "comment": comment,
        "date": date.toIso8601String(),
        "reviewerName": reviewerName,
        "reviewerEmail": reviewerEmail,
    };
}

enum ShippingInformation {
    SHIPS_IN_12_BUSINESS_DAYS,
    SHIPS_IN_1_MONTH,
    SHIPS_IN_1_WEEK,
    SHIPS_IN_2_WEEKS,
    SHIPS_IN_35_BUSINESS_DAYS,
    SHIPS_OVERNIGHT
}

final shippingInformationValues = EnumValues({
    "Ships in 1-2 business days": ShippingInformation.SHIPS_IN_12_BUSINESS_DAYS,
    "Ships in 1 month": ShippingInformation.SHIPS_IN_1_MONTH,
    "Ships in 1 week": ShippingInformation.SHIPS_IN_1_WEEK,
    "Ships in 2 weeks": ShippingInformation.SHIPS_IN_2_WEEKS,
    "Ships in 3-5 business days": ShippingInformation.SHIPS_IN_35_BUSINESS_DAYS,
    "Ships overnight": ShippingInformation.SHIPS_OVERNIGHT
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}
