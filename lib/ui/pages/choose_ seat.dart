import 'package:explanedtour/cubit/seat_cubit.dart';
import 'package:explanedtour/models/destination_model.dart';
import 'package:explanedtour/models/transaction_model.dart';
import 'package:explanedtour/shared/theme.dart';
import 'package:explanedtour/ui/pages/checkout_page.dart';
import 'package:explanedtour/ui/widgets/custom_bottom.dart';
import 'package:explanedtour/ui/widgets/seat_items.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class ChooseSeatPage extends StatelessWidget {
  final DestinationModel destination;

  const ChooseSeatPage(this.destination, {super.key});

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Container(
        margin: EdgeInsets.only(top: 50),
        child: Text(
          "Select Your\nFavorite Seat",
          style: whiteTextStyle.copyWith(
            fontSize: 24,
            fontWeight: semiBold,
          ),
        ),
      );
    }

    Widget seatStatus() {
      return Container(
        margin: EdgeInsets.only(
          top: 30,
        ),
        child: Row(
          children: [
            Container(
              width: 16,
              height: 16,
              margin: EdgeInsets.only(right: 6),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/icon_available.png",
                  ),
                ),
              ),
            ),
            Text(
              "Available",
              style: whiteTextStyle.copyWith(
                fontWeight: reguler,
              ),
            ),
            Container(
              width: 16,
              height: 16,
              margin: EdgeInsets.only(left: 10, right: 6),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/icon_selected.png",
                  ),
                ),
              ),
            ),
            Text(
              "Selected",
              style: whiteTextStyle.copyWith(
                fontWeight: reguler,
              ),
            ),
            Container(
              width: 16,
              height: 16,
              margin: EdgeInsets.only(left: 10, right: 6),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    "assets/icon_unavailable.png",
                  ),
                ),
              ),
            ),
            Text(
              "Unavailable",
              style: whiteTextStyle.copyWith(
                fontWeight: reguler,
              ),
            ),
          ],
        ),
      );
    }

    Widget selectSeat() {
      return BlocBuilder<SeatCubit, List<String>>(
        builder: (context, state) {
          return Container(
            width: double.infinity,
            margin: EdgeInsets.only(top: 30),
            padding: EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 30,
            ),
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(
                18,
              ),
            ),
            child: Column(
              children: [
                //NOTE: Seat Indicator
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      child: Center(
                        child: Text(
                          "A",
                          style: blackTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: reguler,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 48,
                      height: 48,
                      child: Center(
                        child: Text(
                          "B",
                          style: blackTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: reguler,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 48,
                      height: 48,
                      child: Center(
                        child: Text(
                          " ",
                          style: blackTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: reguler,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 48,
                      height: 48,
                      child: Center(
                        child: Text(
                          "C",
                          style: blackTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: reguler,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 48,
                      height: 48,
                      child: Center(
                        child: Text(
                          "D",
                          style: blackTextStyle.copyWith(
                            fontSize: 16,
                            fontWeight: reguler,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                //NOTE: seat 1
                Container(
                  margin: EdgeInsets.only(top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SeatItems(
                        id: "A1",
                        isAvailable: false,
                      ),
                      SeatItems(
                        id: "B1",
                        isAvailable: false,
                      ),
                      Container(
                        width: 48,
                        height: 48,
                        child: Center(
                          child: Text(
                            "1",
                            style: blackTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: reguler,
                            ),
                          ),
                        ),
                      ),
                      SeatItems(
                        id: "C1",
                      ),
                      SeatItems(
                        id: "D1",
                      ),
                    ],
                  ),
                ),
                //NOTE: seat 2
                Container(
                  margin: EdgeInsets.only(top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SeatItems(
                        id: "A2",
                      ),
                      SeatItems(
                        id: "B2",
                      ),
                      Container(
                        width: 48,
                        height: 48,
                        child: Center(
                          child: Text(
                            "2",
                            style: blackTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: reguler,
                            ),
                          ),
                        ),
                      ),
                      SeatItems(
                        id: "C2",
                      ),
                      SeatItems(
                        id: "D2",
                      ),
                    ],
                  ),
                ),
                //NOTE: seat 3
                Container(
                  margin: EdgeInsets.only(top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SeatItems(
                        id: "A3",
                      ),
                      SeatItems(
                        id: "B3",
                      ),
                      Container(
                        width: 48,
                        height: 48,
                        child: Center(
                          child: Text(
                            "3",
                            style: blackTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: reguler,
                            ),
                          ),
                        ),
                      ),
                      SeatItems(
                        id: "C3",
                      ),
                      SeatItems(
                        id: "D3",
                      ),
                    ],
                  ),
                ),
                //NOTE: seat 4
                Container(
                  margin: EdgeInsets.only(top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SeatItems(
                        id: "A4",
                      ),
                      SeatItems(
                        id: "B4",
                      ),
                      Container(
                        width: 48,
                        height: 48,
                        child: Center(
                          child: Text(
                            "4",
                            style: blackTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: reguler,
                            ),
                          ),
                        ),
                      ),
                      SeatItems(
                        id: "C4",
                      ),
                      SeatItems(
                        id: "D4",
                      ),
                    ],
                  ),
                ),
                //NOTE: seat 5
                Container(
                  margin: EdgeInsets.only(top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SeatItems(
                        id: "A5",
                      ),
                      SeatItems(
                        id: "B5",
                      ),
                      Container(
                        width: 48,
                        height: 48,
                        child: Center(
                          child: Text(
                            "5",
                            style: blackTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: reguler,
                            ),
                          ),
                        ),
                      ),
                      SeatItems(
                        id: "C5",
                      ),
                      SeatItems(
                        id: "D5",
                      ),
                    ],
                  ),
                ),
                //NOTE: YOU RSEAT
                Container(
                  margin: EdgeInsets.only(top: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Your seat",
                        style: greyTextStyle.copyWith(
                          fontWeight: light,
                        ),
                      ),
                      Text(
                        state.join(', '),
                        style: blackTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: semiBold,
                        ),
                      ),
                    ],
                  ),
                ),
                //NOTE: Total
                Container(
                  margin: EdgeInsets.only(top: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total",
                        style: greyTextStyle.copyWith(
                          fontWeight: light,
                        ),
                      ),
                      Text(
                        NumberFormat.currency(
                          locale: "id",
                          symbol: "IDR ",
                          decimalDigits: 0,
                        ).format(state.length * destination.price),
                        style: blueTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: semiBold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      );
    }

    Widget checkoutButton() {
      return BlocBuilder<SeatCubit, List<String>>(
        builder: (context, state) {
          return CustomButtom(
            title: "Continue to Checkout",
            onPressed: () {
              int price = destination.price * state.length;

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CheckoutPages(
                    TransactionModel(
                      destination: destination,
                      amountOfTraveler: state.length,
                      selectedSeats: state.join(', '),
                      insurance: true,
                      refundable: false,
                      price: price,
                      vat: 0.45,
                      grandTotal: price + (price * 0.45).toInt(),
                    ),
                  ),
                ),
              );
            },
            margin: EdgeInsets.only(top: 30, bottom: 46),
          );
        },
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 24),
        children: [
          title(),
          seatStatus(),
          selectSeat(),
          checkoutButton(),
        ],
      ),
    );
  }
}
