import '../../data/models/asset_model.dart';

abstract class AssetPageState {}

class InitialAssetPageState extends AssetPageState {}

class LoadingAssetPageState extends AssetPageState {}

class ErrorAssetPageState extends AssetPageState {
  final String errorMessage;

  ErrorAssetPageState({required this.errorMessage});
}

class FetchedAssetPageState extends AssetPageState {
  final List<AssetModel> assets;

  FetchedAssetPageState({required this.assets});
}
