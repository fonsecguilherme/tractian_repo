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

    return NestedScrollView(
      headerSliverBuilder: (
        BuildContext context,
        bool innerBoxIsScrolled,
      ) {
        return [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  TextField(
                    decoration: const InputDecoration(
                      hintStyle: TextStyle(fontSize: 17),
                      hintText: 'Buscar Ativo ou Local',
                      prefixIcon: Icon(Icons.search),
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(left: 8, bottom: 10),
                    ),
                    onChanged: (query) {
                      setState(() {
                        searchQuery = query;
                        _filterAssets();
                      });
                    },
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    children: [
                      CustomButtonWidget(
                        title: 'Sensor de Energia',
                        onTap: () {
                          setState(() {
                            sensor = !sensor;
                            _filterAssets();
                          });
                        },
                        isTapped: sensor,
                      ),
                      const SizedBox(width: 8),
                      CustomButtonWidget(
                        title: 'Crítico',
                        onTap: () {
                          setState(() {
                            isCritic = !isCritic;
                            _filterAssets();
                          });
                        },
                        isTapped: isCritic,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  const Divider(),
                  Row(
                    children: <Widget>[
                      const Icon(Icons.arrow_drop_down_outlined),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: SvgPicture.asset(
                          'assets/icons/enviroment.svg',
                          width: 15.28,
                          height: 19.56,
                        ),
                      ),
                      Text(widget.company.name)
                    ],
                  )
                ],
              ),
            ),
          ),
        ];
      },
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
                  if (index >= rootAssets.length) {
                    return null;
                  }
                  var asset = rootAssets.elementAt(index);

                  return AssetTreeNode(
                    asset: asset,
                    status: widget.store.sensorStatus(
                      status: asset.status ?? '',
                    ),
                    groupedAssets: filteredGroupedAssets,
                  );
                },
                childCount: filteredAssets.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
