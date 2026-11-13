import 'package:flutter/material.dart';

import '../../../core/l10n/l10n_extension.dart';

Future<String?> showShopNameDialog(BuildContext context, String current) {
  return showDialog<String>(
    context: context,
    builder: (_) => _ShopNameDialog(initial: current),
  );
}

class _ShopNameDialog extends StatefulWidget {
  const _ShopNameDialog({required this.initial});

  final String initial;

  @override
  State<_ShopNameDialog> createState() => _ShopNameDialogState();
}

class _ShopNameDialogState extends State<_ShopNameDialog> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController(text: widget.initial);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _submit() {
    final value = _controller.text.trim();
    Navigator.of(context).pop(value.isEmpty ? null : value);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return AlertDialog(
      title: Text(l10n.settingsShopName),
      content: TextField(
        controller: _controller,
        autofocus: true,
        maxLength: 40,
        textInputAction: TextInputAction.done,
        onSubmitted: (_) => _submit(),
        decoration: const InputDecoration(border: OutlineInputBorder()),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(l10n.commonCancel),
        ),
        FilledButton(
          onPressed: _submit,
          child: Text(l10n.commonSave),
        ),
      ],
    );
  }
}