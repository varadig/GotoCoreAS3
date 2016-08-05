﻿﻿

package core.data.parser.test 
{
import core.test.UnitTest;

/**
	 * @author varadig
	 * CREATED :: Mar 22, 2011 
	 */
	public class ParserYAMLTest extends UnitTest
	{
		override public function run () : void
		{
			 
			var mediaArray : Array = [];
			
			mediaArray = [ "vid01.flv","vid02.flv","vid03.flv","vid04.flv","vid05.flv" ];
			
			var yaml : String = this.sc.getService( "parse.to.yaml" ).addParam( "data" , mediaArray ).execute( );
			this.sc.getService( "create.text.file" ).addParam( "path" , "data/yaml/media.yaml" ).addParam( "content" , yaml ).execute( );
			
			var data : Array = [];

			data["id"] = 1;
			data["media"] = "data/experiments/exp" + data["id"] + "/media";
			data["thumbnail"] = "/thumbnail/test.png";
			data["tool.ids"] = [ 1,3 ];
			data["keywords"] = [ "ferrum" ];
			data["interfaces"] = [ "mediaplayer","benchmarkin","benchmarkout","basicinformation" ];
			data["title"] = "id--" + data["id"];
                  
			
			
			yaml = this.sc.getService( "parse.to.yaml" ).addParam( "data" , data ).execute( );
			this.sc.getService( "create.text.file" ).addParam( "path" , "data/yaml/yamlOut.yaml" ).addParam( "content" , yaml ).execute( );
			
			yaml = this.sc.getService( "read.text.file" ).addParam( "path" , "data/yaml/yamlOut.yaml" ).execute( );
			data = this.sc.getService( "parse.from.yaml" ).addParam( "data" , yaml ).execute( );
			
                 
			this.sc.getService( "create.text.file" ).addParam( "path" , "data/yaml/outputUTF.txt" ).addParam( "content" , data.title + ":UTF8" ).execute( );
			
			
			yaml = this.sc.getService( "read.text.file" ).addParam( "path" , "data/experiments/list.yaml" ).execute( );
			log( 'yaml: ' + (yaml) );
			data = this.sc.getService( "parse.from.yaml" ).addParam( "data" , yaml ).execute( );
		}
	}
}
