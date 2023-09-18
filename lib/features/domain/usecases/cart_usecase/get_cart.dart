import 'package:mytradeasia/core/usecase/usecase.dart';
import 'package:mytradeasia/features/domain/repository/cart_repository.dart';

class GetCart implements UseCase<List, dynamic> {
  final CartRepository _cartRepository;

  GetCart(this._cartRepository);

  @override
  Future<List> call({param}) {
    return _cartRepository.getCart();
  }
}
