/**
 * Created by varadig on 06/12/14.
 */
package utils {
import flash.display3D.Context3DProfile;
import flash.system.Capabilities;

public class CoreIDevice {
	public static const IPHONE3:String = "iPhone 3";
	public static const IPHONE4:String = "iPhone 4";
	public static const IPHONE5:String = "iPhone 5";
	public static const IPAD1:String = "iPad 1";
	public static const IPAD2:String = "iPad 2";
	public static const IPAD3:String = "iPad 3";

	public static function get type():String {
		var width:int = Math.max(Capabilities.screenResolutionX, Capabilities.screenResolutionY);
		var height:int = Math.min(Capabilities.screenResolutionX, Capabilities.screenResolutionY);
		if (height == 320 || width == 480)
			return IPHONE3;
		if (height == 640 || width == 960)
			return IPHONE4;
		if (height == 640 || width == 1136)
			return IPHONE5;
		if (height == 768 || width == 1024)
			return IPAD1;
		if (height == 768 || width == 1024)
			return IPAD2;
		if (height == 1536 || width == 2040)
			return IPAD3;
		return null;
	}

	public static function get supportedProfile():String {
		switch (type) {
			case IPAD1:
			case IPAD2:
			case IPHONE3:
			case IPHONE4:
				return Context3DProfile.BASELINE;
				break;

			case IPHONE5:
			case IPAD3:

				return Context3DProfile.BASELINE_EXTENDED;
				break;

			default :
				return Context3DProfile.BASELINE;
				break;
		}

	}
}
}
