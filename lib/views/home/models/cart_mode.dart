class AddToCart {
  final int productId;
  final int quantity;
  final String title;
  final String imageUrl;
  final num price;

  AddToCart({
    required this.productId,
    required this.quantity,
    required this.title,
    required this.imageUrl,
    required this.price,
  });

  factory AddToCart.fromJson(Map<String, dynamic> json) {
    return AddToCart(
      productId: json['productId'] ?? 0,
      quantity: json['quantity'] ?? 1,
      title: json['productName'] ?? "",
      imageUrl: json['imageUrl'] ?? "",
      price: json['price'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {"productId": productId, "quantity": quantity};
  }
}

class CartResponse {
  final String message;

  CartResponse({required this.message});

  factory CartResponse.fromJson(Map<String, dynamic> json) {
    return CartResponse(message: json['message'] ?? '');
  }
}

class GetCart {
  final List<AddToCart> items;

  GetCart({required this.items});

  factory GetCart.fromJson(Map<String, dynamic> json) {
    return GetCart(
      items: (json['items'] as List<dynamic>? ?? [])
          .map((e) => AddToCart.fromJson(e))
          .toList(),
    );
  }
}
