import 'package:ecommerce_app/controller/bloc/home/home_bloc.dart';
import 'package:ecommerce_app/view/detail_screen.dart';
import 'package:ecommerce_app/view/widget/product_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<HomeBloc>().add(HomeProductFetchEvent());

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Product Listing',
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is HomeError) {
            print(state.message);
            return Center(child: Text(state.message));
          } else if (state is HomeLoaded) {
            return ListView.builder(
              itemCount: state.products.length,
              itemBuilder: (context, index) {
                final product = state.products[index];
                return InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProductDetailPage(
                                    productModel: product,
                                  )));
                    },
                    child: ProductCard(productModel: product));
              },
            );
          }
          return const Center(child: Text('No products available.'));
        },
      ),
    );
  }
}
