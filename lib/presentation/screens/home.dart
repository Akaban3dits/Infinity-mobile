import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:infinity_bank/presentation/blocs/text_styles.dart';
import 'package:infinity_bank/presentation/screens/creditcard.dart';
import 'package:infinity_bank/presentation/screens/settings.dart';
import 'package:infinity_bank/presentation/screens/transfer.dart';
import 'package:infinity_bank/presentation/screens/wallet.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedindex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    const CreditCard(),
    const WalletPage(),
    const TransferPage(),
    const Settings()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: _widgetOptions.elementAt(_selectedindex),
        ),
        bottomNavigationBar: Container(
          color: AppColorStyle.secundary,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: GNav(
              gap: 10,
              backgroundColor: AppColorStyle.secundary,
              color: AppColorStyle.secundary2,
              activeColor: AppColorStyle.white,
              tabs: const [
                GButton(
                  icon: AppIconStyle.home,
                  text: "Home",
                ),
                GButton(icon: AppIconStyle.wallet, text: "Wallet"),
                GButton(
                  icon: AppIconStyle.swap,
                  text: "Transferencia",
                ),
                GButton(icon: AppIconStyle.settings, text: "Settings")
              ],
              selectedIndex: _selectedindex,
              onTabChange: (index) {
                setState(() {
                  _selectedindex = index;
                });
              },
            ),
          ),
        ));
  }
}
