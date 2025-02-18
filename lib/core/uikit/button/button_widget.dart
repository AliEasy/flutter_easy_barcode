import 'package:flutter/material.dart';
import 'package:flutter_easy_barcode/core/config/theme/theme.dart';

enum ButtonType { filled, text, outlined, map, dialog }

enum ButtonSize { expanded, wrap }

enum ButtonColor { primary, secondary }

class ButtonWidget extends StatelessWidget {
  final VoidCallback? onPressed;
  final String? label;
  final Widget? content;
  final bool isLoading;
  final ButtonSize buttonSize;
  final ButtonType buttonType;
  final bool unFocusOnPress;
  final double borderRadius;
  final ButtonColor buttonColor;
  final double height;

  const ButtonWidget.filled({
    super.key,
    this.onPressed,
    this.label,
    this.content,
    this.isLoading = false,
    this.buttonSize = ButtonSize.expanded,
    this.unFocusOnPress = true,
    this.borderRadius = 12,
    this.buttonColor = ButtonColor.primary,
    this.height = 56,
  }) : buttonType = ButtonType.filled;

  const ButtonWidget.text({
    super.key,
    this.onPressed,
    this.label,
    this.content,
    this.isLoading = false,
    this.buttonSize = ButtonSize.expanded,
    this.unFocusOnPress = true,
    this.borderRadius = 12,
    this.buttonColor = ButtonColor.primary,
    this.height = 56,
  }) : buttonType = ButtonType.text;

  const ButtonWidget.outlined({
    super.key,
    this.onPressed,
    this.label,
    this.content,
    this.isLoading = false,
    this.buttonSize = ButtonSize.expanded,
    this.unFocusOnPress = true,
    this.borderRadius = 12,
    this.buttonColor = ButtonColor.primary,
    this.height = 56,
  }) : buttonType = ButtonType.outlined;

  const ButtonWidget.map({
    super.key,
    this.onPressed,
    this.label,
    this.content,
    this.isLoading = false,
    this.buttonSize = ButtonSize.wrap,
    this.unFocusOnPress = true,
    this.borderRadius = 12,
    this.buttonColor = ButtonColor.primary,
    this.height = 56,
  }) : buttonType = ButtonType.map;

  const ButtonWidget.dialog({
    super.key,
    this.onPressed,
    this.label,
    this.content,
    this.isLoading = false,
    this.buttonSize = ButtonSize.wrap,
    this.unFocusOnPress = true,
    this.borderRadius = 0,
    this.buttonColor = ButtonColor.primary,
    this.height = 56,
  }) : buttonType = ButtonType.dialog;

  @override
  Widget build(BuildContext context) {
    bool enabled = onPressed != null;

    late Widget button;

    if (buttonType == ButtonType.filled) {
      late List<Color> gradiantColors;
      if (buttonColor == ButtonColor.primary) {
        if (enabled) {
          gradiantColors = [Theme.of(context).colorScheme.primary, Theme.of(context).colorScheme.secondary];
        } else {
          gradiantColors = [Theme.of(context).colorScheme.tertiaryContainer, Theme.of(context).colorScheme.tertiaryContainer];
        }
      } else if (buttonColor == ButtonColor.secondary) {
        gradiantColors = [Theme.of(context).colorScheme.tertiaryContainer.withOpacity(.5), Theme.of(context).colorScheme.tertiaryContainer.withOpacity(.5)];
      }

      button = AnimatedContainer(
        duration: const Duration(milliseconds: 700),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          gradient: LinearGradient(
            colors: gradiantColors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ElevatedButton(
          onPressed: onPressed != null
              ? () {
                  if (unFocusOnPress) {
                    FocusScope.of(context).unfocus();
                  }
                  onPressed!();
                }
              : null,
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
            ),
            backgroundColor: Colors.transparent,
            shadowColor: Colors.transparent,
          ),
          child: _buttonContent(context),
        ),
      );
    } else if (buttonType == ButtonType.text) {
      button = TextButton(
        onPressed: onPressed != null
            ? () {
                if (unFocusOnPress) {
                  FocusScope.of(context).unfocus();
                }
                onPressed!();
              }
            : null,
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          ),
        ),
        child: _buttonContent(context),
      );
    } else if (buttonType == ButtonType.outlined) {
      button = OutlinedButton(
        onPressed: onPressed != null
            ? () {
                if (unFocusOnPress) {
                  FocusScope.of(context).unfocus();
                }
                onPressed!();
              }
            : null,
        style: OutlinedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
            side: BorderSide(
              color: Theme.of(context).colorScheme.tertiaryContainer,
              width: 1,
            ),
          ),
        ),
        child: _buttonContent(context),
      );
    } else if (buttonType == ButtonType.map) {
      button = TextButton(
        onPressed: onPressed != null
            ? () {
                if (unFocusOnPress) {
                  FocusScope.of(context).unfocus();
                }
                onPressed!();
              }
            : null,
        style: TextButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          ),
        ),
        child: _buttonContent(context),
      );
    } else if (buttonType == ButtonType.dialog) {
      late Color backgroundColor;
      if (buttonColor == ButtonColor.primary) {
        backgroundColor = Theme.of(context).primary;
      } else {
        backgroundColor = Colors.white;
      }
      button = TextButton(
        onPressed: onPressed != null
            ? () {
                if (unFocusOnPress) {
                  FocusScope.of(context).unfocus();
                }
                onPressed!();
              }
            : null,
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
          ),
        ),
        clipBehavior: Clip.hardEdge,
        child: _buttonContent(context),
      );
    }

    if (buttonType == ButtonType.map) {
      return ConstrainedBox(
        constraints: const BoxConstraints.tightFor(height: 40, width: 40),
        child: button,
      );
    } else {
      return ConstrainedBox(
        constraints: BoxConstraints.tightFor(height: height),
        child: button,
      );
    }
  }

  Widget _buttonContent(BuildContext context) {
    late Widget contentWidget;
    if (isLoading) {
      contentWidget = const AspectRatio(aspectRatio: 1, child: CircularProgressIndicator());
    } else if (label?.isNotEmpty ?? false) {
      contentWidget = Text(
        label!,
        style: Theme.of(context).textTheme.labelLarge?.copyWith(color: (buttonColor == ButtonColor.primary) ? Colors.white : Colors.black),
      );
    } else if (content != null) {
      contentWidget = content!;
    } else {
      contentWidget = const SizedBox();
    }

    if (buttonSize == ButtonSize.expanded) {
      contentWidget = Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          contentWidget,
        ],
      );
    }

    return contentWidget;
  }
}
