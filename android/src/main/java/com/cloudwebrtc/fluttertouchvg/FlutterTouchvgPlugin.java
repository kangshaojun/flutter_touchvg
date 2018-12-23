package com.cloudwebrtc.fluttertouchvg;

import io.flutter.plugin.common.PluginRegistry.Registrar;

/** FlutterTouchvgPlugin */
public class FlutterTouchvgPlugin {

  /** Registering viewfactory */
  public static void registerWith(Registrar registrar) {
    registrar
            .platformViewRegistry()
            .registerViewFactory(
                    "flutter_touchvg", new WebFactory(registrar));
  }
}
