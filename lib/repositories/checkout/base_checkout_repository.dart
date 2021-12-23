import 'package:ecommerceapp/config/models/checkout_model.dart';
import 'package:ecommerceapp/config/models/models.dart';

abstract class BaseCheckoutRepository {
  Future<void> addCheckout(Checkout checkout);
}
