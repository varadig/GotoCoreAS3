package core.utils {
import com.adobe.crypto.MD5;

import core.base.CoreBaseClass;

import flash.external.ExternalInterface;
import flash.system.Capabilities;
import flash.utils.getDefinitionByName;
import flash.utils.getQualifiedClassName;
import flash.utils.getTimer;

public class CoreUtils extends CoreBaseClass {

    public static var screen:CoreScreen = new CoreScreen();

    public static function get timeStamp():String {
        var date:Date = new Date();
        var timestamp:String = "";
        timestamp += date.getFullYear() + "-";
        timestamp += date.getMonth() + 1 + "-";
        timestamp += date.getDate() + " ";
        timestamp += date.getHours() + "_";
        timestamp += date.getMinutes() + "_";
        timestamp += date.getSeconds() + "_";
        timestamp += date.getMilliseconds();
        return timestamp;
    }

    public static function get validFileNameTimeStamp():String {
        var date:Date = new Date();
        var timestamp:String = "";
        timestamp += date.getFullYear() + ".";
        timestamp += date.getMonth() + 1 + ".";
        timestamp += date.getDate() + "___";
        timestamp += date.getHours() + "-";
        timestamp += date.getMinutes() + "-";
        timestamp += date.getSeconds() + "-";
        timestamp += date.getMilliseconds();
        return timestamp;
    }


    public static function stringReplace(str:String, search:Object, replace:String):String {
        if (search is Array) {
            for each (var prop:String in search) {
                str = str.split(prop).join(replace);
            }
            return str;
        }
        else {
            return str.split(search).join(replace);
        }
    }

    public static function get isLinux():Boolean {
        return (Capabilities.manufacturer == "Adobe Linux");
    }

    public static function get isOsx():Boolean {
        return (Capabilities.manufacturer == "Adobe Macintosh");
    }

    public static function get isWindows():Boolean {
        return (Capabilities.manufacturer == "Adobe Windows");
    }

    public static function get isAndroid():Boolean {
        return (Capabilities.manufacturer == "Android Linux");
    }

    public static function get isIOS():Boolean {
        return (Capabilities.manufacturer == "Adobe iOS");
    }


    public static function get isDesktop():Boolean {
        return isWindows || isOsx || isLinux;
    }

    public static function sleep(ms:int):void {
        var init:int = getTimer();
        while (true) {
            if (getTimer() - init >= ms) {
                break;
            }
        }
    }

    public static function getClass(obj:Object):Class {
        return Class(getDefinitionByName(getQualifiedClassName(obj)));
    }

    public static function getName(obj:Class):String {
        return String(getQualifiedClassName(obj));
    }

    public static function get isBrowser():Boolean {

        return ExternalInterface.available;
    }

    public static function get randomNumber():Number {
        return Math.random() * 100000;
    }

    public static function get randomHash():String {
        return MD5.hash((Math.random() * 100000).toString());
    }

    public static function mapValue(num:Number, min1:Number, max1:Number, min2:Number, max2:Number, round:Boolean = false, constrainMin:Boolean = true, constrainMax:Boolean = true):Number {
        if (constrainMin && num < min1) return min2;
        if (constrainMax && num > max1) return max2;

        var num1:Number = (num - min1) / (max1 - min1);
        var num2:Number = (num1 * (max2 - min2)) + min2;
        if (round) return Math.round(num2);
        return num2;
    }

    public static function createXmlWithHeader(root:String = "root"):XML {
        return new XML('<?xml version="1.0" encoding="UTF-8"?><' + root + '>' + '</' + root + '>');
    }

    public static function getClosestValue(value:Number, arr:Array):Number {
        var closestNum:Number = Number;
        var closestArrayItem:Number = Number;
        var tempNum:Number = Number;

        for (var i:Number = 0; i < arr.length; i++) {

            tempNum = Math.abs(arr[i] - value);

            if (tempNum < closestNum || i == 0) {
                closestNum = tempNum;
                closestArrayItem = i;
            }

        }
        return arr[closestArrayItem];
    }

    public static function urlFix(value:String):String {
        var pattern:RegExp = /(http|ftp|https):\/\/[\w\-_]+(\.[\w\-_]+)+([\w\-\.,@?^=%&:\/~\+#]*[\w\-\@?^=%&\/~\+#])?/;
        if (value.match(pattern))
            return value;

        return "http://" + value;

    }

}
}


