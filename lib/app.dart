import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tractian_application/presentation/asset_page/store/asset_page_store.dart';
import 'package:tractian_application/presentation/home_page/home_page.dart';
import 'package:tractian_application/presentation/home_page/store/home_page_store.dart';

import 'domain/companies_repository.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (context) => CompaniesRepository()),
        ChangeNotifierProvider(
          create: (context) => HomePageStore(
            repository: context.read<CompaniesRepository>(),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => AssetPageStore(
            repository: context.read<CompaniesRepository>(),
          ),
        )
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
