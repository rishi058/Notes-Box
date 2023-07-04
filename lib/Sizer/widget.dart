part of sizer;

/// Provides `Context`, `Orientation`, and `DeviceType` parameters to the builder function
typedef ResponsiveBuild = Widget Function(
  BuildContext context,
  Orientation orientation,
  DeviceType deviceType,
);

/// A widget that gets the device's details like orientation and constraints
///
/// Usage: Wrap MaterialApp with this widget
class Sizer extends StatefulWidget {
  const Sizer({Key? key, required this.builder, required this.context}) : super(key: key);

  /// Builds the widget whenever the orientation changes
  final ResponsiveBuild builder;
  final BuildContext context;

  @override
  State<Sizer> createState() => _SizerState();
}

class _SizerState extends State<Sizer> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        SizerUtil.setScreenSize(widget.context, constraints, orientation);
        return widget.builder(widget.context, orientation, SizerUtil.deviceType);
      });
    });
  }
}
