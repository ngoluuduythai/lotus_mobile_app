package com.example.main

import android.os.Bundle

import io.flutter.app.FlutterActivity
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity: FlutterActivity() {
  override fun onCreate(savedInstanceState: Bundle?) {
    super.onCreate(savedInstanceState)
    FacebookSdk.setApplicationId(getString(R.string.facebook_app_id))
    FacebookSdk.sdkInitialize(getApplicationContext());
    GeneratedPluginRegistrant.registerWith(this)
  }
}
