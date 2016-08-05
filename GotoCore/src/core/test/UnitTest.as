package core.test {
import core.base.CoreBaseClass;
import core.data.parser.test.ParserJSONTest;
import core.logger.test.LoggerTest;
import core.notification.test.NotificationTest;

public class UnitTest extends CoreBaseClass {
	public function run():void {
		new NotificationTest().run();
		new LoggerTest().run();
		new ParserJSONTest().run();
	}

	protected function generateText():String {
		var str:String = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec justo justo, vulputate id pellentesque et, suscipit vel purus. Pellentesque enim lorem, sagittis non pulvinar ac, bibendum eu felis. Praesent tempor dolor quis nisi tristique aliquet. Vivamus et metus mi, at vehicula ipsum. Morbi et mi facilisis tellus ornare feugiat sit amet quis turpis. Sed sed porttitor eros. Proin vitae mattis purus. Sed elit dui, elementum et laoreet sit amet, varius non ipsum. Integer sit amet augue tortor. Sed adipiscing mauris ullamcorper nisi sollicitudin dictum.Curabitur et tortor leo, quis feugiat est. Ut posuere magna nibh, a fermentum dolor. Donec tempus eros nec est faucibus et hendrerit quam feugiat. Nullam nec purus urna, nec imperdiet mi. Nulla mi orci, pretium ac vehicula et, malesuada ac odio. Aliquam mauris nisi, volutpat eget blandit id, posuere in ante. Integer sollicitudin, elit a vestibulum faucibus, elit est semper ipsum, in fermentum quam leo a enim. Nulla elit arcu, volutpat non facilisis ullamcorper, malesuada nec tellus. Quisque at tellus eros. Duis porttitor pellentesque enim id dapibus. Vivamus gravida hendrerit enim, a dapibus enim placerat et. Morbi sit amet odio ac felis ultrices interdum. Nullam elementum lorem quis ipsum dictum et sagittis mi luctus.Proin vel diam eros, sed ullamcorper nunc. Aliquam nisl tellus, tincidunt vel fringilla sit amet, ultricies eget sapien. Fusce sagittis eros quis felis tristique accumsan. Praesent eu diam vel urna lobortis gravida. Sed vitae elit id metus pretium semper. Phasellus a pulvinar orci. Sed diam sem, adipiscing nec tristique ut, bibendum a massa. Praesent et suscipit mi. Vestibulum ultricies ipsum quis diam egestas pharetra facilisis quam egestas. Vestibulum diam odio, eleifend a interdum sit amet, porta nec mi. Donec id erat vel erat tempus vestibulum. Quisque in quam at orci consectetur vestibulum.Aenean commodo dolor id nunc iaculis a condimentum neque accumsan. Sed rhoncus varius varius. Etiam vel turpis sed eros feugiat tincidunt a sed risus. Curabitur volutpat porttitor neque eu sodales. Curabitur ornare ullamcorper velit. Mauris quis nibh sapien. Nunc cursus ultricies faucibus. Nunc vehicula quam vitae ipsum faucibus placerat. Maecenas dapibus dolor quis orci tristique venenatis sed et nunc. Aenean leo velit, semper quis gravida vel, egestas eu odio. In non mauris eu diam facilisis tincidunt.Quisque et turpis tincidunt quam condimentum luctus. Nunc dolor orci, mollis in tristique a, tempor a nibh. In dapibus semper odio a ultricies. Fusce risus lorem, vestibulum eu porttitor a, convallis at dolor. Aenean a malesuada purus. Nulla vitae sapien tortor. Curabitur mattis vehicula est non sagittis. Quisque elit mi, pharetra sit amet volutpat in, aliquet at ligula. Vestibulum id ipsum mollis lacus lobortis auctor. Nam pulvinar, dui quis mollis iaculis, metus metus pretium augue, ac sodales turpis metus commodo dolor. ";

		return str.substr(Math.random() * (str.length / 2), Math.random() * (str.length / 2));
	}
}
}
