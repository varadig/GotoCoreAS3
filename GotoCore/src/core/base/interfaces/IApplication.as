/**
 * Created by varadig on 10/28/14.
 */
package core.base.interfaces {
public interface IApplication {
	function init():void;

	function initContext():void;

	function initCoreModules():void;

	function initControllers():void;

	function initApplication():void;

}
}
