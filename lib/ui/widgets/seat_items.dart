import 'package:explanedtour/cubit/seat_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../shared/theme.dart';

class SeatItems extends StatelessWidget {
  final String id;
  final bool isAvailable;

  const SeatItems({
    super.key,
    required this.id,
    this.isAvailable = true,
  });

  @override
  Widget build(BuildContext context) {
    bool isSelected = context.watch<SeatCubit>().isSelected(id);

    backgroundColor() {
      if (!isAvailable) {
        return unvailabelColor;
      } else {
        if (isSelected) {
          return blueColor;
        } else {
          return availabelColor;
        }
      }
    }

    border() {
      if (!isAvailable) {
        return unvailabelColor;
      } else {
        return blueColor;
      }
    }

    child() {
      if (isSelected) {
        return Center(
          child: Text(
            "YOU",
            style: whiteTextStyle.copyWith(
              fontWeight: semiBold,
            ),
          ),
        );
      } else {
        return SizedBox();
      }
    }

    return GestureDetector(
      onTap: () {
        if (isAvailable) {
          context.read<SeatCubit>().selectSeat(id);
        }
      },
      child: Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            color: backgroundColor(),
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              width: 2,
              color: border(),
            ),
          ),
          child: child()),
    );
  }
}
