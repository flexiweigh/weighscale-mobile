import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/theme/app_colors.dart';

class SyncedValueField extends StatefulWidget {
  const SyncedValueField({
    super.key,
    required this.label,
    required this.value,
    required this.onChanged,
    this.allowDecimal = false,
  });

  final String label;
  final String value;
  final ValueChanged<String> onChanged;
  final bool allowDecimal;

  @override
  State<SyncedValueField> createState() => _SyncedValueFieldState();
}

class _SyncedValueFieldState extends State<SyncedValueField> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.value);
  }

  @override
  void didUpdateWidget(covariant SyncedValueField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.value != _controller.text) {
      _controller.value = TextEditingValue(
        text: widget.value,
        selection: TextSelection.collapsed(offset: widget.value.length),
      );
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(12, 8, 12, 4),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 12,
              color: AppColors.textSecondary,
            ),
          ),
          TextField(
            controller: _controller,
            onChanged: widget.onChanged,
            keyboardType: TextInputType.numberWithOptions(
              decimal: widget.allowDecimal,
            ),
            inputFormatters: [
              FilteringTextInputFormatter.allow(
                RegExp(widget.allowDecimal ? r'[0-9.]' : r'[0-9,]'),
              ),
            ],
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: AppColors.textPrimary,
            ),
            decoration: const InputDecoration(
              isDense: true,
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(vertical: 4),
            ),
          ),
        ],
      ),
    );
  }
}