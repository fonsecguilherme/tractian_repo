import 'package:tractian_application/data/models/company_model.dart';

abstract class HomePageState {}

class InitialHomePageState extends HomePageState {}

class LoadingHomePageState extends HomePageState {}

class ErrorHomePageState extends HomePageState {
  final String errorMessage;

  ErrorHomePageState({required this.errorMessage});
}

class FetchedHomePagestate extends HomePageState {
  final List<CompanyModel> companies;

  FetchedHomePagestate({required this.companies});
}
