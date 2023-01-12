import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_list_tutorial/bloc/posts_bloc.dart';
import 'package:infinite_list_tutorial/pages/posts_page.dart';
import 'helpers/my_bloc_observer.dart';

void main() {
  Bloc.observer = MyBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => PostsBloc()..add(GetPostsEvent()),
        child: const MaterialApp(
          home: PostsPage(),
        ));
  }
}
