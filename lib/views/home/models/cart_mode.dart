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

  Map<String, dynamic> toJson() {
    return {"productId": productId, "quantity": quantity};
  }
}

// ===== Response from API =====
class CartResponse {
  final String message;

  CartResponse({required this.message});

  factory CartResponse.fromJson(Map<String, dynamic> json) {
    return CartResponse(message: json['message'] ?? '');
  }
}

// ===== Local Cart Item (IMPORTANT) =====
class CartItem {
  final int productId;
  final String title;
  final String imageUrl;
  final num price;
  int quantity;

  CartItem({
    required this.productId,
    required this.title,
    required this.imageUrl,
    required this.price,
    required this.quantity,
  });
}

// ===== Cart Response =====
class GetCart {
  final List<CartItem> items;

  GetCart({required this.items});

  factory GetCart.fromJson(Map<String, dynamic> json) {
    return GetCart(
      items: (json['items'] as List<dynamic>? ?? [])
          .map(
            (e) => CartItem(
              productId: e['productId'] ?? 0,
              title: e['title'] ?? '',
              imageUrl: e['imageUrl'] ?? '',
              price: e['price'] ?? 0,
              quantity: e['quantity'] ?? 1,
            ),
          )
          .toList(),
    );
  }
}
