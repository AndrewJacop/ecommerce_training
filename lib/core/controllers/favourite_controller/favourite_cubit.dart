import 'package:ecommerce_training/core/controllers/favourite_controller/favourite_states.dart';
import 'package:ecommerce_training/core/managers/values.dart';
import 'package:ecommerce_training/core/network/constant.dart';
import 'package:ecommerce_training/core/network/remote/dio_helper.dart';
import 'package:ecommerce_training/models/favourites.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteCubit extends Cubit<FavouriteState> {
  FavouriteCubit() : super(FavouriteInitState());
  static FavouriteCubit get(context) => BlocProvider.of(context);

  FavoritesModel? favouriteModel;

  void getFavorite() {
    DioHelperStore.getData(url: ApiConstants.favoriteApi, data: {
      'nationalId': nationalId,
    }).then((value) {
      favouriteModel = FavoritesModel.fromJson(value.data);

      /// print(favoriteModel!.favoriteProducts!.length);
      // print(favoriteModel!.favoriteProducts![0].name);
      emit(FavouriteGetSuccess());
    }).catchError((error) {
      /// print(error.toString());
      emit(FavouriteGetError());
    });
  }

  void addFavorite(String? id) {
    DioHelperStore.postData(
        url: ApiConstants.favoriteApi,
        data: {"nationalId": nationalId, "productId": id}).then((value) {
      /// print('Added');
      emit(FavouriteAddSuccess());
      getFavorite();
    }).catchError((error) {
      /// print(error.toString());
      emit(FavouriteAddError());
    });
  }

  void deleteFavorite(String? id) {
    DioHelperStore.delData(url: ApiConstants.favoriteApi, data: {
      "nationalId": nationalId,
      "productId": id,
    }).then((value) {
      /// print('Deleted');
      emit(FavouriteDeleteSuccess());
      getFavorite();
    }).catchError((error) {
      /// print(error.toString());
      emit(FavouriteDeleteError());
    });
  }
}
