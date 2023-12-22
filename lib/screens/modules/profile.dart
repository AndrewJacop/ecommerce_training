import 'package:ecommerce_training/core/controllers/profile_controller/profile_cubit.dart';
import 'package:ecommerce_training/core/controllers/profile_controller/profile_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ProfileCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: const Text('User Profile'),
          ),
          body: Column(
            children: [
              Container(
                color: Colors.yellow,
                height: 50,
                width: double.infinity,
                child: Row(
                  children: [
                    const Text('Name'),
                    const Spacer(),
                    Text(cubit.profileModel!.user!.name!)
                  ],
                ),
              ),
              Container(
                color: Colors.yellow,
                width: double.infinity,
                child: CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(
                    cubit.profileModel!.user!.profileImage!,
                  ),
                ),
              ),
              Container(
                color: Colors.yellow,
                height: 50,
                width: double.infinity,
                child: Row(
                  children: [
                    const Text('Email'),
                    const Spacer(),
                    Text(cubit.profileModel!.user!.email!)
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
