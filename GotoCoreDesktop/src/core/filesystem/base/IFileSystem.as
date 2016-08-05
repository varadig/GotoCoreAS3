/**
 * Created by varadig on 27/07/16.
 */
package core.filesystem.base {
import flash.filesystem.File;
import flash.utils.ByteArray;

public interface IFileSystem {
    function getSubFolders(path:String):Vector.<String>

    function getFiles(path:Object):Vector.<String>

    function fileExists(path:String):Boolean

    function folderExists(path:String):Boolean

    function createFolder(path:Object):File

    function copyFile(from:Object, to:Object):void

    function copyFolder(from:Object, to:Object):void

    function writeFile(path:Object, content:Object, appendable:Boolean = false):File

    function readTextFile(path:Object):String

    function readBinaryFile(path:Object):ByteArray

    function deleteFolder(path:Object):File

    function deleteFile(path:Object):File

    function readFile(path:String):File;
}
}
