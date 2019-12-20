package com.example.darkmode;

import android.content.Context;
import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.util.Log;
import android.widget.Toast;

import com.example.darkmode.utils.DarkmodeUtils;
import com.example.ratedialog.RatingDialog;
import com.example.ratedialog.utils.SharedPrefsUtils;

import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.BinaryMessenger;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity implements RatingDialog.RatingDialogInterFace {
    final String CHANNEL = "com.example.darkmode";
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        GeneratedPluginRegistrant.registerWith(this);
        new MethodChannel(getFlutterView(),CHANNEL).setMethodCallHandler(new MethodChannel.MethodCallHandler() {
            @Override
            public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {
//                Log.e("onMethodCall: ", methodCall.arguments.toString() );
                switch (methodCall.method){
                    case "changeTheme":{
                        DarkmodeUtils.changeUIMode(getApplicationContext(), methodCall.argument("code"));
                        Toast.makeText(MainActivity.this, "Set theme is done !", Toast.LENGTH_SHORT).show();
                        break;
                    }
                    case "rateManual": {
                        rateManual();
                        break;
                    }
                    case "currentTheme":{
                      result.success(DarkmodeUtils.curentUiMode(getApplicationContext()));
                    }
                    case "app_version":{
                        Toast.makeText(MainActivity.this, "App version: " + BuildConfig.VERSION_NAME, Toast.LENGTH_SHORT).show();
                    }
                }
            }
        });
    }
    public static void rateApp(Context context) {
        Intent intent = new Intent(new Intent(Intent.ACTION_VIEW,
                Uri.parse("http://play.google.com/store/apps/details?id=" + context.getPackageName())));
        intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK | Intent.FLAG_ACTIVITY_CLEAR_TOP);
        intent.setFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        context.startActivity(intent);
    }
    private void rateAuto() {
        Log.e("tag", "rateAuto: ");
        int rate = SharedPrefsUtils.getInstance(this).getInt("rate");
        if (rate < 1) {
            RatingDialog ratingDialog = new RatingDialog(this);
            ratingDialog.setRatingDialogListener(this);
            ratingDialog.showDialog();
        }

    }

    private void rateManual() {
        Log.e("tag", "rateManual: ");
        RatingDialog ratingDialog = new RatingDialog(this);
        ratingDialog.setRatingDialogListener(this);
        ratingDialog.showDialog();
    }

    @Override
    public void onDismiss() {
    }

    @Override
    public void onSubmit(float rating) {
        if (rating > 3) {
            rateApp(this);
            SharedPrefsUtils.getInstance(this).putInt("rate", 5);
        }
    }

    @Override
    public void onRatingChanged(float rating) {
    }
}
