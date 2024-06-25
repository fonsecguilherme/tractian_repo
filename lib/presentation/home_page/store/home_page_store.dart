import 'package:flutter/material.dart';
import 'package:tractian_application/domain/companies_repository.dart';
import 'package:tractian_application/presentation/home_page/home_page_state.dart';

class HomePageStore extends ValueNotifier<HomePageState> {
  final ICompaniesRepository repository;

  HomePageStore({required this.repository}) : super(LoadingHomePageState());

  Future getCompanies() async {
    try {
      final result = await repository.getCompanies();

      value = FetchedHomePagestate(companies: result);
    } catch (e) {
      value = ErrorHomePageState(
        errorMessage: e.toString(),
      );
    }
  }
}
