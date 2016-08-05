package core.utils {
import flash.system.Capabilities;

import pl.mateuszmackowiak.nativeANE.properties.SystemProperties;

public class CoreMobileUtils extends CoreBaseClass {

    public static function get systemInfo():Object {
        if (SystemProperties.isSupported)
            return nativeInfo;
        else
            return flashInfo;

    }

    private static function get flashInfo():Object {
        var output:Array = [];
        output.push("Operation system:     " + Capabilities.os);
        output.push("CPU Architecture:     " + Capabilities.cpuArchitecture);
        output.push("Manufacturer:         " + Capabilities.manufacturer);
        output.push("Screen resolution:    " + "(width:" + Capabilities.screenResolutionX + ",height:" + Capabilities.screenResolutionY);
        output.push("Player type:          " + Capabilities.playerType);
        return output;

    }

    public static function get uid():String {
        if (SystemProperties.isSupported)
            return SystemProperties.getInstance().getSystemProperites().name;
        return Capabilities.cpuArchitecture;

    }

    private static function get nativeInfo():Object {
        return SystemProperties.getInstance().getSystemProperites();
    }

    private static function get br():String {
        return "\n";
    }
}
}


