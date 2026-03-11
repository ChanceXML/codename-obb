package mobile.utils;

#if android
import android.os.Build;
import android.os.Environment;
import android.Settings;
import android.Permissions;
#end

class AndroidHelper {

    public static function checkStoragePermission():Void {
        #if android
        // Check if device is Android 11+ (API 30)
        if (Build.VERSION.SDK_INT >= 30) {
            
    
            if (!Environment.isExternalStorageManager()) {
                // Opens Menu
                Settings.requestSetting("MANAGE_APP_ALL_FILES_ACCESS_PERMISSION");
            }
            
        } else {
            // For Android 10 and below 
            Permissions.requestPermissions([
                Permissions.READ_EXTERNAL_STORAGE, 
                Permissions.WRITE_EXTERNAL_STORAGE
            ]);
        }
        #end
    }
}
