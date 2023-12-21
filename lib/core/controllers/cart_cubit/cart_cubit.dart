import 'package:ecommerce_training/core/controllers/cart_cubit/cart_states.dart';
import 'package:ecommerce_training/core/managers/values.dart';
import 'package:ecommerce_training/core/network/constant.dart';
import 'package:ecommerce_training/core/network/remote/dio_helper.dart';
import 'package:ecommerce_training/models/cart_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitState());
  static CartCubit get(context) => BlocProvider.of(context);

  CartModel? cartModel;
  void getCart() {
    DioHelperStore.getData(url: ApiConstants.getCartApi, data: {
      "nationalId": nationalId,
    }).then((value) {
      cartModel = CartModel.fromJson(value.data);

      /// print(cartModel!.products!.length);
      emit(GetCartSuccess());
    }).catchError((error) {
      /// print(error.toString());
      emit(GetCartError());
    });
  }

  void addToCart(productId) {
    DioHelperStore.postData(url: ApiConstants.addCartApi, data: {
      "nationalId": nationalId,
      "productId": productId,
      "quantity": "1",
    }).then((value) {
      emit(AddToCartSuccess());
      getCart();
    }).catchError((error) {
      /// print(error.toString());
      emit(AddToCartError());
    });
  }

  void deleteFromCart(productId) {
    DioHelperStore.delData(url: ApiConstants.deleteCartApi, data: {
      "nationalId": nationalId,
      "productId": productId,
    }).then((value) {
      emit(DeleteFromCartSuccess());
      getCart();
    }).catchError((error) {
      /// print(error.toString());
      emit(DeleteFromCartError());
    });
  }

  void updateQuantity(productId, quantity) {
    DioHelperStore.putData(url: ApiConstants.updateCartApi, data: {
      "nationalId": nationalId,
      "productId": productId,
      "quantity": quantity,
    }).then((value) {
      emit(UpdateCartSuccess());
      getCart();
    }).catchError((error) {
      /// print(error.toString());
      emit(UpdateCartError());
    });
  }
}
