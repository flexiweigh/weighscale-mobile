import 'package:flutter/widgets.dart';

class AppResumeListener extends StatefulWidget {
  const AppResumeListener({
    super.key,
    required this.onResume,
    required this.child,
  });

  final VoidCallback onResume;
  final Widget child;

  @override
  State<AppResumeListener> createState() => _AppResumeListenerState();
}

class _AppResumeListenerState extends State<AppResumeListener> {
  late final AppLifecycleListener _listener;

  @override
  void initState() {
    super.initState();
    _listener = AppLifecycleListener(onResume: () => widget.onResume());
  }

  @override
  void dispose() {
    _listener.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => widget.child;
}