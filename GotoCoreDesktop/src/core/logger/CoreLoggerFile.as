package core.logger {
import core.logger.base.CoreBaseLogger;

import flash.filesystem.File;
import flash.filesystem.FileMode;
import flash.filesystem.FileStream;

public class CoreLoggerFile extends CoreBaseLogger {
    public static const PATHS:String = "log.file.path";
    public static const ARCHIVE:String = "archive.log.file";
    public static const READ:String = "read.log.file";
    private var file:File;
    private var stream:FileStream;

    public function CoreLoggerFile(file:File):void {
        this.file = file;
        this.stream = new FileStream();
        this.sc.registerService(ARCHIVE, this.serviceArchiveLogFile);
        this.sc.registerService(READ, this.serviceReadLogFile);
    }

    private function serviceArchiveLogFile(params:Array):void {

//        var fullPath:String = CoreFileSystem.fs.applicationStorageDirectory(parts.path + parts.filename + parts.extension);
//        var archivePath:String = CoreFileSystem.fs.applicationStorageDirectory(parts.path + parts.filename + CoreUtils.timeStamp + parts.extension);
//
//        this.sc.getService(CoreFileSystem.COPY_FILE)
//                .addParam(CoreFileSystem.FROM, fullPath)
//                .addParam(CoreFileSystem.TO, archivePath)
//                .execute();
//        this.sc.getService(CoreFileSystem.DELETE_FILE)
//                .addParam(CoreFileSystem.PATH, CoreFileSystem.fs.applicationStorageDirectory(parts.path + parts.filename + parts.extension))
//                .execute();

        this.log("log file is arcivated");
    }

    private function serviceReadLogFile(params:Array):String {
        var log:String;
        this.stream.open(this.file, FileMode.READ);
        log = this.stream.readUTFBytes(this.stream.bytesAvailable);
        this.stream.close();
        return log;
    }

    override protected function addLogEntry(message:String):void {
        this.stream.open(this.file, FileMode.APPEND);
        this.stream.writeUTFBytes(this.createEntryFrom(message));
        this.stream.close();
    }
}
}
