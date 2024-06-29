import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tractian_application/data/models/company_model.dart';
import 'package:tractian_application/presentation/asset_page/store/asset_page_store.dart';

import '../../../data/models/asset_model.dart';
import '../../widgets/custom_button.dart';
import 'assets_tree_node_widget.dart';

class AssetPageSuccessWidget extends StatefulWidget {
  final CompanyModel company;
  final List<AssetModel> assets;
  final AssetPageStore store;

  const AssetPageSuccessWidget({
    super.key,
    required this.company,
    required this.assets,
    required this.store,
  });

  @override
  State<AssetPageSuccessWidget> createState() => _AssetPageSuccessWidgetState();
}

class _AssetPageSuccessWidgetState extends State<AssetPageSuccessWidget> {
  Map<String, List<AssetModel>> groupedAssets = {};
  String searchQuery = '';
  bool sensor = false;
  bool isCritic = false;
  List<AssetModel> filteredAssets = [];

  @override
  void initState() {
    super.initState();
    groupedAssets = widget.store.groupAssetsByParentID(widget.assets);
  }

  void _filterAssets() {
    setState(() {
      filteredAssets = widget.store.filterAssets(
        widget.assets,
        searchQuery,
        sensor,
        isCritic,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    List<AssetModel> filteredAssets =
        widget.store.filterAssets(widget.assets, searchQuery, sensor, isCritic);
    Map<String, List<AssetModel>> filteredGroupedAssets =
        widget.store.groupAssetsByParentID(filteredAssets);
    List<AssetModel> rootAssets =
        filteredAssets.where((asset) => asset.parentId == null).toList();

    return Column(
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
                child: TextField(
                  onChanged: (value) {
                    setState(() {
                      searchQuery = value;
                      _filterAssets();
                    });
                  },
                  decoration: const InputDecoration(
                    hintStyle: TextStyle(fontSize: 17),
                    hintText: 'Buscar Ativo ou Local',
                    prefixIcon: Icon(Icons.search),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.only(left: 8, bottom: 10),
                  ),
                  style: const TextStyle(
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
                      _filterAssets();
                    }),
                    isTapped: sensor,
                  ),
                  const SizedBox(width: 8),
                  CustomButtonWidget(
                    title: 'Crítico',
                    onTap: () => setState(() {
                      isCritic = !isCritic;
                      _filterAssets();
                    }),
                    isTapped: isCritic,
                  ),
                ],
              )
            ],
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                ExpansionTile(
                  title: Text(
                    widget.company.name,
                  ),
                  leading: SvgPicture.asset(
                    'assets/icons/enviroment.svg',
                    width: 15.28,
                    height: 19.56,
                  ),
                  children: rootAssets.map((rootAsset) {
                    return AssetTreeNode(
                      asset: rootAsset,
                      groupedAssets: filteredGroupedAssets,
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
