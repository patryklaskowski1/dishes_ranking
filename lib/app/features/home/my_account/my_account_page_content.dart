import 'package:dishes_ranking/app/cubit/root_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyAccountContent extends StatelessWidget {
  const MyAccountContent({
    Key? key,
    required this.email,
  }) : super(key: key);

  final String? email;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Jesteś zalogowany jako $email',
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              context.read<RootCubit>().signOut();
            },
            child: const Text('Wyloguj'),
          ),
        ],
      ),
    );
  }
}
