import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/blocs/filters/filter_bloc.dart';
import 'package:food_app/blocs/filters/filter_event.dart';
import 'package:food_app/blocs/filters/filter_state.dart';

class CustomcategoryFilter extends StatelessWidget {
  const CustomcategoryFilter({Key? key}) : super(key: key);

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
          return ListView.separated(
            shrinkWrap: true,
            itemBuilder: (context, index) => Container(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    state.filter.categoryFilter[index].category.name,
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  SizedBox(
                    height: 25,
                    width: 20,
                    child: Checkbox(
                      value: state.filter.categoryFilter[index].value,
                      onChanged: (bool? val) {
                        context.read<FilterBloc>().add(
                              CategoryFilterUpdated(
                                categoryFilter:
                                    state.filter.categoryFilter[index].copyWith(
                                  value:
                                      !state.filter.categoryFilter[index].value,
                                ),
                              ),
                            );
                      },
                    ),
                  )
                ],
              ),
            ),
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            itemCount: state.filter.categoryFilter.length,
          );
        } else {
          return const Text('Something went wrong!');
        }
      },
    );
  }
}
