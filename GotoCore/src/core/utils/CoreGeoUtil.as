/**
 * Created by varadig on 31/07/16.
 */
package core.utils {
import core.base.CoreBaseClass;

public class CoreGeoUtil extends CoreBaseClass {

    public static function distanceBetweenCoordinates(lat1:Number,lon1:Number,
                                                lat2:Number,lon2:Number,
                                                units:String="meters"):Number{

        var R:int = CoreUnits.RADIUS_OF_EARTH_IN_MILES;
        if (units == "km"){
            R = CoreUnits.RADIUS_OF_EARTH_IN_KM;
        }
        if (units == "meters"){
            R = CoreUnits.RADIUS_OF_EARTH_IN_M;
        }
        if (units =="feet"){
            R= CoreUnits.RADIUS_OF_EARTH_IN_FEET;
        }

        var dLat:Number = (lat2-lat1) * Math.PI/180;
        var dLon:Number = (lon2-lon1) * Math.PI/180;

        var lat1inRadians:Number = lat1 * Math.PI/180;
        var lat2inRadians:Number = lat2 * Math.PI/180;

        var a:Number = Math.sin(dLat/2) * Math.sin(dLat/2) +
                Math.sin(dLon/2) * Math.sin(dLon/2) *
                Math.cos(lat1inRadians) * Math.cos(lat2inRadians);
        var c:Number = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));
        var d:Number = R * c;

        return d;
    }}
}
