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
                    padding: EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors
                          .red, // You can change the background color as needed
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                        state.cartItems!.length
                            .toString(), // Replace with the actual count of items in the cart
                        style: TextStyle(
                          color: Colors
                              .white, // You can change the text color as needed
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
