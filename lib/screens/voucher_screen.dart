import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/blocs/voucher/voucher_bloc.dart';

class VoucherScreen extends StatefulWidget {
  const VoucherScreen({Key? key}) : super(key: key);

  @override
  State<VoucherScreen> createState() => _VoucherScreenState();
}

class _VoucherScreenState extends State<VoucherScreen> {
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
            TextFormField(
              decoration: const InputDecoration(
                hintText: 'Voucher Code',
                contentPadding: EdgeInsets.all(10),
              ),
              // onChanged: (val) async {
              //   print(await VoucherRepository().searchVoucher(val));
              // },
            ),
            Text(
              'Your vouchsers',
              style: Theme.of(context).textTheme.headline4!.copyWith(
                    color: Theme.of(context).colorScheme.secondary,
                  ),
            ),
            Expanded(
              child: BlocBuilder<VoucherBloc, VoucherState>(
                builder: (context, state) {
                  if (state is VoucherLoading) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (state is VoucherLoaded) {
                    return ListView.separated(
                      shrinkWrap: true,
                      itemBuilder: (context, index) => Row(
                        children: [
                          const Text('1x'),
                          const SizedBox(width: 10),
                          Text(state.vouchers[index].code),
                          const Spacer(),
                          TextButton(
                            onPressed: () {
                              context.read<VoucherBloc>().add(SelectVouchers(
                                    voucher: state.vouchers[index],
                                  ));
                              Navigator.of(context).pop();
                            },
                            child: const Text('Apply'),
                          ),
                        ],
                      ),
                      separatorBuilder: (context, index) =>
                          const SizedBox(height: 6),
                      itemCount: state.vouchers.length,
                    );
                  } else {
                    return const Text('Somthing went wrong!');
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
