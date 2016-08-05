/**
 * Created by varadig on 06/12/14.
 */
package core.logger.interfaces {
public interface ICoreConsole {
	function appendText(entry:String):void;

	function setAlpha(value:Number):void;

	function show():void;

	function hide():void;

	function switchState():void;
}
}
