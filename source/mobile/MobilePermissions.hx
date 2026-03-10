package mobile;

#if android
import extension.androidtools.os.Build;
import extension.androidtools.os.Build.VERSION_CODES;
import extension.androidtools.Permissions;
import extension.androidtools.os.Environment;
import extension.androidtools.Settings;

class MobilePermissions
{
    public static function request():Void
    {
        var perms:Array<String>;

        if (Build.SDK_INT >= VERSION_CODES.TIRAMISU) {
            perms = [
                "android.permission.READ_MEDIA_IMAGES",
                "android.permission.READ_MEDIA_VIDEO",
                "android.permission.READ_MEDIA_AUDIO"
            ];
        } else {
            perms = [
                "android.permission.READ_EXTERNAL_STORAGE",
                "android.permission.WRITE_EXTERNAL_STORAGE"
            ];
        }

        Permissions.requestPermissions(perms);

        if (Build.SDK_INT >= VERSION_CODES.R) {
            if (!Environment.isExternalStorageManager()) {
                Settings.requestSetting("android.settings.MANAGE_APP_ALL_FILES_ACCESS_PERMISSION");
            }
        }
    }
}
#end
