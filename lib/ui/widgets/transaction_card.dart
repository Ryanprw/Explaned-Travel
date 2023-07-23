import 'package:explanedtour/models/transaction_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../shared/theme.dart';
import 'custom_booking_items.dart';

class TransactionCard extends StatelessWidget {
  final TransactionModel transaction;

  const TransactionCard(this.transaction, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      padding: EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 30,
      ),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //Note: Destination title
          Row(
            children: [
              Container(
                width: 70,
                height: 70,
                margin: EdgeInsets.only(right: 16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(transaction.destination.imageUrl),
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      transaction.destination.name,
                      style: blackTextStyle.copyWith(
                        fontSize: 18,
                        fontWeight: semiBold,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      transaction.destination.city,
                      style: greyTextStyle.copyWith(
                        fontWeight: light,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/icon_star.png"),
                      ),
                    ),
                  ),
                  Text(
                    transaction.destination.rating.toString(),
                    style: blackTextStyle.copyWith(
                      fontWeight: semiBold,
                    ),
                  )
                ],
              ),
            ],
          ),

          //Note: Booking Detail Text
          Container(
            margin: EdgeInsets.only(top: 20),
            child: Text(
              "Booking Details",
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
              ),
            ),
          ),
          //Note: Booking Items
          DetailBookingItems(
            title: "Traveler",
            valueText: "${transaction.amountOfTraveler} person",
            valueColor: blackColor,
          ),
          DetailBookingItems(
            title: "Seat",
            valueText: transaction.selectedSeats,
            valueColor: blackColor,
          ),
          DetailBookingItems(
            title: "Insurance",
            valueText: transaction.insurance ? "YES" : "NO",
            valueColor: transaction.insurance ? bluelightColor : redColor,
          ),
          DetailBookingItems(
            title: "Refundable",
            valueText: transaction.refundable ? "YES" : "NO",
            valueColor: transaction.refundable ? bluelightColor : redColor,
          ),
          DetailBookingItems(
            title: "VAT",
            valueText: "${(transaction.vat * 100).toStringAsFixed(0)}%",
            valueColor: blackColor,
          ),
          DetailBookingItems(
            title: "Price",
            valueText: NumberFormat.currency(
              locale: "id",
              symbol: "IDR ",
              decimalDigits: 0,
            ).format(transaction.price),
            valueColor: backgroundColor,
          ),
          DetailBookingItems(
            title: "Grand Total",
            valueText: NumberFormat.currency(
              locale: "id",
              symbol: "IDR ",
              decimalDigits: 0,
            ).format(transaction.grandTotal),
            valueColor: blueColor,
          ),
        ],
      ),
    );
  }
}
