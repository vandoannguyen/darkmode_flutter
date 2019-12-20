package com.example.darkmode;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;

import com.example.darkmode.utils.DarkmodeUtils;

import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {
    final String CHANNEL = "com.example.darkmode";
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        GeneratedPluginRegistrant.registerWith(this);
        new MethodChannel(getFlutterView(),CHANNEL).setMethodCallHandler(new MethodChannel.MethodCallHandler() {
            @Override
            public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {
                Log.e("onMethodCall: ", methodCall.arguments.toString() );
                switch (methodCall.method){
                    case "changeTheme":{
                        DarkmodeUtils.changeUIMode(getApplicationContext(), methodCall.argument("code"));
                        break;
                    }
                    case "currentTheme":{
                      result.success(DarkmodeUtils.curentUiMode(getApplicationContext()));
                    }
                }
            }
        });

    }
}
