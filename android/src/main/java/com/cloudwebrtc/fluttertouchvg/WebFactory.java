package com.cloudwebrtc.fluttertouchvg;

import android.content.Context;
import io.flutter.plugin.common.StandardMessageCodec;
import io.flutter.plugin.platform.PlatformView;
import io.flutter.plugin.platform.PlatformViewFactory;

import static io.flutter.plugin.common.PluginRegistry.Registrar;

public class WebFactory extends PlatformViewFactory {

    private final Registrar mPluginRegistrar;

    public WebFactory(Registrar registrar) {
        super(StandardMessageCodec.INSTANCE);
        mPluginRegistrar = registrar;
    }

    @Override
    public PlatformView create(Context context, int i, Object o) {
        return new FlutterTouchvg(context, mPluginRegistrar, i);
    }

}
