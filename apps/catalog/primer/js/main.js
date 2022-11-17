(function ($) {
	$(document).on('ready', function () {
		var db = new Object();
		db.preLoad = function () {
			$('.page-loader').delay(100).fadeOut(50, function () {
				$('body').fadeIn();
			});
		}


		db.sliderIntro = function () {
			if ($('.owl-slider').length) {
				$('.owl-slider').owlCarousel({
					loop: true,
					margin: 0,
					items: 1,
					nav: false,
					autoHeight: true,
				})
			}
		}

		db.sliderIntro();

	});
})(jQuery);
