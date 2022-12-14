import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_prac5/screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'cubit/pref_cubit.dart';

class MyPage extends StatefulWidget {
  const MyPage({super.key, required this.title});

  final String title;

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  String txt = "";
  int theme = 0;
  late SharedPreferences sharedPreferences;

  @override
  Future<void> initShared() async {
    sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.containsKey('txt') &&
        sharedPreferences.containsKey('theme')) {
      Navigator.pushNamed(context, Screen.routeName, arguments: {
        'txt1': sharedPreferences.getString('txt'),
        'theme': sharedPreferences.getInt('theme')
      });
    }
  }

  @override
  void initState() {
    initShared().then((value) {
      txt = sharedPreferences.getString('txt') ?? "";
      theme = sharedPreferences.getInt('theme') ?? 0;
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          backgroundColor: Colors.red,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              TextField(
                onChanged: (value) {
                  sharedPreferences.setString('txt', value);
                },
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  hintText: "Введите слово",
                ),
                style: TextStyle(fontSize: 30),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        Screen.routeName,
                        arguments: {
                          'txt1': sharedPreferences.getString('txt'),
                          'theme': sharedPreferences.getInt('theme')
                        },
                      );
                    },
                    style: ElevatedButton.styleFrom(
                        textStyle: TextStyle(fontSize: 30),
                        primary: Colors.red),
                    child: const Text("Страница 2")),
              ),
              const SizedBox(
                height: 100,
                width: 100,
              ),
            ],
          ),
        ),
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {
                context.read<PrefCubit>().toogleTheme();
                if (context.read<PrefCubit>().state.theme == ThemeData.light())
                  sharedPreferences.setInt('theme', 1);
                else
                  sharedPreferences.setInt('theme', 0);
              },
              tooltip: 'Switch Theme',
              child: context.read<PrefCubit>().state.theme == ThemeData.light()
                  ? const Icon(Icons.dark_mode)
                  : const Icon(Icons.light_mode),
            ),
          ],
        ));
  }
}
