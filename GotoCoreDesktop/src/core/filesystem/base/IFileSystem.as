/**
 * Created by varadig on 27/07/16.
 */
package core.filesystem.base {
import flash.filesystem.File;
import flash.utils.ByteArray;

public interface IFileSystem {
    function rename(file:File,to:Object):void;
    function getSubFolders(path:Object):Vector.<File>

    function getFiles(path:Object,filter:Vector.<String>):Vector.<File>

    function fileExists(path:Object):Boolean

    function folderExists(path:Object):Boolean

    function createFolder(path:Object):File

    function copyFile(from:Object, to:Object,append:Boolean=true):void

    function copyFolder(from:Object, to:Object):void

    function copyContent(from:Object, to:Object,isRecursive:Boolean=true):void

    function writeFile(path:Object, content:Object, appendable:Boolean = false):File

    function readTextFile(path:Object):String

    function readBinaryFile(path:Object):ByteArray

    function deleteFolder(path:Object):File

    function deleteFile(path:Object):File

    function readFile(path:String):File;
}
}
