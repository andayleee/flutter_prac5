import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/pref_cubit.dart';

class Screen extends StatelessWidget {
  const Screen({super.key});

  static const routeName = '/screen2';
  @override
  Widget build(BuildContext context) {
    final arguments = (ModalRoute.of(context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    if (arguments['theme'].toString() == '0' &&
        context.read<PrefCubit>().state.theme == ThemeData.light()) {
      context.read<PrefCubit>().toogleTheme();
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("Страница 2"),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(100.0),
          child: Container(
            child: Column(
              children: <Widget>[
                Text(
                  arguments['txt1'].toString(),
                  style: TextStyle(fontSize: 30),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
