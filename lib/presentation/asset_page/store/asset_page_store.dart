import 'package:flutter/material.dart';
import 'package:tractian_application/data/models/asset_model.dart';
import 'package:tractian_application/presentation/asset_page/asset_page_state.dart';

import '../../../domain/companies_repository.dart';

class AssetPageStore extends ValueNotifier<AssetPageState> {
  final ICompaniesRepository repository;

  AssetPageStore({
    required this.repository,
  }) : super((LoadingAssetPageState()));

  Future getAsset({required String id}) async {
    try {
      final result = await repository.getAssets(
        companyID: id,
      );

      value = FetchedAssetPageState(assets: result);
    } catch (e) {
      value = ErrorAssetPageState(errorMessage: e.toString());
    }
  }


    Map<String, List<AssetModel>> groupAssetsByParentID(List<AssetModel> assets) {
    Map<String, List<AssetModel>> groupedAssets = {};
    for (var asset in assets) {
      if (groupedAssets[asset.parentId] == null) {
        groupedAssets[asset.parentId ?? ''] = [];
      }
      groupedAssets[asset.parentId ?? '']!.add(asset);
    }
    return groupedAssets;
  }

   List<AssetModel> filterAssets(
      List<AssetModel> assets, String query, bool sensor, bool isCritic) {
    return assets.where((asset) {
      bool matchesQuery =
          asset.name.toLowerCase().contains(query.toLowerCase());
      bool matchesSensorType = !sensor || asset.sensorType == 'energy';
      bool matchesStatus = !isCritic || asset.status == 'alert';
      return matchesQuery && matchesSensorType && matchesStatus;
    }).toList();
  }

}
