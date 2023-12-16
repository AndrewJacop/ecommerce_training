import 'package:ecommerce_training/core/controllers/product_cubit/product_states.dart';
import 'package:ecommerce_training/core/network/constant.dart';
import 'package:ecommerce_training/core/network/remote/dio_helper.dart';
import 'package:ecommerce_training/models/product_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit() : super(ProductInitState());
  static ProductCubit get(context) => BlocProvider.of(context);

  ProductsModel? productsModel;

  void getHomeProducts() {
    emit(ProductLoading());
    DioHelperStore.getData(url: ApiConstants.productApi).then((value) {
      productsModel = ProductsModel.fromJson(value.data);
      emit(ProductLoadingDone());

      /// print(productsModel!.product!.length);
    }).catchError((error) {
      /// print(error.toString());
      emit(ProductLoadingError());
    });
  }
}
