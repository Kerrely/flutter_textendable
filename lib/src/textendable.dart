import 'package:flutter/material.dart';
import 'package:textendable/src/textendable_toggle.dart';

class Textendable extends StatefulWidget {
  /// Provide [scrollController] if you wish to use this widget in complex
  /// scrolling use-cases
  final ScrollController? scrollController;

  /// Maximum number of lines in collapsed state.
  /// ### Defaults to 5
  final int collapsedMaxNumOfLines;

  final TextStyle? textStyle;

  /// Initial state of the [Textendable].
  /// ### Defaults to false
  final bool extended;

  /// Builder for custom toggle button.
  ///   - Use given [toggleCallback] to trigger the expand/collapse event.
  ///   - [isExtended] provides the information about current state of
  ///   the [Textendable]
  ///
  /// ### Uses default toggle button if not provided.
  final Widget Function(
    VoidCallback toggleCallback,
    bool isExtended,
  )? toggleBuilder;

  const Textendable({
    required this.text,
    this.collapsedMaxNumOfLines = 5,
    this.extended = false,
    this.scrollController,
    this.textStyle,
    this.toggleBuilder,
    Key? key,
  }) : super(key: key);

  final String text;

  @override
  TextendableState createState() => TextendableState();
}

class TextendableState extends State<Textendable>
    with TickerProviderStateMixin {
  late bool extended = widget.extended;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: widget.scrollController,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          AnimatedSize(
            duration: const Duration(milliseconds: 350),
            alignment: Alignment.topCenter,
            curve: Curves.fastOutSlowIn,
            child: Text(
              widget.text,
              maxLines: extended ? null : widget.collapsedMaxNumOfLines,
              style: widget.textStyle,
              overflow: extended ? null : TextOverflow.ellipsis,
            ),
          ),
          widget.toggleBuilder?.call(toggle, extended) ??
              TextendableToggle(onToggle: toggle)
        ],
      ),
    );
  }

  void toggle() {
    setState(() {
      extended = !extended;
    });
  }
}
