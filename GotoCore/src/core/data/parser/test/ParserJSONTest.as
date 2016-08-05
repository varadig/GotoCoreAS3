
package core.data.parser.test 
{
import core.test.UnitTest;

public class ParserJSONTest extends UnitTest
	{
		override public function run () : void
		{
			log( "START--CREATE, SAVE AND LOAD BACK JSON---------------------------------------------------------------------------------" );
			
			var data : Array = [];

			data["id"] = 1;
			data["media"] = "data/experiments/exp" + data["id"] + "/media";
			data["thumbnail"] = "/thumbnail/test.png";
			data["tool.ids"] = [ 1,3 ];
			data["keywords"] = [ "ferrum" ];
			data["interfaces"] = [ "mediaplayer","benchmarkin","benchmarkout","basicinformation" ];
			data["title"] = "id--" + data["id"];
			
			var json : String = this.sc.getService( "parse.to.json" ).addParam( "data" , data ).execute( );
			log( 'json: ' + (json) );
			this.sc.getService( "create.text.file" ).addParam( "path" , "data/json/jsonTest.json" ).addParam( "content" , json ).execute( );
		}
	}
}
