import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:tractian_application/presentation/home_page/store/home_page_store.dart';
import 'package:tractian_application/presentation/home_page/widgets/home_page_success_widget.dart';

import 'home_page_state.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();

    context.read<HomePageStore>().getCompanies();
  }

  @override
  Widget build(BuildContext context) {
    final store = context.watch<HomePageStore>();

    final state = store.value;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: SvgPicture.asset('assets/icons/logo.svg'),
        backgroundColor: const Color(0xFF17192D),
      ),
      body: Builder(
        builder: (context) {
          if (state is ErrorHomePageState) {
            return Center(
              child: Text(state.errorMessage),
            );
          } else if (state is FetchedHomePagestate) {
            return HomePageSuccessWidget(
              companies: state.companies,
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
