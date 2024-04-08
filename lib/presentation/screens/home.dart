import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
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
      
      color: const Color(0xff3263f3),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: GNav(
          gap: 10,
          backgroundColor: const Color(0xff3263F3),
          color: const Color(0xff16045D),
          activeColor: Colors.white,
          tabs: const [
            GButton(
              icon: Icons.home,
              text: "Home",
            ),
            GButton(icon: Icons.wallet, text: "Wallet"),
            GButton(
              icon: Icons.swap_vert,
              text: "Transfer",
            ),
            GButton(icon: Icons.settings, text: "Settings")
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
