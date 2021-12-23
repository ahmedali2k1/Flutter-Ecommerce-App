import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ecommerceapp/blocs/cart/cart_bloc.dart';
import 'package:ecommerceapp/blocs/category/category_bloc.dart';
import 'package:ecommerceapp/blocs/checkout/checkout_bloc.dart';
import 'package:ecommerceapp/blocs/product/product_bloc.dart';
import 'package:ecommerceapp/blocs/wishlist/wishlist_bloc.dart';
import 'package:ecommerceapp/config/theme.dart';
import 'package:ecommerceapp/config/app_router.dart';
import 'package:ecommerceapp/repositories/category/category_repository.dart';
import 'package:ecommerceapp/repositories/checkout/checkout_repository.dart';
import 'package:ecommerceapp/screens/screens.dart';
import 'package:ecommerceapp/simple_bloc_observer.dart';

import 'repositories/product/product_repository.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = SimpleBlocObserver();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CartBloc()..add(CartStarted())),
        BlocProvider(
          create: (context) => CheckoutBloc(
            cartBloc: context.read<CartBloc>(),
            checkoutRepository: CheckoutRepository(),
          ),
        ),
        BlocProvider(create: (_) => WishlistBloc()..add(WishlistStarted())),
        BlocProvider(
          create: (_) => CategoryBloc(
            categoryRepository: CategoryRepository(),
          )..add(LoadCategories()),
        ),
        BlocProvider(
          create: (_) => ProductBloc(
            productRepository: ProductRepository(),
          )..add(LoadProducts()),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Complexity',
        theme: ThemeData(appBarTheme: AppBarTheme(color: Colors.black)),
        onGenerateRoute: AppRouter.onGenerateRoute,
        initialRoute: SplashScreen.routeName,
        home: HomeScreen(),
      ),
    );
  }
}
