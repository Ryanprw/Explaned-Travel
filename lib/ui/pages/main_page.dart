import 'package:explanedtour/cubit/page_cubit.dart';
import 'package:explanedtour/ui/pages/home_page.dart';
import 'package:explanedtour/ui/pages/settings.dart';
import 'package:explanedtour/ui/pages/transaction.dart';
import 'package:explanedtour/ui/pages/wallet_page.dart';
import 'package:flutter/material.dart';
import 'package:explanedtour/shared/theme.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/custom_bottomnav_item.dart';

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    Widget buildContent(int currentIndex) {
      switch (currentIndex) {
        case 0:
          return HomePage();
        case 1:
          return TransactionPages();
        case 2:
          return WalletPages();
        case 3:
          return SettingsPages();
        default:
          return HomePage();
      }
    }

    Widget customBottomNav() {
      return Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          height: 60,
          margin: EdgeInsets.only(
            bottom: 5,
            left: defaultMargin,
            right: defaultMargin,
          ),
          decoration: BoxDecoration(
            color: whiteColor,
            borderRadius: BorderRadius.circular(18),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CustomBottomNavigationItem(
                index: 0,
                imageUrl: "assets/icon_home.png",
              ),
              CustomBottomNavigationItem(
                index: 1,
                imageUrl: "assets/icon_booking.png",
              ),
              CustomBottomNavigationItem(
                index: 2,
                imageUrl: "assets/icon_card.png",
              ),
              CustomBottomNavigationItem(
                index: 3,
                imageUrl: "assets/icon_settings.png",
              )
            ],
          ),
        ),
      );
    }

    return BlocBuilder<PageCubit, int>(
      builder: (context, currentIndex) {
        return Scaffold(
          backgroundColor: backgroundColor,
          body: Stack(
            children: [
              buildContent(currentIndex),
              customBottomNav(),
            ],
          ),
        );
      },
    );
  }
}
