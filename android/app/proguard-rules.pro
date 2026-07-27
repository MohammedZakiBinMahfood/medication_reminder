# Flutter
-keep class io.flutter.app.** { *; }
-keep class io.flutter.plugin.**  { *; }
-keep class io.flutter.util.**  { *; }
-keep class io.flutter.view.**  { *; }
-keep class io.flutter.**  { *; }
-keep class io.flutter.plugins.**  { *; }

# flutter_local_notifications
-keep class com.dexterous.flutterlocalnotifications.** { *; }
-keepclassmembers class * extends com.dexterous.flutterlocalnotifications.** { *; }

# Isar
-keep class isar.** { *; }
-keep class io.isar.** { *; }
-keepnames class * extends io.isar.core.IsarCollection
-keepclassmembers class * {
    @io.isar.Keep <fields>;
}

# dart_mappable
-keep class **.mapper.dart { *; }
-keep class **.mapper.g.dart { *; }

# Keep annotations
-keepattributes RuntimeVisibleAnnotations
-keepattributes AnnotationDefault

# General rules
-dontwarn javax.annotation.**
-dontwarn sun.misc.Unsafe
-dontwarn org.codehaus.mojo.animal_sniffer.**

# Play Store split / deferred components rules
-dontwarn com.google.android.play.core.**
