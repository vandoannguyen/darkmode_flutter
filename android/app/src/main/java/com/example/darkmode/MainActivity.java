package com.example.darkmode;

import android.os.Bundle;

import com.example.darkmode.utils.DarkmodeUtils;

import io.flutter.app.FlutterActivity;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        GeneratedPluginRegistrant.registerWith(this);

        DarkmodeUtils.changeUIMode(this, 2);
    }
}
