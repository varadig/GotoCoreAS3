/**
 * Created by varadig on 3/27/16.
 */
package core.utils {
import flash.net.NetworkInfo;
import flash.net.NetworkInterface;

public class CoreNetworkUtils {
    public static function findInterface():void {
        var results:Vector.<NetworkInterface> =
                NetworkInfo.networkInfo.findInterfaces();

        for (var i:int = 0; i < results.length; i++) {
            var output = ""
                    + "Name: " + results[i].name + "\n"
                    + "DisplayName: " + results[i].displayName + "\n"
                    + "MTU: " + results[i].mtu + "\n"
                    + "HardwareAddr: " + results[i].hardwareAddress + "\n"
                    + "Active: " + results[i].active + "\n";


            for (var j:int = 0; j < results[i].addresses.length; j++) {
                output = output
                        + "Addr: " + results[i].addresses[j].address + "\n"
                        + "Broadcast: " + results[i].addresses[j].broadcast + "\n"
                        + "PrefixLength: " + results[i].addresses[j].prefixLength + "\n"
                        + "IPVersion: " + results[i].addresses[j].ipVersion + "\n";
            }

            output = output + "\n";
            Log.add(output);

        }
    }

    public static function get ethernet():NetworkInterface {

        var result:NetworkInterface;
        if (CoreUtils.isLinux || CoreUtils.isOsx)
            result = find('en');
        else if (CoreUtils.isWindows) {
            result = find('Ethernet');
            if (!result)
                result = find('Local');
            if (!result)
                result = find('Helyi');
        }

        return result;
    }

    public static function get wifi():NetworkInterface {
        return find("Wlan");
    }

    private static function find(name:String):NetworkInterface {
        Log.add("find network interface with name:" + name);
        var intface:NetworkInterface;
        var results:Vector.<NetworkInterface> =
                NetworkInfo.networkInfo.findInterfaces();
        for each(var iface:NetworkInterface in results)
            if (iface.displayName.indexOf(name) > -1)
                intface = iface;
        Log.add('interface:'+intface);
        return intface;

    }

}
}
