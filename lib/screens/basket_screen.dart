import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/blocs/basket/basket_bloc.dart';
import 'package:food_app/blocs/basket/basket_state.dart';
import 'package:food_app/screens/checkout_screen.dart';
import 'package:food_app/screens/delivery_time_screen.dart';
import 'package:food_app/screens/edit_basket_screen.dart';
import 'package:food_app/screens/voucher_screen.dart';

class BasketScreen extends StatelessWidget {
  const BasketScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Basket Screen'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => const EditBasketScreen(),
              ));
            },
            icon: const Icon(Icons.edit),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Items',
              style: Theme.of(context)
                  .textTheme
                  .headline4!
                  .copyWith(color: Theme.of(context).colorScheme.primary),
            ),
            BlocBuilder<BasketBloc, BasketState>(
              builder: (context, state) {
                if (state is BasketLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is BasketLoaded) {
                  return state.basket.items.isEmpty
                      ? Container(
                          padding: const EdgeInsets.symmetric(
                            vertical: 8,
                            horizontal: 16,
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6),
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            'No item in the beasket',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        )
                      : ListView.separated(
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return ListTile(
                              dense: true,
                              minLeadingWidth: 0,
                              tileColor: Colors.white,
                              leading: Container(
                                width: 20,
                                alignment: Alignment.center,
                                child: Text(
                                  '${state.basket.itemQuantity(state.basket.items).entries.elementAt(index).value}x',
                                  style: Theme.of(context).textTheme.headline6,
                                ),
                              ),
                              title: Text(
                                '${state.basket.itemQuantity(state.basket.items).keys.elementAt(index).name}',
                                style: Theme.of(context).textTheme.headline6,
                              ),
                              trailing: Text(
                                '\$${state.basket.itemQuantity(state.basket.items).keys.elementAt(index).price}',
                                style: Theme.of(context).textTheme.headline6,
                              ),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(6),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 6),
                          itemCount: state.basket
                              .itemQuantity(state.basket.items)
                              .keys
                              .length,
                        );
                } else {
                  return const Text('Something went wrong!');
                }
              },
            ),
            Container(
              margin: const EdgeInsets.only(top: 16),
              height: 100,
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
              ),
              child: BlocBuilder<BasketBloc, BasketState>(
                builder: (context, state) {
                  if (state is BasketLoaded) {
                    return (state.basket.deliveryTime == null)
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Select delivery time',
                                style: Theme.of(context).textTheme.headline6,
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        const DeliveryTimeScreen(),
                                  ));
                                },
                                child: const Text('Change'),
                              ),
                            ],
                          )
                        : Text(
                            'Delivery at ${state.basket.deliveryTime!.value}');
                  } else {
                    return const Text('Something went wrong!');
                  }
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 16),
              height: 100,
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
              ),
              child: BlocBuilder<BasketBloc, BasketState>(
                builder: (context, state) {
                  if (state is BasketLoaded) {
                    return (state.basket.voucher == null)
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                'Do you have a voucher?',
                                style: Theme.of(context).textTheme.headline6,
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => const VoucherScreen(),
                                  ));
                                },
                                child: const Text('Apply'),
                              ),
                            ],
                          )
                        : const Text('Your voucher is added');
                  } else {
                    return const Text('Something went wrong!');
                  }
                },
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 16),
              height: 100,
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
              ),
              child: BlocBuilder<BasketBloc, BasketState>(
                builder: (context, state) {
                  if (state is BasketLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is BasketLoaded) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Subtotal',
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            Text(
                              '\$${state.basket.subTotalString}',
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Delivery fee',
                              style: Theme.of(context).textTheme.headline6,
                            ),
                            Text(
                              '\$4.99',
                              style: Theme.of(context).textTheme.headline6,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary),
                            ),
                            Text(
                              '\$${state.basket.totalString}',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline6!
                                  .copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .primary),
                            ),
                          ],
                        ),
                      ],
                    );
                  } else {
                    return const Text('Something went wrong!');
                  }
                },
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: MaterialButton(
          height: 50,
          color: Theme.of(context).colorScheme.primary,
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const CheckoutScreen(),
            ));
          },
          child: const Text('Go To Checkout'),
        ),
      ),
    );
  }
}
