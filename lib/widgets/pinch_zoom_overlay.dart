import 'package:flutter/material.dart';

class PinchZoomOverlay extends StatefulWidget {
  final Widget child;

  const PinchZoomOverlay({super.key, required this.child});

  @override
  State<PinchZoomOverlay> createState() => _PinchZoomOverlayState();
}

class _PinchZoomOverlayState extends State<PinchZoomOverlay>
    with SingleTickerProviderStateMixin {

  OverlayEntry? _overlayEntry;

  double _scale = 1.0;
  Offset _offset = Offset.zero;

  bool _isZooming = false;

  late AnimationController _controller;
  late Animation<double> _scaleAnim;
  late Animation<Offset> _offsetAnim;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 260),
    );
  }

  /// Rubber band resistance like Instagram
  double _applyResistance(double scale) {
    const maxScale = 3.0;

    if (scale <= maxScale) return scale;

    final extra = scale - maxScale;

    return maxScale + (extra * 0.25);
  }

  void _createOverlay() {

    if (_overlayEntry != null) return;

    _overlayEntry = OverlayEntry(
      builder: (context) {

        final displayScale = _isZooming ? _scale : _scaleAnim.value;
        final displayOffset = _isZooming ? _offset : _offsetAnim.value;

        return IgnorePointer(
          child: Stack(
            children: [

              /// BACKGROUND DIM
              Positioned.fill(
                child: Container(
                  color: Colors.black.withOpacity(
                    ((_scale - 1) / 2).clamp(0, 0.6),
                  ),
                ),
              ),

              /// IMAGE
              Positioned.fill(
                child: Center(
                  child: Transform.translate(
                    offset: displayOffset,
                    child: Transform.scale(
                      scale: displayScale,
                      alignment: Alignment.center,
                      child: widget.child,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );

    Overlay.of(context).insert(_overlayEntry!);
  }

  void _removeOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  void _animateBack() {

    _scaleAnim = Tween<double>(
      begin: _scale,
      end: 1,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut,
      ),
    );

    _offsetAnim = Tween<Offset>(
      begin: _offset,
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeOut,
      ),
    );

    _isZooming = false;

    _controller.forward(from: 0).whenComplete(() {

      _removeOverlay();

      _scale = 1;
      _offset = Offset.zero;
    });
  }

  @override
  Widget build(BuildContext context) {

    return GestureDetector(

      onScaleStart: (_) {

        _isZooming = true;

        _createOverlay();
      },

      onScaleUpdate: (details) {

        _scale = _applyResistance(details.scale);

        _offset += details.focalPointDelta;

        _overlayEntry?.markNeedsBuild();
      },

      onScaleEnd: (_) {

        _animateBack();
      },

      child: widget.child,
    );
  }

  @override
  void dispose() {

    _controller.dispose();

    super.dispose();
  }
}