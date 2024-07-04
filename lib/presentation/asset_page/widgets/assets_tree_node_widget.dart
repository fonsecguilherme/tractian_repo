import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../../../data/models/asset_model.dart';
import '../store/asset_page_store.dart';

class AssetTreeNode extends StatelessWidget {
  final AssetModel asset;
  final SensorStatus status;
  final Map<String, List<AssetModel>> groupedAssets;

  const AssetTreeNode({
    super.key,
    required this.asset,
    required this.status,
    required this.groupedAssets,
  });

  @override
  Widget build(BuildContext context) {
    final store = context.watch<AssetPageStore>();

    var children = groupedAssets[asset.id] ?? [];
    return ExpansionTile(
      leading: AssetIconWidget(
        asset: asset,
        groupedAssets: groupedAssets,
      ),
      title: Row(
        children: [
          Flexible(child: Text(asset.name)),
          const SizedBox(width: 8.0),
          AssetStatusWidget(status: status),
        ],
      ),
      children: [
        CustomScrollView(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: children.length,
                (context, index) {
                  final asset = children.elementAt(index);

                  return Padding(
                    padding: const EdgeInsets.only(left: 16.0),
                    child: AssetTreeNode(
                      asset: asset,
                      status: store.sensorStatus(
                        status: asset.status ?? '',
                      ),
                      groupedAssets: groupedAssets,
                    ),
                  );
                },
              ),
            ),
          ],
        )
      ],
    );
  }
}

class AssetStatusWidget extends StatelessWidget {
  final SensorStatus status;

  const AssetStatusWidget({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    switch (status) {
      case SensorStatus.alert:
        return Container(
          width: 8.0,
          height: 8.0,
          decoration: const BoxDecoration(
            color: Colors.red,
            shape: BoxShape.circle,
          ),
        );
      case SensorStatus.operating:
        return SvgPicture.asset(
          'assets/icons/bolt.svg',
          width: 8.17,
          height: 11.57,
        );
      default:
        return const SizedBox.shrink();
    }
  }
}

class AssetIconWidget extends StatelessWidget {
  final AssetModel asset;
  final Map<String, List<AssetModel>> groupedAssets;

  const AssetIconWidget({
    super.key,
    required this.groupedAssets,
    required this.asset,
  });

  @override
  Widget build(BuildContext context) {
    bool isComponent = asset.sensorType != null && asset.status != null;
    bool isAsset =
        !isComponent && (groupedAssets[asset.id]?.isNotEmpty ?? false);

    if (isComponent) {
      return SvgPicture.asset(
        'assets/icons/codepen.svg',
        width: 15.28,
        height: 19.56,
      );
    } else if (isAsset) {
      return SvgPicture.asset(
        'assets/icons/ioCubeOutline.svg',
        width: 15.28,
        height: 19.56,
      );
    } else {
      return SvgPicture.asset(
        'assets/icons/enviroment.svg',
        width: 15.28,
        height: 19.56,
      );
    }
  }
}
