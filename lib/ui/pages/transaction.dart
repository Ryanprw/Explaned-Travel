import 'package:explanedtour/cubit/transaction_cubit.dart';
import 'package:explanedtour/shared/theme.dart';
import 'package:explanedtour/ui/widgets/transaction_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TransactionPages extends StatefulWidget {
  const TransactionPages({super.key});

  @override
  State<TransactionPages> createState() => _TransactionPagesState();
}

class _TransactionPagesState extends State<TransactionPages> {
  @override
  void initState() {
    context.read<TransactionCubit>().fetchTransactions();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TransactionCubit, TransactionState>(
      builder: (context, state) {
        if (state is TransactionLoading) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is TransactionSucces) {
          if (state.transactions.length == 0) {
            return Center(
              child: Text("No Transaction"),
            );
          } else {
            return ListView.builder(itemBuilder: ((context, index) {
              return TransactionCard(
                state.transactions[index],
              );
            }));
          }
        }

        return Center(
          child: Text("Halaman Transaksi", style: whiteTextStyle.copyWith()),
        );
      },
    );
  }
}
