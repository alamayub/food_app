import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/blocs/basket/basket_bloc.dart';
import 'package:food_app/blocs/basket/basket_event.dart';
import 'package:food_app/blocs/basket/basket_state.dart';
import 'package:food_app/models/voucher_model.dart';

class VoucherScreen extends StatelessWidget {
  const VoucherScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Voucher Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Enter a voucher code',
              style: Theme.of(context).textTheme.headline4!.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(vertical: 10),
              decoration: BoxDecoration(
                color: Colors.yellow[200],
                borderRadius: BorderRadius.circular(6),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        hintText: 'Voucher Code',
                        contentPadding: EdgeInsets.all(10),
                      ),
                    ),
                  )
                ],
              ),
            ),
            Text(
              'Your vouchsers',
              style: Theme.of(context).textTheme.headline4!.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
            ),
            ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) => ListTile(
                leading: const Center(child: Text('1x')),
                title: Text(Voucher.couchers[index].code),
                trailing: BlocBuilder<BasketBloc, BasketState>(
                  builder: (context, state) {
                    return TextButton(
                      onPressed: () {
                        context
                            .read<BasketBloc>()
                            .add(AddVoucher(voucher: Voucher.couchers[index]));
                        Navigator.of(context).pop();
                      },
                      child: const Text('Apply'),
                    );
                  },
                ),
              ),
              separatorBuilder: (context, index) => const SizedBox(height: 6),
              itemCount: Voucher.couchers.length,
            )
          ],
        ),
      ),
    );
  }
}
