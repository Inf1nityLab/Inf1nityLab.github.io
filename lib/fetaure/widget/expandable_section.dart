import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import 'section_header.dart';
import '../../core/helpers/announce_helper.dart';


class ExpandableSection extends StatefulWidget {
  final String title;
  final Widget child;
  final bool initiallyExpanded;
  final Duration duration;
  final IconData? icon;
  final ValueChanged<bool>? onToggle;

  const ExpandableSection({
    super.key,
    required this.title,
    required this.child,
    this.initiallyExpanded = false,
    this.duration = const Duration(milliseconds: 200),
    this.icon,
    this.onToggle,
  });

  @override
  State<ExpandableSection> createState() => _ExpandableSectionState();
}

class _ExpandableSectionState extends State<ExpandableSection> with SingleTickerProviderStateMixin {
  late bool _isOpen;
  late AnimationController _controller;
  late Animation<double> _turns;

  @override
  void initState() {
    super.initState();
    _isOpen = widget.initiallyExpanded;
    _controller = AnimationController(vsync: this, duration: widget.duration, value: _isOpen ? 1.0 : 0.0);
    _turns = Tween<double>(begin: 0.0, end: 0.5).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  @override
  void didUpdateWidget(covariant ExpandableSection oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.duration != widget.duration) {
      _controller.duration = widget.duration;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggle() {
    setState(() {
      _isOpen = !_isOpen;
      if (_isOpen) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
    widget.onToggle?.call(_isOpen);

    // Локализованное объявление об изменении состояния секции
    final code = Localizations.localeOf(context).languageCode;
    final String message;
    if (code == 'ky') {
      message = _isOpen
          ? '"${widget.title}" бөлүмү ачылды'
          : '"${widget.title}" бөлүмү жабылды';
    } else {
      message = _isOpen
          ? 'Секция "${widget.title}" открыта'
          : 'Секция "${widget.title}" свернута';
    }
    AnnounceHelper.announcePolite(message);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(
          title: widget.title,
          onTap: _toggle,
          trailing: Semantics(
            button: true,
            label: _isOpen ? 'Свернуть секцию' : 'Развернуть секцию',
            child: RotationTransition(
              turns: _turns,
              child: Icon(
                widget.icon ?? Icons.keyboard_arrow_down_rounded,
                color: AppColors.primary,
                size: 26,
              ),
            ),
          ),
        ),
        const SizedBox(height: 6),
        ClipRect(
          child: AnimatedSize(
            duration: widget.duration,
            curve: Curves.easeInOut,
            child: ConstrainedBox(
              constraints: _isOpen
                  ? const BoxConstraints()
                  : const BoxConstraints(maxHeight: 0.0),
              child: Padding(
                padding: const EdgeInsets.only(top: 6.0),
                child: Opacity(
                  opacity: _isOpen ? 1.0 : 0.0,
                  child: widget.child,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}


