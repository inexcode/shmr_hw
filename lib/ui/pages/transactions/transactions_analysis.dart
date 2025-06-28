import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class TransactionsAnalysisPage extends StatelessWidget {
  const TransactionsAnalysisPage({
    required this.isIncome,
    super.key,
  });

  final bool isIncome;

  @override
  Widget build(final BuildContext context) => const Placeholder();
}
