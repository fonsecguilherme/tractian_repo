import 'package:flutter/material.dart';

import '../../widgets/custom_button.dart';

class AssetPageSuccessWidget extends StatefulWidget {
  const AssetPageSuccessWidget({super.key});

  @override
  State<AssetPageSuccessWidget> createState() => _AssetPageSuccessWidgetState();
}

class _AssetPageSuccessWidgetState extends State<AssetPageSuccessWidget> {
  var sensor = false;
  var isCritic = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xffEAEFF3),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  height: 32,
                  child: const TextField(
                    decoration: InputDecoration(
                      hintStyle: TextStyle(fontSize: 17),
                      hintText: 'Buscar Ativo ou Local',
                      prefixIcon: Icon(Icons.search),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(left: 8, bottom: 10),
                    ),
                    style: TextStyle(
                      fontSize: 40.0,
                      height: 2.0,
                      color: Colors.black,
                    ),
                  ),
                ),
                const SizedBox(height: 8.0),
                Row(
                  children: [
                    CustomButtonWidget(
                      title: 'Sensor de Energia',
                      onTap: () => setState(() {
                        sensor = !sensor;
                      }),
                      isTapped: sensor,
                    ),
                    const SizedBox(width: 8),
                    CustomButtonWidget(
                      title: 'Crítico',
                      onTap: () => setState(() {
                        isCritic = !isCritic;
                      }),
                      isTapped: isCritic,
                    ),
                  ],
                )
              ],
            ),
          ),
          const Placeholder(),
        ],
      ),
    );
  }
}
