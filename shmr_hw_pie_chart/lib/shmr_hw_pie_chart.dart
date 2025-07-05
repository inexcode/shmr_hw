import 'dart:async';
import 'dart:math' as math;

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class PieChartInputData {
  const PieChartInputData({
    required this.value,
    required this.label,
    this.color,
  });

  final double value;
  final String label;
  final Color? color;
}

class AnimatedPieChart extends StatefulWidget {
  const AnimatedPieChart({
    required this.data,
    required this.valueSuffix,
    this.colors,
    super.key,
  });

  final List<PieChartInputData> data;
  final String valueSuffix;
  final List<Color>? colors;

  @override
  State<AnimatedPieChart> createState() => _AnimatedPieChartState();
}

class _AnimatedPieChartState extends State<AnimatedPieChart>
    with TickerProviderStateMixin {
  late AnimationController _rotationController;
  late AnimationController _fadeController;
  late Animation<double> _rotationAnimation;
  late Animation<double> _fadeAnimation;

  List<PieChartInputData> _currentData = [];
  List<PieChartInputData> _newData = [];
  bool _isAnimating = false;
  int _touchedIndex = -1;

  @override
  void initState() {
    super.initState();
    _currentData = widget.data;

    _rotationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    _fadeController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );

    _rotationAnimation = Tween<double>(begin: 0, end: 2 * math.pi).animate(
      CurvedAnimation(parent: _rotationController, curve: Curves.easeInOut),
    );

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _fadeController, curve: Curves.easeInOut),
    );

    _fadeController.value = 0.0;
  }

  @override
  void didUpdateWidget(final AnimatedPieChart oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.data != widget.data) {
      unawaited(_animateToNewData());
    }
  }

  Future<void> _animateToNewData() async {
    if (_isAnimating) {
      return;
    }

    setState(() {
      _isAnimating = true;
      _newData = widget.data;
    });

    _rotationController.reset();
    _fadeController
      ..reset()
      ..forward();
    unawaited(_rotationController.forward());

    await Future.delayed(const Duration(milliseconds: 500));

    setState(() {
      _currentData = _newData;
    });

    unawaited(_fadeController.reverse());

    await _rotationController.forward();

    setState(() {
      _isAnimating = false;
    });
  }

  @override
  void dispose() {
    _rotationController.dispose();
    _fadeController.dispose();
    super.dispose();
  }

  List<Color> get _colors =>
      widget.colors ??
      [
        const Color(0xFF0293EE),
        const Color(0xFFF8B250),
        const Color(0xFF845EC2),
        const Color(0xFF13D38E),
        const Color(0xFFFF6B6B),
        const Color(0xFF4ECDC4),
        const Color(0xFF45B7D1),
        const Color(0xFF96CEB4),
        const Color(0xFFFECA57),
        const Color(0xFFFF9FF3),
      ];

  double get _totalValue =>
      _currentData.fold(0, (final sum, final data) => sum + data.value);

  List<PieChartSectionData> _getPieChartSections() {
    if (_currentData.isEmpty || _totalValue == 0) {
      return [];
    }

    return _currentData.asMap().entries.map((final entry) {
      final index = entry.key;
      final data = entry.value;
      final percentage = data.value / _totalValue * 100;
      final isTouched = index == _touchedIndex;

      return PieChartSectionData(
        color: data.color ?? _colors[index % _colors.length],
        value: percentage,
        title: '',
        radius: isTouched ? 40 : 30,
      );
    }).toList();
  }

  List<Widget> _buildLegend() {
    if (_currentData.isEmpty) {
      return const [];
    }

    return _currentData.asMap().entries.map((final entry) {
      final index = entry.key;
      final data = entry.value;
      final percentage = data.value / _totalValue * 100;

      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 2),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 8,
              height: 8,
              decoration: BoxDecoration(
                color: data.color ?? _colors[index % _colors.length],
                shape: BoxShape.circle,
              ),
            ),
            const SizedBox(width: 6),
            Flexible(
              child: Text(
                '${percentage.toStringAsFixed(1)}% ${data.label}',
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w500,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      );
    }).toList();
  }

  Widget _buildTooltip(final BuildContext context, final int index) {
    final data = _currentData[index];
    final percentage = data.value / _totalValue * 100;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Theme.of(context).colorScheme.shadow.withAlpha(50),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            data.label,
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSurface,
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            '${percentage.toStringAsFixed(1)}%',
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSurface,
              fontSize: 12,
            ),
          ),
          Text(
            '${data.value.toStringAsFixed(2)} ${widget.valueSuffix}',
            style: TextStyle(
              color: Theme.of(context).colorScheme.onSurface,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(final BuildContext context) {
    if (_currentData.isEmpty) {
      return const SizedBox.shrink();
    }

    final screenWidth = MediaQuery.of(context).size.width;
    final double chartSize = math.min(screenWidth * 0.8, 300);
    final centerSpaceRadius = chartSize * 0.35;
    final legendContainerSize = centerSpaceRadius * 1.6;

    return Container(
      height: chartSize + 32,
      padding: const EdgeInsets.all(16),
      child: AnimatedBuilder(
        animation: Listenable.merge([_rotationAnimation, _fadeAnimation]),
        builder: (final context, final child) {
          final opacity = _isAnimating ? (1.0 - _fadeAnimation.value) : 1.0;

          return Transform.rotate(
            angle: _isAnimating ? _rotationAnimation.value : 0.0,
            child: Opacity(
              opacity: opacity,
              child: Center(
                child: SizedBox(
                  width: chartSize,
                  height: chartSize,
                  child: Stack(
                    children: [
                      PieChart(
                        PieChartData(
                          sections: _getPieChartSections(),
                          centerSpaceRadius: centerSpaceRadius,
                          sectionsSpace: 2,
                          pieTouchData: PieTouchData(
                            enabled: true,
                            touchCallback:
                                (
                                  final FlTouchEvent event,
                                  final pieTouchResponse,
                                ) {
                                  setState(() {
                                    if (!event.isInterestedForInteractions ||
                                        pieTouchResponse == null ||
                                        pieTouchResponse.touchedSection ==
                                            null) {
                                      _touchedIndex = -1;
                                      return;
                                    }
                                    _touchedIndex = pieTouchResponse
                                        .touchedSection!
                                        .touchedSectionIndex;
                                  });
                                },
                          ),
                        ),
                      ),
                      Positioned.fill(
                        child: Center(
                          child: Container(
                            width: legendContainerSize,
                            height: legendContainerSize,
                            decoration: BoxDecoration(
                              color: Theme.of(
                                context,
                              ).colorScheme.surface.withValues(alpha: 0.9),
                              shape: BoxShape.circle,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8),
                              child: LayoutBuilder(
                                builder: (final context, final constraints) {
                                  final legendItems = _buildLegend();
                                  final estimatedHeight =
                                      legendItems.length * 20.0;

                                  if (estimatedHeight <=
                                      constraints.maxHeight) {
                                    return Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: legendItems,
                                    );
                                  } else {
                                    return SingleChildScrollView(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: legendItems,
                                      ),
                                    );
                                  }
                                },
                              ),
                            ),
                          ),
                        ),
                      ),
                      if (_touchedIndex >= 0 &&
                          _touchedIndex < _currentData.length)
                        Positioned.fill(
                          child: Center(
                            child: _buildTooltip(context, _touchedIndex),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
