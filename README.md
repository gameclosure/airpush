# Game Closure DevKit Plugin: Airpush

Airpush only supports Android build targets.

## Usage

Create an Airpush publisher account and on the Dashboard download the SDK JAR file.  It will be named something like `com-lcmpvmsb-rildpnrr154767.jar`.  Rename this to `airpush.jar` and place it in your game's root folder next to `manifest.json`.

NOTE: When you build the SDK be sure not to uncheck the "highly recommended" checkmark options or it will fail to build.

Install the plugin with `basil install airpush`.

Include it in the `manifest.json` file under the "addons" section for your game:

~~~
"addons": [
	"airpush"
],
~~~

Under the Android section, you can configure the Airpush plugin:

~~~
	"android": {
		"versionCode": 1,
		"icons": {
			"36": "resources/icons/android36.png",
			"48": "resources/icons/android48.png",
			"72": "resources/icons/android72.png",
			"96": "resources/icons/android96.png"
		},
		"airpushAppID": "12345",
		"airpushAPIKey": "1373671179154767301",
		"airpushPackage": "com.lcmpvmsb.rildpnrr154767"
	}
~~~

## Testing

To test for successful integration, build your game:

~~~
basil debug native-android --clean --open
~~~

Then watch logcat:

~~~
adb logcat | grep -i airpush
~~~

If Airpush is hooked up properly, you'll see something like this:

~~~
E/JS      (26038): {plugins} Instantiated: com.tealeaf.plugin.plugins.AirpushPlugin
I/AirpushSDK(26038): SDK enabled: true
~~~

Look out for warnings in the console that indicates a problem with your setup.