/**
 * CoreFileSystem
 *
 * @dependencies:
 * CoreNotificationContainer
 */
package core.filesystem {
import core.base.CoreBaseClass;
import core.filesystem.base.IFileSystem;
import core.notification.CoreNotificationContainer;
import core.utils.CoreUtils;

import flash.filesystem.File;
import flash.utils.ByteArray;

public class CoreFileSystem extends CoreBaseClass {
    private static var instance:CoreFileSystem;

    /*PROPERTIES*/
    public static const PATH:String = 'core.filesystem.path';
    public static const FROM:String = 'core.filesystem.from';
    public static const TO:String = 'core.filesystem.to';
    public static const CONTENT:String = 'core.filesystem.content';
    public static const FILE:String = 'core.filesystem.file';
    public static const FILTER:String = 'core.filesystem.filter';
    public static const APPEND:String = 'core.filesystem.append';
    public static const RECURSIVE:String = 'core.filesystem.recursive';


    /*SERVICES*/
    public static const RENAME:String = 'core.filesystem.rename';
    public static const GET_SUB_FOLDERS:String = 'core.filesystem.get.sub.folders';
    public static const GET_FILES:String = 'core.filesystem.get.files';
    public static const FILE_EXISTS:String = 'core.filesystem.file.exists';
    public static const FOLDER_EXISTS:String = 'core.filesystem.folder.exists';
    public static const CREATE_FOLDER:String = 'core.filesystem.create.folder';
    public static const COPY_FILE:String = 'core.filesystem.copy.file';
    public static const COPY_FOLDER:String = 'core.filesystem.copy.folder';
    public static const COPY_CONTENT:String = 'core.filesystem.copy.folder';
    public static const CREATE_FILE:String = 'core.filesystem.create.file';
    public static const CREATE_XML_FILE:String = 'core.filesystem.create.xml.file';
    public static const APPEND_TEXT_FILE:String = 'core.filesystem.append.text.file';
    public static const APPEND_XML_FILE:String = 'core.filesystem.append.xml.file';
    public static const APPEND_BINARY_FILE:String = 'core.filesystem.append.binary.file';
    public static const READ_TEXT:String = 'core.filesystem.read.text';
    public static const READ_XML_FILE:String = 'core.filesystem.read.xml.file';
    public static const READ_BYTES:String = 'core.filesystem.read.bytes';
    public static const READ_FILE:String = 'core.filesystem.read.file';
    public static const DELETE_FILE:String = 'core.filesystem.delete.file';
    public static const DELETE_FOLDER:String = 'core.filesystem.delete.folder';
    public static const GET_FILE_REFERENCE:String = 'core.filesystem.get.file.reference';


    public function CoreFileSystem(filesystem:IFileSystem):void {
        _fs = filesystem;

        this.sc.registerService(RENAME, this.serviceRename);
        this.sc.registerService(GET_SUB_FOLDERS, this.serviceGetSubFolders);
        this.sc.registerService(GET_FILES, this.serviceGetFiles);
        this.sc.registerService(GET_FILE_REFERENCE, this.serviceGetFileReference);
        this.sc.registerService(FILE_EXISTS, this.serviceFileExists);
        this.sc.registerService(FOLDER_EXISTS, this.serviceFolderExists);
        this.sc.registerService(CREATE_FOLDER, this.serviceCreateFolder);
        this.sc.registerService(COPY_FILE, this.serviceCopyFile);
        this.sc.registerService(COPY_FOLDER, this.serviceCopyFolder);
        this.sc.registerService(COPY_CONTENT, this.serviceCopyContent);
        this.sc.registerService(CREATE_FILE, this.serviceCreateFile);
        this.sc.registerService(CREATE_XML_FILE, this.serviceCreateXMLFile);
        this.sc.registerService(APPEND_TEXT_FILE, this.serviceAppendTextFile);
        this.sc.registerService(APPEND_XML_FILE, this.serviceAppendXMLFile);
        this.sc.registerService(APPEND_BINARY_FILE, this.serviceAppendBinaryFile);
        this.sc.registerService(READ_TEXT, this.serviceReadText);
        this.sc.registerService(READ_XML_FILE, this.serviceReadXMLFile);
        this.sc.registerService(READ_BYTES, this.serviceReadBytes);
        this.sc.registerService(READ_FILE, this.serviceReadFile);
        this.sc.registerService(DELETE_FILE, this.serviceDeleteFile);
        this.sc.registerService(DELETE_FOLDER, this.serviceDeleteFolder);

        this.initDependModules();
    }

    public static function getInstance(filesystem:IFileSystem):CoreFileSystem {
        if (CoreFileSystem.instance == null) {
            CoreFileSystem.instance = new CoreFileSystem(filesystem);
        }
        return CoreFileSystem.instance;
    }

    private static var _fs:IFileSystem;

    private function initDependModules():void {
        CoreNotificationContainer.getInstance();
    }

    private function serviceGetSubFolders(params:Array):Vector.<File> {
        return _fs.getSubFolders(params[PATH]);
    }


    private function serviceGetFiles(params:Array):Vector.<File> {
        return _fs.getFiles(params[PATH], params[FILTER]);
    }

    private function serviceFileExists(params:Array):Boolean {
        return _fs.fileExists(params[PATH]);
    }

    private function serviceFolderExists(params:Array):Boolean {
        return _fs.folderExists(params[PATH]);
    }

    private function serviceCreateFolder(params:Array):void {
        _fs.createFolder(params[PATH]);
    }

    private function serviceCopyFile(params:Array):void {
        var append:Boolean = true;
        if (params.hasOwnProperty(APPEND))
            append = params.hasOwnProperty(APPEND);
        _fs.copyFile(params[FROM], params[TO], append);
    }

    private function serviceCopyFolder(params:Array):void {
        _fs.copyFolder(params[FROM], params[TO]);
    }

    private function serviceCopyContent(params:Array):void {
        _fs.copyContent(params[FROM], params[TO], params[RECURSIVE]);
    }

    private function serviceCreateFile(params:Array):File {

        return _fs.writeFile(params[PATH], params[CONTENT]);
    }

    private function serviceAppendTextFile(params:Array):File {

        return _fs.writeFile(params[PATH], params[CONTENT], true);
    }

    private function serviceAppendXMLFile(params:Array):File {

        var xml:XML;
        var xmlString:String = _fs.readTextFile(params[PATH]);
        if (!xmlString)
            xml = CoreUtils.createXmlWithHeader();
        else
            xml = new XML(xmlString);
        xml.appendChild(params[CONTENT]);
        return _fs.writeFile(params[PATH], xml.toXMLString());
    }

    private function serviceAppendBinaryFile(params:Array):File {
        return _fs.writeFile(params[PATH], params[CONTENT], true);
    }

    private function serviceReadText(params:Array):String {
        return _fs.readTextFile(params[PATH]);
    }

    private function serviceReadBytes(params:Array):ByteArray {
        return _fs.readBinaryFile(params[PATH]);
    }

    private function serviceReadFile(params:Array):File {
        return _fs.readFile(params[PATH]);
    }


    private function serviceDeleteFile(params:Array):File {
        return _fs.deleteFile(params[PATH]);
    }

    private function serviceDeleteFolder(params:Array):File {
        return _fs.deleteFolder(params[PATH]);
    }

    private function serviceReadXMLFile(params:Array):XML {

        return new XML(_fs.readTextFile(params[PATH]));
    }

    private function serviceCreateXMLFile(params:Array):File {

        return _fs.writeFile(params[PATH], params[CONTENT].toXMLString(), false);

    }

    private function serviceGetFileReference(params:Array):File {
        var file:File = new File(params[PATH]);
        return file;

    }

    private function serviceRename(params:Array):void {
        _fs.rename(params[FILE], params[TO]);
    }
}
}


