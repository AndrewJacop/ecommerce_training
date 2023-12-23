import 'package:ecommerce_training/core/controllers/favourite_controller/favourite_cubit.dart';
import 'package:ecommerce_training/core/controllers/favourite_controller/favourite_states.dart';
import 'package:ecommerce_training/screens/widgets/build_favourite_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<FavouriteCubit, FavouriteState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = FavouriteCubit.get(context);
          if (cubit.favouriteModel!.favoriteProducts!.isEmpty ||
              cubit.favouriteModel == null) {
            return Scaffold(
                backgroundColor: Colors.grey[200],
                appBar: AppBar(
                  backgroundColor: Colors.grey[200],
                  title: const Text('Favorite'),
                  centerTitle: true,
                ),
                body: const Center(
                  child: Text('Favorite is Empty'),
                ));
          } else {
            return Scaffold(
                backgroundColor: Colors.grey[200],
                appBar: AppBar(
                  backgroundColor: Colors.grey[200],
                  title: const Text('Favorite'),
                  centerTitle: true,
                ),
                body: SingleChildScrollView(
                  child: Container(
                    color: Colors.transparent,
                    child: GridView.count(
                      childAspectRatio: 1 / 1.3,
                      mainAxisSpacing: 1.0,
                      crossAxisSpacing: 1.0,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      crossAxisCount: 2,
                      children: List.generate(
                          cubit.favouriteModel!.favoriteProducts!.length,
                          (index) => buildFavoriteItem(
                              cubit.favouriteModel!.favoriteProducts![index],
                              context)),
                    ),
                  ),
                ));
          }
        });
  }
}
