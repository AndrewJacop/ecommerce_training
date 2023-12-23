import 'package:ecommerce_training/core/controllers/cart_controller/cart_cubit.dart';
import 'package:ecommerce_training/core/controllers/favourite_controller/favourite_cubit.dart';
import 'package:ecommerce_training/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

Widget buildFavoriteItem(Product product, context) => Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
          width: 180,
          height: 180,
          //color: Colors.green,
          child: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: HexColor('#07094D'),
                            borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(20))),
                        height: 125,
                        child: Center(
                          child: RotatedBox(
                              quarterTurns: 1,
                              child: Text(
                                product.status!,
                                style: const TextStyle(color: Colors.white),
                              )),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 6,
                      child: Stack(
                        alignment: AlignmentDirectional.topEnd,
                        children: [
                          Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(20)),
                              color: HexColor('#07094D').withOpacity(0.6),
                            ),
                            height: 125,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(right: 30, left: 10),
                              child: Image(
                                fit: BoxFit.contain,
                                image: NetworkImage(product.image!),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              FavouriteCubit.get(context)
                                  .deleteFavorite(product.sId);
                            },
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: CircleAvatar(
                                backgroundColor: HexColor('#BFC0E4'),
                                radius: 10,
                                child: const Icon(
                                  Icons.favorite,
                                  size: 15,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10.0, top: 10),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: Text(
                                  product.name!,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                              if (product.status == 'New')
                                Expanded(
                                  child: Container(
                                      height: 30,
                                      decoration: BoxDecoration(
                                          color: HexColor('#C70000'),
                                          borderRadius:
                                              const BorderRadius.horizontal(
                                                  left: Radius.circular(20))),
                                      child: const Center(
                                          child: Text(
                                        '10% Off',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 8),
                                      ))),
                                ),
                            ],
                          ),
                        ),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Text(
                                product.company!,
                                style: const TextStyle(
                                    color: Colors.grey, fontSize: 15),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10.0),
                            child: Text(
                              '\$${product.price!.round()}',
                              style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: HexColor('#07094D'),
                                borderRadius: const BorderRadius.only(
                                    bottomLeft: Radius.circular(20),
                                    bottomRight: Radius.circular(20))),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.shopping_cart,
                                    color: Colors.white,
                                  ),
                                  MaterialButton(
                                    onPressed: () {
                                      CartCubit.get(context)
                                          .addToCart(product.sId!);
                                    },
                                    child: const Text(
                                      'Add to Cart',
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                      )
                    ],
                  ),
                ),
              )
            ],
          )),
    );
