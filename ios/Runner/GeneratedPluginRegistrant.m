//
//  Generated file. Do not edit.
//

#import "GeneratedPluginRegistrant.h"
#import <admob_flutter/AdmobFlutterPlugin.h>
#import <esys_flutter_share/EsysFlutterSharePlugin.h>
#import <firebase_admob/FirebaseAdMobPlugin.h>
#import <flutter_mailer/FlutterMailerPlugin.h>
#import <path_provider/PathProviderPlugin.h>
#import <shared_preferences/SharedPreferencesPlugin.h>

@implementation GeneratedPluginRegistrant

+ (void)registerWithRegistry:(NSObject<FlutterPluginRegistry>*)registry {
  [AdmobFlutterPlugin registerWithRegistrar:[registry registrarForPlugin:@"AdmobFlutterPlugin"]];
  [EsysFlutterSharePlugin registerWithRegistrar:[registry registrarForPlugin:@"EsysFlutterSharePlugin"]];
  [FLTFirebaseAdMobPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTFirebaseAdMobPlugin"]];
  [FlutterMailerPlugin registerWithRegistrar:[registry registrarForPlugin:@"FlutterMailerPlugin"]];
  [FLTPathProviderPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTPathProviderPlugin"]];
  [FLTSharedPreferencesPlugin registerWithRegistrar:[registry registrarForPlugin:@"FLTSharedPreferencesPlugin"]];
}

@end
