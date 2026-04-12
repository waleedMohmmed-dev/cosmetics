import 'package:cosmetics/network/api_service.dart';
import 'package:cosmetics/views/home/models/cart_mode.dart';

class CartRepo {
  final ApiService apiService = ApiService();

  // ADD TO CART
  Future<CartResponse> addToCart(AddToCart item) async {
    final res = await apiService.post(
      '/api/Cart/add?productId=${item.productId}&quantity=${item.quantity}',
      item.toJson(),
    );

    return CartResponse.fromJson(res);
  }

  // GET CART (⚠️ لازم تتأكد من endpoint الصحيح من backend)
  Future<dynamic> getCart() async {
    final res = await apiService.get('/api/Cart/get');
    return res;
  }
}
