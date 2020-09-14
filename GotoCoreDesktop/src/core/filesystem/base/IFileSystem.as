/**
 * Created by varadig on 27/07/16.
 */
package core.filesystem.base {
import com.codecatalyst.promise.Promise;

import flash.filesystem.File;
import flash.utils.ByteArray;

public interface IFileSystem {
    function rename(file:File, to:Object):void;

    function getSubFolders(path:Object):Vector.<File>

    function getFiles(path:Object, filter:Vector.<String>):Vector.<File>

    function fileExists(path:Object):Boolean

    function folderExists(path:Object):Boolean

    function createFolder(path:Object):File

    function copyFile(from:Object, to:Object, append:Boolean = true):void

    function copyFileAsync(from:Object, to:Object, append:Boolean = true):Promise

    function copyFolder(from:Object, to:Object):void

    function copyFolderAsync(from:Object, to:Object):Promise

    function copyContent(from:Object, to:Object, isRecursive:Boolean = true):void

    function copyContentAsync(from:Object, to:Object, isRecursive:Boolean = true):Promise

    function writeFile(path:Object, content:Object, appendable:Boolean = false):File

    function writeFileAsync(path:Object, content:Object, appendable:Boolean = false):Promise

    function readTextFile(path:Object):String

    function readTextFileAsync(path:Object):Promise

    function readBinaryFile(path:Object):ByteArray

    function readBinaryFileAsync(path:Object):Promise;


    function deleteFolder(path:Object):File

    function deleteFolderAsync(path:Object):Promise

    function deleteFile(path:Object):File

    function deleteFileAsync(path:Object):Promise

    function readFile(path:String):File;
}
}
