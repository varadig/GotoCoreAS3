package core.filesystem {
import core.filesystem.base.CoreBaseFileSystem;
import core.filesystem.base.IFileSystem;

import flash.filesystem.File;
import flash.filesystem.FileMode;
import flash.filesystem.FileStream;
import flash.utils.ByteArray;

public class CoreFileSystemDesktop extends CoreBaseFileSystem implements IFileSystem {
    public function CoreFileSystemDesktop() {
    }


    public function getSubFolders(path:Object):Vector.<File> {
        var folder:File = this.parsePath(path);
        if (!this.folderExists(folder))
            return new Vector.<File>();


        var list:Array = folder.getDirectoryListing();


        var folders:Vector.<File> = new Vector.<File>();

        for each (var item:File in list) {
            if (item.isDirectory)
                folders.push(item);
        }
        return folders;
    }

    public function getFiles(path:Object, filter:Vector.<String>):Vector.<File> {

        var folder:File = this.parsePath(path);
        if (!folder.exists)
            return new Vector.<File>();

        var list:Array = folder.getDirectoryListing();

        var files:Vector.<File> = new Vector.<File>();

        for each (var item:File in list) {
            if (!item.isDirectory)
                if (filter) {
                    if (filter.indexOf(item.extension) > -1) {
                        files.push(item);
                    }
                } else {
                    files.push(item);
                }
        }
        return files;
    }


    public function fileExists(path:Object):Boolean {
        return parsePath(path).exists;
    }

    public function folderExists(path:Object):Boolean {
        return parsePath(path).exists;
    }

    public function createFolder(path:Object):File {
        var file:File = parsePath(path);
        file.createDirectory();
        return file;
    }

    public function copyFile(from:Object, to:Object, append:Boolean = true):void {
        var srcFile:File = parsePath(from);
        var descFile:File = parsePath(to);
        srcFile.copyTo(descFile, append);
    }

    public function copyFolder(from:Object, to:Object):void {
        copyFile(from, to)
    }

    public function copyContent(from:Object, to:Object, isRecursive:Boolean = true):void {

        var directory:Array = from.getDirectoryListing();

        for each (var file:File in directory) {
            if (isRecursive) {

                if (file.isDirectory)
                    copyContent(file, to.resolvePath(file.name));
                else
                    file.copyTo(to.resolvePath(file.name), true);
            } else {
                if (!file.isDirectory)
                    file.copyTo(to.resolvePath(file.name), true);
            }
        }


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
        else if (path is File)
            file = path as File;

        return file;
    }

    public function rename(file:File, to:Object):void {
        if (to is String)
            file.moveTo(file.parent.resolvePath(to as String));
        else if (to is File) {
            file.moveTo(to as File);
        }
    }


}
}


