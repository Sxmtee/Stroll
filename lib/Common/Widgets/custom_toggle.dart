import 'package:flutter/material.dart';

class CustomToggle extends StatelessWidget {
  final int currentIndex;
  final Function(int) onToggle;
  final List<String> toggleItems;
  final bool expandWidth;
  final Color? backgroundColor;
  final Color? selectedColor;
  final Color? selectedTextColor;
  final Color? unselectedTextColor;
  final EdgeInsets? padding;
  final double? borderRadius;

  const CustomToggle({
    super.key,
    required this.currentIndex,
    required this.onToggle,
    required this.toggleItems,
    this.expandWidth = false,
    this.backgroundColor,
    this.selectedColor,
    this.selectedTextColor,
    this.unselectedTextColor,
    this.padding = const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
    this.borderRadius = 8,
  }) : assert(toggleItems.length >= 2, 'Must provide at least 2 toggle items');

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final bool isDarkMode = theme.brightness == Brightness.dark;

    // Define theme-aware colors
    final defaultBackgroundColor = isDarkMode
        ? theme.colorScheme.surface
        : theme.colorScheme.surfaceContainerHighest;

    final defaultSelectedColor = isDarkMode
        ? theme.colorScheme.primary.withOpacity(0.8)
        : theme.colorScheme.primary;

    final defaultSelectedTextColor =
        isDarkMode ? theme.colorScheme.onPrimary : theme.colorScheme.onPrimary;

    final defaultUnselectedTextColor = isDarkMode
        ? theme.colorScheme.onSurface.withOpacity(0.7)
        : theme.colorScheme.onSurfaceVariant;

    return Container(
      width: expandWidth ? double.infinity : null,
      decoration: BoxDecoration(
        color: backgroundColor ?? defaultBackgroundColor,
        borderRadius: BorderRadius.circular(borderRadius!),
      ),
      child: Row(
        mainAxisSize: expandWidth ? MainAxisSize.max : MainAxisSize.min,
        children: List.generate(
          toggleItems.length,
          (index) => Expanded(
            child: _buildToggleButton(
              index,
              toggleItems[index],
              defaultSelectedColor,
              defaultSelectedTextColor,
              defaultUnselectedTextColor,
              theme,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildToggleButton(
    int index,
    String text,
    Color defaultSelectedColor,
    Color defaultSelectedTextColor,
    Color defaultUnselectedTextColor,
    ThemeData theme,
  ) {
    final isSelected = currentIndex == index;

    return GestureDetector(
      onTap: () => onToggle(index),
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          color: isSelected
              ? (selectedColor ?? defaultSelectedColor)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(borderRadius!),
          boxShadow: isSelected
              ? [
                  BoxShadow(
                    color: theme.shadowColor.withOpacity(0.1),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  )
                ]
              : null,
        ),
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: isSelected
                ? (selectedTextColor ?? defaultSelectedTextColor)
                : (unselectedTextColor ?? defaultUnselectedTextColor),
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
