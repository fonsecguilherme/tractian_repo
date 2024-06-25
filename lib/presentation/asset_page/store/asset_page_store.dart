import 'package:flutter/material.dart';
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
}
