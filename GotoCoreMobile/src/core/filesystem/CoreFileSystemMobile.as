/**
 * Created by varadig on 02/01/17.
 */
package core.filesystem {
import core.filesystem.base.CoreBaseFileSystem;
import core.filesystem.base.IFileSystem;

import flash.filesystem.File;
import flash.filesystem.FileMode;
import flash.filesystem.FileStream;
import flash.permissions.PermissionStatus;
import flash.utils.ByteArray;

public class CoreFileSystemMobile extends CoreBaseFileSystem implements IFileSystem {
    public function CoreFileSystemMobile() {
        super();
    }

    public function getSubFolders(path:String):Vector.<String> {
        if (!this.folderExists(path))
            return new Vector.<String>();

        var folder:File = new File(path);
        var list:Array = folder.getDirectoryListing();


        var folders:Vector.<String> = new Vector.<String>();

        for each (var item:File in list) {
            if (item.isDirectory)
                folders.push(folder.getRelativePath(item));
        }
        return folders;
    }

    public function getFiles(path:Object):Vector.<String> {
        var folder:File = this.parsePath(path);
        if (!folder.exists)
            return new Vector.<String>();

        var list:Array = folder.getDirectoryListing();

        var files:Vector.<String> = new Vector.<String>();

        for each (var item:File in list) {
            if (!item.isDirectory)

                files.push(folder.getRelativePath(item));


        }
        return files;
    }


    public function fileExists(path:String):Boolean {
        return new File(path).exists;
    }

    public function folderExists(path:String):Boolean {
        return this.fileExists(path);
    }

    public function createFolder(path:Object):File {
        var file:File = parsePath(path);
        file.createDirectory();
        return file;
    }

    public function copyFile(from:Object, to:Object):void {
        var srcFile:File = parsePath(from);
        var descFile:File = parsePath(to);
        srcFile.copyTo(descFile, true);
    }

    public function copyFolder(from:Object, to:Object):void {
        copyFile(from, to)
    }

    public function writeFile(path:Object, content:Object, appendable:Boolean = false):File {
        var file:File = parsePath(path);

        var stream:FileStream = new FileStream();
        stream.open(file, appendable ? FileMode.APPEND : FileMode.WRITE);
        if (content is String) {
            stream.writeUTFBytes(String(content));
        }
        else if (content is ByteArray) {
            stream.writeBytes(ByteArray(content));
        }
        stream.close();
        return file;
    }


    public function readTextFile(path:Object):String {
        var file:File = parsePath(path);

        if (!file.exists)
            return null;

        var stream:FileStream = new FileStream();
        stream.open(file, FileMode.READ);
        var UTFBytes:String = stream.readUTFBytes(stream.bytesAvailable);
        stream.close();
        return UTFBytes;
    }

    public function readBinaryFile(path:Object):ByteArray {
        var file:File = parsePath(path);
        if (!file.exists)
            return null;

        var stream:FileStream = new FileStream();

        stream.open(file, FileMode.READ);
        var bytes:ByteArray = new ByteArray();
        stream.readBytes(bytes, 0, stream.bytesAvailable);
        stream.close();
        return bytes;
    }

    public function readFile(path:String):File {
        var file:File = new File(path);
        return file;

    }

    public function deleteFile(path:Object):File {
        var file:File = parsePath(path);
        if (!file.exists)
            return null;

        file.deleteFile();
        return file;
    }

    public function deleteFolder(path:Object):File {
        var file:File = parsePath(path);
        file.deleteDirectory(true);
        return file;
    }

    private function parsePath(path:Object):File {
        var file:File;
        if (path is String)
            file = new File(path as String);
        else
            file = path as File;

        return file;
    }


}
}


