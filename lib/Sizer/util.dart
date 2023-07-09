part of sizer;

class SizerUtil {
  /// Device's BoxConstraints
  static late BoxConstraints boxConstraints;

  /// Device's Orientation
  static late Orientation orientation;

  /// Type of Device
  ///
  /// This can either be mobile or tablet
  static late DeviceType deviceType;

  /// Device's Height
  static late double height;

  /// Device's Width
  static late double width;

  static late double figmaWidth;
  static late double figmaHeight;

  /// Sets the Screen's size and Device's Orientation,
  /// BoxConstraints, Height, and Width
  static void setScreenSize(
      BuildContext context,
      BoxConstraints constraints, Orientation currentOrientation) {
    // Sets boxConstraints and orientation
    boxConstraints = constraints;
    orientation = currentOrientation;

    width = MediaQuery.of(context).size.width;
    height = width*2;

    figmaWidth = 375;
    figmaWidth = 812;

    if(kDebugMode){
      print('width==');
      print(width);
      print('height == ');
      print(width*2);
    }
    // late double AR = width/height;
    //
    // if(AR<=0.45){
    //   height = ; // for 9:16 aspect ratio....
    // }

    // Sets screen width and height
    // if (orientation == Orientation.portrait|| kIsWeb) {
    //   width = boxConstraints.maxWidth;
    //   height = boxConstraints.maxHeight;
    // } else {
    //   width = boxConstraints.maxHeight;
    //   height = boxConstraints.maxWidth;
    // }

    // Sets ScreenType
    if (kIsWeb) {
      deviceType = DeviceType.web;
    } else if (Platform.isAndroid || Platform.isIOS) {
      if ((orientation == Orientation.portrait && width < 600) ||
          (orientation == Orientation.landscape && height < 600)) {
        deviceType = DeviceType.mobile;
      } else {
        deviceType = DeviceType.tablet;
      }
    } else if (Platform.isMacOS) {
      deviceType = DeviceType.mac;
    } else if (Platform.isWindows) {
      deviceType = DeviceType.windows;
    } else if (Platform.isLinux) {
      deviceType = DeviceType.linux;
    } else {
      deviceType = DeviceType.fuchsia;
    }
  }

  //for responsive web
  static getWebResponsiveSize({smallSize, mediumSize, largeSize}) {
    return width < 600
        ? smallSize //'phone'
        : width >= 600 && width <= 1024
        ? mediumSize //'tablet'
        : largeSize; //'desktop';
  }
}

/// Type of Device
///
/// This can be either mobile or tablet
enum DeviceType { mobile, tablet, web, mac, windows, linux, fuchsia }
