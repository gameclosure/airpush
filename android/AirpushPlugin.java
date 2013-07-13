package com.tealeaf.plugin.plugins;

import android.content.pm.PackageInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import com.tealeaf.logger;
import com.tealeaf.TeaLeaf;
import com.tealeaf.plugin.IPlugin;
import java.io.*;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import com.tealeaf.util.HTTP;
import java.net.URI;
import android.app.Activity;
import android.content.Intent;
import android.content.Context;
import android.util.Log;
import android.os.Bundle;
import android.content.pm.ActivityInfo;
import android.content.pm.PackageManager;
import android.content.pm.PackageManager.NameNotFoundException;
import android.content.SharedPreferences;
import java.util.HashMap;
import java.util.Map;
import java.util.Iterator;

import AIRPUSH_PACKAGE.Airpush;
import AIRPUSH_PACKAGE.AdCallbackListener;


public class AirpushPlugin implements IPlugin, AdCallbackListener {
    Activity activity;
	Context context;

	Airpush airpush;

	@Override
		public void onSDKIntegrationError(String message) {
			//Here you will receive message from SDK if it detects any integration issue.
		}

	@Override
		public void onSmartWallAdShowing() {
			// This will be called by SDK when it’s showing any of the SmartWall ad.
		}

	@Override
		public void onSmartWallAdClosed() {
			// This will be called by SDK when the SmartWall ad is closed.
		}

	@Override
		public void onAdError(String message) {
			//This will get called if any error occurred during ad serving.
		}

    public AirpushPlugin() {

    }

    public void onCreateApplication(Context applicationContext) {
		context = applicationContext;
    }

    public void onCreate(Activity activity, Bundle savedInstanceState) {
        this.activity = activity;

		airpush = new Airpush(context, this);
		airpush.startPushNotification(false);

		String airpushPackage = "AIRPUSH_PACKAGE";

		logger.log("{airpush} Initialized with package:", airpushPackage);
    }

    public void onResume() {

    }

    public void onPause() {

    }

    public void onStart() {
    }

    public void onStop() {
    }

    public void onDestroy() {
    }

    public void onNewIntent(Intent intent) {

    }

    public void setInstallReferrer(String referrer) {

    }

    public void onActivityResult(Integer request, Integer result, Intent data) {

    }

    public boolean consumeOnBackPressed() {
        return true;
    }

    public void onBackPressed() {
    }
}
