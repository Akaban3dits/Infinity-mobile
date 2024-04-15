import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:infinity_bank/domain/entities/movements.dart';
import 'package:infinity_bank/presentation/blocs/text_styles.dart';
import 'package:infinity_bank/presentation/widgets/movesinformation.dart';

class Moveview extends StatefulWidget {
  const Moveview({super.key});

  @override
  State<Moveview> createState() => _MoveviewState();
}

class _MoveviewState extends State<Moveview> {
  TextEditingController searchController = TextEditingController();
  List<MovementsBank> filteredList = [];

  @override
  void initState() {
    super.initState();
    filteredList =
        MoveList;
  }

  void filterSearchResults(String query) {
    if (query.isEmpty) {
      setState(() {
        filteredList = MoveList;
      });
      return;
    }

    List<MovementsBank> dummySearchList = [];
    dummySearchList.addAll(MoveList);
    if (query.isNotEmpty) {
      List<MovementsBank> dummyListData = [];
      dummySearchList.forEach((item) {
        if (item.usuario.toLowerCase().contains(query.toLowerCase())) {
          dummyListData.add(item);
        }
      });
      setState(() {
        filteredList = dummyListData;
      });
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: AppColorStyle.primary,
        title: Text(
          "Movimientos",
          style: AppTextStyles.h2s1.copyWith(color: AppColorStyle.white),
        ),
        iconTheme: const IconThemeData(color: AppColorStyle.white),
      ),
      backgroundColor: AppColorStyle.primary,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: filterSearchResults,
              controller: searchController,
              style: const TextStyle(
                  color: Colors
                      .white),
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.blueGrey[900],
                labelText: "Buscar",
                labelStyle: const TextStyle(color: Colors.white70),
                hintText: "Buscar por usuario",
                hintStyle: const TextStyle(color: Colors.white54),
                prefixIcon: const Icon(Icons.search, color: Colors.white),
                border: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(25.0)),
                  borderSide: BorderSide(color: Colors.blueGrey.shade700),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(25.0)),
                  borderSide: BorderSide(color: Colors.blueGrey.shade800),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                  borderSide: BorderSide(color: AppColorStyle.secundary, width: 2.0),
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                  color: AppColorStyle.secundary2,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView.separated(
                  itemCount: filteredList.length,
                  itemBuilder: (context, index) {
                    final MovementsBank cl = filteredList[index];
                    return MovesData(
                        usuario: cl.usuario,
                        monto: cl.monto,
                        fecha: cl.fecha,
                        tipo: cl.tipo,
                        estado: cl.estado,
                        detalle: cl.detalle,
                        id: cl.id,
                        url: cl.url);
                  },
                  separatorBuilder: (context, index) => const Divider(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }
}
