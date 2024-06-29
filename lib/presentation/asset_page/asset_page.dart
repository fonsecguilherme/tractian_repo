import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tractian_application/data/models/company_model.dart';
import 'package:tractian_application/presentation/asset_page/asset_page_state.dart';
import 'package:tractian_application/presentation/asset_page/store/asset_page_store.dart';

import 'widgets/asset_page_success_widget.dart';

class AssetPage extends StatefulWidget {
  final CompanyModel company;

  const AssetPage({super.key, required this.company});

  @override
  State<AssetPage> createState() => _AssetPageState();
}

class _AssetPageState extends State<AssetPage> {
  @override
  void initState() {
    super.initState();

    context.read<AssetPageStore>().getAsset(
          id: widget.company.id,
        );
  }

  @override
  Widget build(BuildContext context) {
    final store = context.watch<AssetPageStore>();

    final state = store.value;

    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: const Color(0xff17192D),
        title: const Text(
          'Assets',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: _buildBody(
        state,
        widget.company,
        store,
      ),
    );
  }

  Widget _buildBody(
    AssetPageState state,
    CompanyModel company,
    AssetPageStore store,
  ) {
    if (state is ErrorAssetPageState) {
      return Center(
        child: Text(state.errorMessage),
      );
    } else if (state is FetchedAssetPageState) {
      return AssetPageSuccessWidget(
        company: company,
        assets: state.assets,
        store: store,
      );
    } else {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
  }
}
