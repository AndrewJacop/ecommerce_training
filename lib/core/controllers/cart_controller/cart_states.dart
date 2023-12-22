abstract class CartState {}

class CartInitState extends CartState {}

class AddToCartSuccess extends CartState {}

class AddToCartError extends CartState {}

class GetCartSuccess extends CartState {}

class GetCartError extends CartState {}

class UpdateCartSuccess extends CartState {}

class UpdateCartError extends CartState {}

class DeleteFromCartSuccess extends CartState {}

class DeleteFromCartError extends CartState {}
