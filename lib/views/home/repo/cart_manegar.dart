import 'package:cosmetics/views/home/models/cart_mode.dart';

class CartManager {
  static final CartManager _instance = CartManager._internal();
  factory CartManager() => _instance;
  CartManager._internal();

  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  void addItem(AddToCart item) {
    final index = _items.indexWhere((e) => e.productId == item.productId);

    if (index != -1) {
      _items[index].quantity += item.quantity;
    } else {
      _items.add(
        CartItem(
          productId: item.productId,
          title: item.title,
          imageUrl: item.imageUrl,
          price: item.price,
          quantity: item.quantity,
        ),
      );
    }
  }

  void increase(int index) {
    _items[index].quantity++;
  }

  void decrease(int index) {
    if (_items[index].quantity > 1) {
      _items[index].quantity--;
    }
  }
}
