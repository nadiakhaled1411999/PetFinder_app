mixin PngAssets {
  static const String pngAssets = "assets/images/";
}

mixin SvgAssets {
  static const String svgAssets = "assets/svg/";
}

mixin VideoAssets {
  static const String videoAssets = "assets/videos/";
}

class AppAssets with PngAssets, SvgAssets, VideoAssets {
  // Image PNG
//   static const String adsImage = "${PngAssets.pngAssets}ads.png";
  static const String lovely = "${PngAssets.pngAssets}lovely.png";

 static const String dogAndCat = "${PngAssets.pngAssets}dogandcat.png";

static const String cat = "${PngAssets.pngAssets}cat.png";
static const String dog = "${PngAssets.pngAssets}dog.png";
static const String dog2= "${PngAssets.pngAssets}dog2.png";
static const String sunny="${PngAssets.pngAssets}sunny.png";











  // Icons SVG
//   static const String carSolidIcon = "${SvgAssets.svgAssets}car_solid.svg";
  static const String home1 = "${SvgAssets.svgAssets}home.svg";

// Video Assets
//   static const String testOnBoardingVideo =
//       "${VideoAssets.videoAssets}test.mp4";
}
