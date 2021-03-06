﻿package core.logger {
import core.logger.base.CoreBaseLogger;
import core.utils.CoreUtils;

import flash.desktop.NativeApplication;
import flash.events.Event;
import flash.events.PermissionEvent;
import flash.filesystem.File;
import flash.filesystem.FileMode;
import flash.filesystem.FileStream;
import flash.permissions.PermissionStatus;

public class CoreLoggerFile extends CoreBaseLogger {
    public static const PATHS:String = "log.file.path";
    public static const ARCHIVE:String = "archive.log.file";
    public static const READ:String = "read.log.file";
    private var file:File;
    private var stream:FileStream;

    public function CoreLoggerFile(file:File):void {
        this.file = file;
        this.handleFilePermission();

//        NativeApplication.nativeApplication.addEventListener(Event.EXITING, exitingHandler);

        this.sc.registerService(ARCHIVE, this.serviceArchiveLogFile);
        this.sc.registerService(READ, this.serviceReadLogFile);

    }

    private function handleFilePermission():void {
        if (CoreUtils.isDesktop) {
            this.stream = new FileStream();
            this.stream.open(file, FileMode.APPEND);

        }
        else {


            if (File.permissionStatus != PermissionStatus.GRANTED) {
                this.file.addEventListener(PermissionEvent.PERMISSION_STATUS, function (event:PermissionEvent):void {
                    if (event.status == PermissionStatus.GRANTED) {
                        trace("CoreLoggerFile::permission status:"+event.status);
                        this.stream = new FileStream();
                        this.stream.openAsync(file, FileMode.APPEND);
                    }
                });

                try {

                    this.file.requestPermission();

                } catch (e:Error) {
                    trace("Another request is in progress");
                }
            }
            else {
                this.file.requestPermission();
//                this.stream = new FileStream();
//                this.stream.open(this.file, FileMode.APPEND);
            }
        }

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
        if (!this.stream)
            return null;
        var log:String;
        this.stream.open(this.file, FileMode.READ);
        log = this.stream.readUTFBytes(this.stream.bytesAvailable);
        this.stream.close();
        return log;
    }

    override protected function addLogEntry(message:String):void {
        if (!this.stream)
            return;
        try{

        this.stream.writeUTFBytes(this.createEntryFrom(message));
        }catch(error:Error){
            trace(error);

        }
    }

    private function exitingHandler(event:Event):void {
        this.stream.close();
    }
}
}
