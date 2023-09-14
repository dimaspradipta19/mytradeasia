import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:mytradeasia/config/themes/theme.dart';
import 'package:mytradeasia/features/presentation/state_management/cart_bloc/cart_bloc.dart';
import 'package:mytradeasia/features/presentation/state_management/cart_bloc/cart_state.dart';

class CartButton extends StatelessWidget {
  const CartButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        IconButton(
          onPressed: () {
            context.push("/mytradeasia/cart");
          },
          icon: Image.asset(
            "assets/images/icon_cart.png",
            width: size20px + 4,
          ),
        ),
        BlocBuilder<CartBloc, CartState>(builder: (context, state) {
          if (state is CartDoneState && state.cartItems != null) {
            if (state.cartItems!.isNotEmpty) {
              return Positioned(
                  top: 0,
                  right: 0,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: Text(state.cartItems!.length.toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        )),
                  ));
            } else {
              return Container();
            }
          } else {
            return Container();
          }
        })
      ],
    );
  }
}
