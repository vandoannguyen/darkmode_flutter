package io.flutter.plugins;

import io.flutter.plugin.common.PluginRegistry;
import com.shatsy.admobflutter.AdmobFlutterPlugin;
import de.esys.esysfluttershare.EsysFlutterSharePlugin;
import io.flutter.plugins.firebaseadmob.FirebaseAdMobPlugin;
import com.dataxad.fluttermailer.FlutterMailerPlugin;
import io.flutter.plugins.pathprovider.PathProviderPlugin;
import io.flutter.plugins.sharedpreferences.SharedPreferencesPlugin;

/**
 * Generated file. Do not edit.
 */
public final class GeneratedPluginRegistrant {
  public static void registerWith(PluginRegistry registry) {
    if (alreadyRegisteredWith(registry)) {
      return;
    }
    AdmobFlutterPlugin.registerWith(registry.registrarFor("com.shatsy.admobflutter.AdmobFlutterPlugin"));
    EsysFlutterSharePlugin.registerWith(registry.registrarFor("de.esys.esysfluttershare.EsysFlutterSharePlugin"));
    FirebaseAdMobPlugin.registerWith(registry.registrarFor("io.flutter.plugins.firebaseadmob.FirebaseAdMobPlugin"));
    FlutterMailerPlugin.registerWith(registry.registrarFor("com.dataxad.fluttermailer.FlutterMailerPlugin"));
    PathProviderPlugin.registerWith(registry.registrarFor("io.flutter.plugins.pathprovider.PathProviderPlugin"));
    SharedPreferencesPlugin.registerWith(registry.registrarFor("io.flutter.plugins.sharedpreferences.SharedPreferencesPlugin"));
  }

  private static boolean alreadyRegisteredWith(PluginRegistry registry) {
    final String key = GeneratedPluginRegistrant.class.getCanonicalName();
    if (registry.hasPlugin(key)) {
      return true;
    }
    registry.registrarFor(key);
    return false;
  }
}
