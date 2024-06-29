import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../data/models/asset_model.dart';

class AssetTreeNode extends StatelessWidget {
  final AssetModel asset;
  final Map<String, List<AssetModel>> groupedAssets;

  const AssetTreeNode(
      {super.key, required this.asset, required this.groupedAssets});

  @override
  Widget build(BuildContext context) {
    var children = groupedAssets[asset.id] ?? [];
    return ExpansionTile(
      leading: getIcon(asset),
      title: Text(asset.name),
      subtitle: asset.status != null ? Text('Status: ${asset.status}') : null,
      children: children
          .map(
            (child) =>
                AssetTreeNode(asset: child, groupedAssets: groupedAssets),
          )
          .toList(),
    );
  }

  Widget getIcon(AssetModel asset) {
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