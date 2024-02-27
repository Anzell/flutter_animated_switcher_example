import 'package:flutter/material.dart';

class SplashApp extends StatefulWidget {
  const SplashApp({
    super.key,
    required this.initDependencies,
    required this.appWidget,
  });

  final MaterialApp appWidget;
  final Function initDependencies;

  @override
  State<SplashApp> createState() => _SplashAppState();
}

class _SplashAppState extends State<SplashApp> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _isReady = false;
  bool _isSplashDisposed = false;

  @override
  void initState() {
    super.initState();
    _initAnimationController();
    _initDependencies().ignore();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _initAnimationController() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.fastOutSlowIn,
    );
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        setState(() {
          _isSplashDisposed = true;
        });
      }
    });
  }

  Future<void> _initDependencies() async {
    await widget.initDependencies();
    setState(() {
      _isReady = true;
    });
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      textDirection: TextDirection.ltr,
      children: [
        if (!_isSplashDisposed)
          const Directionality(
            textDirection: TextDirection.ltr,
            child: Scaffold(
              backgroundColor: Colors.red,
              body: Center(
                child: FlutterLogo(),
              ),
            ),
          ),
        if (_isReady)
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return FadeTransition(
                opacity: _animation,
                child: ScaleTransition(scale: _animation, child: widget.appWidget),
              );
            },
          ),
      ],
    );
  }
}
