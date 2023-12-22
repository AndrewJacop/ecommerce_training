import 'package:ecommerce_training/core/controllers/Details_controller/Details_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailsCubit extends Cubit<DetailsState> {
  DetailsCubit() : super(DetailsInitState());
  static DetailsCubit get(context) => BlocProvider.of(context);
}
