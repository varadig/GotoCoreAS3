/**
 * Created by varadig on 1/29/15.
 */
package core.utils {
import core.base.CoreBaseClass;

public class CoreStringUtils extends CoreBaseClass {
    public function CoreStringUtils() {
        super();
    }

    public static function getFullFileName(url:String):String {
        var fileWithExtension:RegExp = /(?<=\/)(\w+)((\.\w+(?=\?))|(\.\w+)$)/g;
        return url.match(fileWithExtension)[0];

    }

    public static function getDirectories(url:String):Array {
        var directoriesPattern:RegExp = /(?<=\/)(\w+)(?=\/)/g;
        return url.match(directoriesPattern);
    }

    public static function getFilename(url:String):String {
        var directoriesPattern:RegExp = /(?<=\/)(\w+)(?=\/)/g;
        return url.match(directoriesPattern)[0];
    }

    public static function getExtension(url:String):String {
        var fileExtensionPattern:RegExp = /(?!\/\w+\.)(\w+$)|(?!\/\w+\.)(\w+)(?=\?.*$)/g;
        return url.match(fileExtensionPattern)[0];
    }

    public static function maximizeLength(input:String, length:int):String {
        if (input.length <= length)
            return input;
        var maximized:String = "";
        for (var j:int = 0; j < length; j++)
            maximized += input.charAt(j);
        maximized += "...";
        return maximized;
    }
}
}
