import 'package:explanedtour/cubit/auth_cubit.dart';
import 'package:explanedtour/cubit/page_cubit.dart';
import 'package:explanedtour/shared/theme.dart';
import 'package:explanedtour/ui/widgets/custom_bottom.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../widgets/custom_settings_item.dart';

class SettingsPages extends StatelessWidget {
  const SettingsPages({super.key});

  @override
  Widget build(BuildContext context) {
    Widget headerSettings() {
      return Container(
        child: Text(
          "Settings",
          style: whiteTextStyle.copyWith(
            fontSize: 24,
            fontWeight: medium,
          ),
        ),
      );
    }

    Widget contentSettings() {
      return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthSucces) {
            return Container(
              margin: EdgeInsets.only(top: 20),
              child: Row(
                children: [
                  Container(
                    width: 74,
                    height: 74,
                    margin: EdgeInsets.only(
                      right: 21,
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/image_emojii.png"),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        state.user.name,
                        style: whiteTextStyle.copyWith(
                          fontSize: 20,
                          fontWeight: semiBold,
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "${state.user.hobby}",
                        style: greyTextStyle.copyWith(
                          fontWeight: reguler,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            );
          } else {
            return SizedBox();
          }
        },
      );
    }

    return Scaffold(
      backgroundColor: backgroundColor,
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is AuthFailed) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: redColor,
                content: Text(state.error),
              ),
            );
          } else if (state is AuthInitial) {
            context.read<PageCubit>().setPage(0);
            Navigator.pushNamedAndRemoveUntil(
                context, '/sign-in', (route) => false);
          }
        },
        builder: (context, state) {
          if (state is AuthLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }

          return SafeArea(
            child: ListView(
              padding: EdgeInsets.symmetric(
                horizontal: 20,
              ),
              //Note: Icon Settings
              children: [
                headerSettings(),
                contentSettings(),
                SettingsItems(
                  title: "Account",
                  text: "Privacy, secutrity, change email or number",
                  imageUrl: "assets/icon_us.png",
                ),
                SettingsItems(
                  title: "Notifications",
                  text: "Message, group & call tones",
                  imageUrl: "assets/icon_notif.png",
                ),
                SettingsItems(
                  title: "Help",
                  text: "Help cenre, contact us, privacy policy",
                  imageUrl: "assets/icon_help.png",
                ),
                SizedBox(
                  height: 20,
                ),
                CustomButtom(
                  title: "Logout",
                  onPressed: () {
                    context.read<AuthCubit>().signOut();
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
