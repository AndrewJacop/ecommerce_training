import 'package:ecommerce_training/core/controllers/profile_controller/profile_states.dart';
import 'package:ecommerce_training/core/managers/values.dart';
import 'package:ecommerce_training/core/network/constant.dart';
import 'package:ecommerce_training/core/network/remote/dio_helper.dart';
import 'package:ecommerce_training/models/user_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitState());
  static ProfileCubit get(context) => BlocProvider.of(context);

  UserModel? profileModel;

  void getUserData() {
    DioHelperStore.postData(
        url: ApiConstants.userProfileApi, data: {"token": token}).then((value) {
      profileModel = UserModel.fromJson(value.data);
      emit(ProfileLoadingSuccess());
    }).catchError((error) {
      /// print(error.toString());
      emit(ProfileLoadingError());
    });
  }

  void updateUserData({String? name, String? phone, String? email}) {
    DioHelperStore.putData(url: ApiConstants.userProfileApi, data: {
      "name": name,
      "email": email,
      "phone": phone,
      "gender": "male",
      "password": "12345678",
      "token": token,
    }).then((value) {
      profileModel = UserModel.fromJson(value.data);

      /// print(profileModel!.user!.name!);
      getUserData();
      emit(ProfileUpdateSuccess());
    }).catchError((error) {
      /// print(error.toString());
      emit(ProfileUpdateError());
    });
  }
}
