package com.example.darkmode;

import android.Manifest;
import android.app.WallpaperManager;
import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.graphics.Bitmap;
import android.graphics.BitmapFactory;
import android.net.Uri;
import android.os.AsyncTask;
import android.os.Build;
import android.os.Bundle;
import android.os.Environment;
import android.util.Log;
import android.widget.Toast;

import androidx.core.app.ActivityCompat;
import androidx.core.content.ContextCompat;

import com.example.darkmode.utils.DarkmodeUtils;
import com.example.ratedialog.RatingDialog;
import com.example.ratedialog.utils.SharedPrefsUtils;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;

import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity implements RatingDialog.RatingDialogInterFace {
    final String CHANNEL = "com.example.darkmode";
    private String currentFileName = "";
    String selectOption="";
    String folderName = Environment.getExternalStorageDirectory().getPath() + "/Android/data/com.example.darkmode/files/";

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        GeneratedPluginRegistrant.registerWith(this);
        new MethodChannel(getFlutterView(), CHANNEL).setMethodCallHandler(new MethodChannel.MethodCallHandler() {
            @Override
            public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {
//                Log.e("onMethodCall: ", methodCall.arguments.toString() );
                switch (methodCall.method) {
                    case "changeTheme": {
                        DarkmodeUtils.changeUIMode(getApplicationContext(), methodCall.argument("code"));
                        Toast.makeText(MainActivity.this, "Set theme is done !", Toast.LENGTH_SHORT).show();
                        break;
                    }
                    case "rateManual": {
                        rateManual();
                        break;
                    }
                    case "currentTheme": {
                        result.success(DarkmodeUtils.curentUiMode(getApplicationContext()));
                    }
                    case "app_version": {
                        Toast.makeText(MainActivity.this, "App version: " + BuildConfig.VERSION_NAME, Toast.LENGTH_SHORT).show();
                    }
                    case "setWallpaper": {
                        int index = methodCall.argument("index");
                        String category = methodCall.argument("category");
                        selectOption = methodCall.argument("option");
                        if(category.equals("l")) folderName+="light/";
                        else folderName+="dark/";
                        setWallpaper(index + ".jpg");
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

    private void setWallpaper(String fileName) {
        currentFileName = fileName;
        if (!checkStogarePermission())
            requestStogarePermission();
        else {
            saveImage(currentFileName, selectOption);
        }

    }

    private boolean checkStogarePermission() {
        return ContextCompat.checkSelfPermission(MainActivity.this, Manifest.permission.READ_EXTERNAL_STORAGE)
                == PackageManager.PERMISSION_GRANTED
                && ContextCompat.checkSelfPermission(MainActivity.this, Manifest.permission.READ_EXTERNAL_STORAGE)
                == PackageManager.PERMISSION_GRANTED;
    }

    private void requestStogarePermission() {
        ActivityCompat.requestPermissions(MainActivity.this,
                new String[]{Manifest.permission.WRITE_EXTERNAL_STORAGE, Manifest.permission.READ_EXTERNAL_STORAGE},
                11);
    }

    @Override
    public void onRequestPermissionsResult(int requestCode, String[] permissions, int[] grantResults) {
        super.onRequestPermissionsResult(requestCode, permissions, grantResults);
        if (requestCode == 11) {
            if (checkStogarePermission()) {
                saveImage(currentFileName,selectOption);
            }
        }
    }

    private void saveImage(String currentFileName, String option) {
        String path = folderName;
        String filePath = path + currentFileName;
        Log.e("saveImage: ", filePath );
        File folder = new File(path);
        InputStream inputStream = null;
        OutputStream outStream = null;
        if (!folder.exists()) folder.mkdirs();
//        String option = methodCall.argument("option");
        try {
            inputStream = getAssets().open("wallpaper/" + (path.contains("light") ? "light/" : "dark/") + currentFileName);
            File targetFile = new File(filePath);
            outStream = new FileOutputStream(targetFile);
            byte[] buffer = new byte[8 * 1024];
            int bytesRead;
            while ((bytesRead = inputStream.read(buffer)) != -1) {
                outStream.write(buffer, 0, bytesRead);
            }
            Log.e("setWallpaper: ", "suggage");
        } catch (Exception e) {
            Toast.makeText(this, "Error to save image!!", Toast.LENGTH_SHORT).show();
            Log.e("setWallpaper: ", e.getMessage());
            this.currentFileName = null;
            e.printStackTrace();
        } finally {
            try {
                if (outStream != null) outStream.close();

                if (inputStream != null) inputStream.close();
            } catch (IOException e) {
                e.printStackTrace();
            }
        }
        Bitmap bitmap = BitmapFactory.decodeFile(filePath);
        WallpaperAsy wallpaperAsy =  new WallpaperAsy(this, option);
        wallpaperAsy.setOnChangeResultListener(new WallpaperAsy.OnChangeResultListener() {
            @Override
            public void onResult(boolean check) {
                if(!check) Toast.makeText(MainActivity.this, "Error to set Wallpaper", Toast.LENGTH_SHORT).show();
                else Toast.makeText(MainActivity.this, "Set Wallpaper success.", Toast.LENGTH_SHORT).show();
            }
        });
        if (bitmap != null) {
            wallpaperAsy.execute(bitmap);
        }
    }
}
class WallpaperAsy extends AsyncTask<Bitmap, Void, Void> {
    private WallpaperManager mWallpaperManager;
    private String option;
    private boolean check = false;
    WallpaperManager wallpaperManager;
    private OnChangeResultListener onChangeResultListener;
    Context context;



    public WallpaperAsy(Context context, String option) {
        this.context = context;
        wallpaperManager = WallpaperManager.getInstance(context);
        this.option = option;
    }

    @Override
    protected Void doInBackground(Bitmap... bitmaps) {
        try {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N) {
                if (option.equals("Home")) {
                    wallpaperManager.setBitmap(bitmaps[0], null, true, WallpaperManager.FLAG_SYSTEM);
                }
                if (option.equals("Lock")) {
                    wallpaperManager.setBitmap(bitmaps[0], null, true, WallpaperManager.FLAG_LOCK);
                }
                if (option.equals("Both")) {
                    wallpaperManager.setBitmap(bitmaps[0], null, true, WallpaperManager.FLAG_LOCK);
                    wallpaperManager.setBitmap(bitmaps[0], null, true, WallpaperManager.FLAG_SYSTEM);
                }
                check = true;
            } else
            {
                check= false;
                wallpaperManager.setBitmap(bitmaps[0]);
//                Toast.makeText(context, "Lock screen wallpaper not supported",
//                        Toast.LENGTH_SHORT).show();
            }

        } catch (IOException e) {
            e.printStackTrace();
            check = false;
        }
        return null;
    }

    @Override
    protected void onPostExecute(Void aVoid) {
        super.onPostExecute(aVoid);
        onChangeResultListener.onResult(check);
        Log.e( "onPostExecute: ","asdaskldjalsdjlaksd" + check );
    }
    public  interface OnChangeResultListener{
       void onResult(boolean check);
    }
    public void setOnChangeResultListener(OnChangeResultListener onChangeResultListener) {
        this.onChangeResultListener = onChangeResultListener;
    }
}
