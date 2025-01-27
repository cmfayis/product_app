import 'package:ecommerce_app/controller/bloc/bottom/bottom_navigation_bloc.dart';
import 'package:ecommerce_app/controller/bloc/home/home_bloc.dart';
import 'package:ecommerce_app/controller/bloc/cart/cart_bloc.dart';

import 'package:ecommerce_app/services/localstorege.dart';
import 'package:ecommerce_app/view/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                HomeBloc()), 
        BlocProvider(
            create: (context) =>
                CartBloc(ProductLocalStorage())), 
        BlocProvider(
            create: (context) => BottomNavigationBloc()), 
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'E-commerce App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: BottomNavigatonPage(),
      ),
    );
  }
}
