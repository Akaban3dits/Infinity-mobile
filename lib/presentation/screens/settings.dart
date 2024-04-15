import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:infinity_bank/presentation/blocs/text_styles.dart';
import 'package:infinity_bank/presentation/screens/profileinfo.dart';
import 'package:infinity_bank/presentation/widgets/Tabitem.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  List<String> tabTitles = [];

  @override
  void initState() {
    super.initState();
    tabTitles = getTabTitles();
  }

  List<String> getTabTitles() {
    DateTime now = DateTime.now();
    return List.generate(3, (index) {
      return DateFormat('MMMM', 'es_ES').format(DateTime(now.year, now.month - index, now.day));
    }).reversed.toList();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        backgroundColor: AppColorStyle.primary,
        body: SafeArea(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 150,
                    width: 150,
                    child: ClipOval(
                      child: Image.network(
                        "https://i.pinimg.com/736x/1a/db/9a/1adb9a51c0045c4535fc95037fb1382e.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Rosario Joahan",
                          style: AppTextStyles.h2s1.copyWith(color: AppColorStyle.white),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Akaban3dits",
                          style: AppTextStyles.h4s1.copyWith(color: AppColorStyle.white.withOpacity(0.2)),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              PreferredSize(
                preferredSize: const Size.fromHeight(40),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    child: Container(
                      height: 40,
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: AppColorStyle.secundary2,
                      ),
                      child: TabBar(
                        dividerColor: Colors.transparent,
                        indicatorSize: TabBarIndicatorSize.tab,
                        indicator: const BoxDecoration(
                          color: AppColorStyle.secundary,
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        labelColor: Colors.white,
                        unselectedLabelColor: AppColorStyle.white.withOpacity(0.2),
                        tabs: const [
                          TabItem(title: 'Cuenta'),
                          TabItem(title: 'Seguridad'),
                          TabItem(title: 'Personalización'),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              const Expanded(
                child: TabBarView(
                  children: [
                    Center(child: Profileinfo()),
                    Center(child: Profileinfo2()),
                    Center(child: ProfileInfo3()),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
