import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/blocs/basket/basket_bloc.dart';
import 'package:food_app/blocs/basket/basket_event.dart';
import 'package:food_app/blocs/basket/basket_state.dart';

class EditBasketScreen extends StatelessWidget {
  const EditBasketScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Edit Basket Screen'),
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
                  .copyWith(color: Theme.of(context).primaryColor),
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
                              tileColor:
                                  const Color.fromARGB(255, 233, 233, 233),
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
                              trailing: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      context.read<BasketBloc>().add(
                                            RemoveAllItem(
                                              item: state.basket
                                                  .itemQuantity(
                                                      state.basket.items)
                                                  .keys
                                                  .elementAt(index),
                                            ),
                                          );
                                    },
                                    icon: const Icon(Icons.delete),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      context.read<BasketBloc>().add(
                                            RemoveItem(
                                              item: state.basket
                                                  .itemQuantity(
                                                      state.basket.items)
                                                  .keys
                                                  .elementAt(index),
                                            ),
                                          );
                                    },
                                    icon: const Icon(Icons.remove_circle),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      context.read<BasketBloc>().add(
                                            AddItem(
                                              item: state.basket
                                                  .itemQuantity(
                                                      state.basket.items)
                                                  .keys
                                                  .elementAt(index),
                                            ),
                                          );
                                    },
                                    icon: const Icon(Icons.add_circle),
                                  )
                                ],
                              ),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6)),
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
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: MaterialButton(
          height: 50,
          color: Theme.of(context).primaryColor,
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: const Text('Done'),
        ),
      ),
    );
  }
}
