import 'package:flutter/material.dart';
import 'package:flutter_prac5/cubit/pref_cubit.dart';
import 'package:flutter_prac5/page.dart';
import 'package:flutter_prac5/screen.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/pref_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => PrefCubit()),
      ],
      child: BlocBuilder<PrefCubit, PrefState>(
        builder: (context, state) {
          return MaterialApp(
            routes: {
              Screen.routeName: (context) => const Screen(),
            },
            theme: state.theme,
            home: const MyPage(title: 'Страница 1'),
          );
        },
      ),
    );
  }
}
