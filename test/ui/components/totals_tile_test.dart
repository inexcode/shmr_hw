import 'package:alchemist/alchemist.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shmr_hw/ui/components/totals_tile.dart';

void main() {
  group('TotalsTileGoldenTest', () {
    goldenTest(
      'Totals tile',
      fileName: 'totals_tile',
      builder: () => Material(
        color: Colors.transparent,
        child: GoldenTestGroup(
          scenarioConstraints: const BoxConstraints(minWidth: 400),
          children: [
            GoldenTestScenario(
              name: 'income daily',
              child: TotalsTile(
                title: 'Total',
                trailing: r'1000 $',
                onTap: () {},
                showTrailingArrow: false,
                greenBackground: true,
              ),
            ),
            GoldenTestScenario(
              name: 'button',
              child: TotalsTile(
                title: 'Currency',
                trailing: r'$',
                onTap: () {},
                showTrailingArrow: true,
                greenBackground: true,
              ),
            ),
            GoldenTestScenario(
              name: 'white',
              child: TotalsTile(
                title: 'Currency',
                trailing: r'$',
                onTap: () {},
                showTrailingArrow: false,
                greenBackground: false,
              ),
            ),
            GoldenTestScenario(
              name: 'white with arrow',
              child: TotalsTile(
                title: 'Currency',
                trailing: r'$',
                onTap: () {},
                showTrailingArrow: true,
                greenBackground: false,
              ),
            ),
          ],
        ),
      ),
    );
  });
}
