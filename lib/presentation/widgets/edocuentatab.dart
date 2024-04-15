import 'package:flutter/material.dart';
import 'package:infinity_bank/domain/entities/movements.dart';
import 'package:infinity_bank/presentation/screens/pagecuenta.dart';
import 'package:intl/intl.dart';
import 'package:infinity_bank/presentation/blocs/text_styles.dart';
import 'package:infinity_bank/presentation/widgets/Tabitem.dart';

class Mesnav extends StatelessWidget {
  const Mesnav({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> tabTitles = getTabTitles();

    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  "Saldo Actual",
                  style:
                      AppTextStyles.h2s1.copyWith(color: AppColorStyle.white),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Saldo disponible",
                        style: AppTextStyles.h3s1
                            .copyWith(color: AppColorStyle.white)),
                    Text("\$15,874.00",
                        style: AppTextStyles.h3s1
                            .copyWith(color: AppColorStyle.white))
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text("*Vigente hasta el 31/12/2024", style: AppTextStyles.h4s1.copyWith(color: AppColorStyle.white.withOpacity(0.4)),)],
                )
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
                    indicatorSize: TabBarIndicatorSize.tab,
                    dividerColor: Colors.transparent,
                    indicator: const BoxDecoration(
                      color: AppColorStyle.secundary,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    labelColor: Colors.white,
                    unselectedLabelColor: AppColorStyle.white.withOpacity(0.2),
                    tabs: [
                      TabItem(title: tabTitles[2]),
                      TabItem(title: tabTitles[1]),
                      TabItem(title: tabTitles[0]),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              children: [
                Center(child: EDOscreen(listMonth: list1, month: " más recientes", month2: tabTitles[2])),
                Center(child: EDOscreen(listMonth: list2, month: " de ${tabTitles[1]}", month2: tabTitles[1],)),
                Center(child: EDOscreen(listMonth: list3, month: " de ${tabTitles[0]}", month2: tabTitles[0],)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<String> getTabTitles() {
    DateTime now = DateTime.now();
    return List.generate(3, (index) {
      return DateFormat('MMMM', 'es_ES')
          .format(DateTime(now.year, now.month - index, now.day));
    }).reversed.toList();
  }
}
