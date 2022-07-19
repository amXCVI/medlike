package com.example.medlike

import io.flutter.embedding.android.FlutterActivity
import com.yandex.mapkit.MapKitFactory;

import androidx.annotation.NonNull
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity : FlutterActivity() {
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        MapKitInitializer.initialize("492944f6-afb1-4915-bebe-6a3639caf540")
        GeneratedPluginRegistrant.registerWith(flutterEngine)
        super.configureFlutterEngine(flutterEngine)
    }
}

object MapKitInitializer {
    private var initialized = false
    fun initialize(apiKey: String) {
        if (initialized) {
            return
        }
        MapKitFactory.setApiKey(apiKey)
        initialized = true
    }
}

//import androidx.annotation.NonNull
//import io.flutter.embedding.android.FlutterActivity
//import io.flutter.embedding.engine.FlutterEngine
//import io.flutter.plugins.GeneratedPluginRegistrant
//import com.yandex.mapkit.MapKitFactory
//
//class MainActivity: FlutterActivity() {
//    fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
//        MapKitFactory.setApiKey("492944f6-afb1-4915-bebe-6a3639caf540") // Your generated API key
//        super.configureFlutterEngine(flutterEngine)
//    }
//}
