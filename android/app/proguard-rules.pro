# Supabase / Ktor / OkHttp
-keep class io.github.jan.supabase.** { *; }
-keep class io.ktor.** { *; }
-dontwarn io.ktor.**

# OkHttp
-dontwarn okhttp3.**
-keep class okhttp3.** { *; }

# Kotlin Coroutines
-keepnames class kotlinx.coroutines.internal.MainDispatcherFactory {}
-keepnames class kotlinx.coroutines.CoroutineExceptionHandler {}

# Serialization
-keepattributes *Annotation*, InnerClasses
-dontnote kotlinx.serialization.AnnotationsKt
-keep class kotlinx.serialization.** { *; }

# ✅ Keep Paymob SDK — لازم تحطّها عشان الـ release build ميكسرش الـ SDK
-keep class com.paymob.** { *; }
-dontwarn com.paymob.**

# ✅ Keep DataBinding
-keep class androidx.databinding.** { *; }
