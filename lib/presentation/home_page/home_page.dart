import 'package:flutter/material.dart';
import 'package:tractian_application/domain/companies_repository.dart';
import 'package:tractian_application/presentation/home_page/store/home_page_store.dart';

import 'home_page_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomePageStore store = HomePageStore(repository: CompaniesRepository());

  // void loadData() async {
  //   companies = await repo.getCompanies();

  //   setState(() {
  //     companies;
  //   });
  // }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPersistentFrameCallback(
      (_) async => await store.getCompanies(),
    );
    // loadData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tractian',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color(0xFF17192D),
      ),
      body: ValueListenableBuilder(
        valueListenable: store,
        builder: (context, value, child) {
          if (value is ErrorHomePageState) {
            return Center(child: Text(value.errorMessage));
          } else if (value is FetchedHomePagestate) {
            return const Center(
              child: Text('Success'),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
