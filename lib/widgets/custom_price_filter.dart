import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/blocs/filters/filter_bloc.dart';
import 'package:food_app/blocs/filters/filter_event.dart';
import 'package:food_app/blocs/filters/filter_state.dart';

class CustomPriceFilter extends StatelessWidget {
  const CustomPriceFilter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FilterBloc, FilterState>(
      builder: (context, state) {
        if (state is FilterLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is FilterLoaded) {
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: state.filter.priceFilter
                .asMap()
                .entries
                .map(
                  (price) => GestureDetector(
                    onTap: () {
                      context.read<FilterBloc>().add(
                            PriceFilterUpdated(
                              priceFilter:
                                  state.filter.priceFilter[price.key].copyWith(
                                value:
                                    !state.filter.priceFilter[price.key].value,
                              ),
                            ),
                          );
                    },
                    child: Container(
                      height: 36,
                      alignment: Alignment.center,
                      width: MediaQuery.of(context).size.width * .25,
                      decoration: BoxDecoration(
                        color: state.filter.priceFilter[price.key].value
                            ? Theme.of(context).primaryColor.withAlpha(100)
                            : Colors.white,
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: Text(
                        state.filter.priceFilter[price.key].price.price,
                        style: Theme.of(context).textTheme.headline5,
                      ),
                    ),
                  ),
                )
                .toList(),
          );
        } else {
          return const Text('Something went wrong!');
        }
      },
    );
  }
}
