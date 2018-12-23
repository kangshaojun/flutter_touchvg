#import "FlutterTouchvgPlugin.h"
#import "FlutterTouchvg.h"

@implementation FlutterTouchvgPlugin

+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
    FlutterTouchvgFactory* webviewFactory =
    [[FlutterTouchvgFactory alloc] initWithMessenger:registrar.messenger];
    [registrar registerViewFactory:webviewFactory withId:@"flutter_touchvg"];
}

@end
