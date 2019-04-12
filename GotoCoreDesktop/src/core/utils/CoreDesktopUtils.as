/**
 * Created by varadig on 28/07/14.
 */
package core.utils {
import flash.desktop.NativeApplication;
import flash.filesystem.File;

public class CoreDesktopUtils extends CoreUtils {

    public static function get availableKb():int {
        return (File.applicationStorageDirectory.spaceAvailable / CoreUnits.KILOBYTE_IN_BYTE);
    }

    public static function get availableMb():int {
        return File.applicationStorageDirectory.spaceAvailable / CoreUnits.MEGABYTE_IN_BYTE;
//        return (spaceAvailable / CoreUnits.MEGABYTE_IN_BYTE);
    }

    public static function get availableGb():int {
        return (File.applicationStorageDirectory.spaceAvailable / CoreUnits.GIGABYTE_IN_BYTE);
    }

    public static function get availableTb():int {
        return (File.applicationStorageDirectory.spaceAvailable / CoreUnits.TERABYTE_IN_BYTE);
    }

    public static function get appVersion():String{
        var xml : XML = NativeApplication.nativeApplication.applicationDescriptor;
        var ns : Namespace = xml.namespace();
        return xml.ns::versionNumber;
    }
    public static function get appName():String{
        var xml : XML = NativeApplication.nativeApplication.applicationDescriptor;
        var ns : Namespace = xml.namespace();
        return xml.ns::name;
    }
}
}
