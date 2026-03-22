console.log('user.js loaded');

$(document).ready(function(){
  		var a = $("header .logo-bar .link-logo").clone();
  		var b = $("header .logo-bar .basket").detach();
  		var c = $("header .logo-bar .basket-contain").detach();
  		
  		if( $(".menu .menu-list").length){
        	$(".menu .menu-list").prepend(a,b);
        }
     	
     	$(".menu .menu-list").prepend(a,b);
     	$(".menu .menu-list").prepend('<li id="fx-log-li"><h3><a href="https://gese.pl/pl/panel"><span>Login</span></a></h3></li>')
     	// $("#fx-log").click(function() {
    //             if($( "#fx-log" ).hasClass( "active" )){
    //                 $("#fx-log").removeClass("active");
    //                 $("header .login-bar").css("margin-top", "-36px");
    //             }
    //             else{
    //                 $("#fx-log").addClass("active");
    //                 $("header .login-bar").css("margin-top", "0");  
    //             }
    //         });

		$(".menu .menu-list").prepend('<li id="fx-search-li"><h3><a id="fx-search"><span>Search</span></a></h3></li>')
     	$("#fx-search").click(function() {
     		if($("header .logo-bar").is(":visible")){
     			$("#fx-search").removeClass("active");
				$("header .logo-bar").hide();
     		}
     		else{
     			$("#fx-search").addClass("active");
	   			$("header .logo-bar").show();
     		}
		});
});

Shop.include({
			selectorFunctions: {
				boxslider: {
					selector: '.box.slider',
					load: function (slider) {
						slider.removeClass('loading');

						var _initialSlideWidth = 280,
							_slideWidth,
							_sliderWidth,
							_visibleSlides,
							_maxHeight = 0,
							_autoMove = false,
							_autoMoveDuration = Shop.useroptions.slider.automove;

						if (slider.hasClass('slider_automove')) {
							_autoMove = true;
						}

						var slides = slider.find('.product');

						if (slides.length > 1) {
							var sliderWrap = $('<div class="slider-wrap" />').css('text-align', 'left');

							var nav = $('<div />').appendTo(slider);
							var prev = $('<span class="slider-nav-left" />').css({
								'display': 'none'
							}).appendTo(nav);
							var next = $('<span class="slider-nav-right" />').css({
								'display': 'block'
							}).appendTo(nav);

							slides.wrapAll(sliderWrap);
							sliderWrap = slider.find('.slider-wrap');

							slides.find('img').on('change', function (ev) {
								sliderWrap.css('height', 'auto');

								setTimeout(function () {
									slides.each(function () {
										if ($(this).outerHeight() >= _maxHeight) {
											_maxHeight = $(this).outerHeight();
											sliderWrap.height(_maxHeight + 6);
										}
									});
								}, 100);
							});

							$(window).on('resize', function () {
								_sliderWidth = slider.outerWidth();
								_visibleSlides = Math.floor(_sliderWidth / _initialSlideWidth) || 1;
								_slideWidth = (_sliderWidth - (20 * (_visibleSlides - 1) ) ) / _visibleSlides ;

								slides.each(function () {
									if ($(this).outerHeight() >= _maxHeight) {
										_maxHeight = $(this).outerHeight();
									}
								});

								slides.outerWidth(_slideWidth);
								sliderWrap.outerWidth(((_slideWidth + 20) * slides.length) + 3).height(_maxHeight + 6);

								slides.css('left', '0');

								if (slides.length > _visibleSlides) {
									next.show();
									prev.hide();
									
								} else {
									next.hide();
									prev.hide();									
								}
								
							}).trigger('resize');

							next.on('click', function () {
								slides.animate({
									left: "-=" + (_slideWidth + 20)
								}, 400, function () {
									var pos = parseInt($(this).css('left'));

									if ((slides.length - _visibleSlides) * Math.floor(_slideWidth) <= -pos) {
										next.hide();
									}

									if (-pos > 0) {
										prev.show();
									}
								});
							});

							prev.on('click', function () {
								slides.animate({
									left: "+=" + (_slideWidth + 20)
								}, 400, function () {
									var pos = parseInt($(this).css('left'));

									if (-pos <= 0) {
										prev.hide();
									}

									if ((slides.length - _visibleSlides) * Math.floor(_slideWidth) >= -pos) {
										next.show();
									}
								});
							});

						}
					}
				}

			}
		});

$(document).ready(function(){
  	let stock_inputs = $('.stocks_table tr td.cell_quantity .mx_ilosc input');
  	let overflow_info = $('#box_productfull .stocks .options-overflow');
  	if( stock_inputs.length && overflow_info.length ){
      	stock_inputs.on('change keyup', function () {
          	checkAllInputs();
        });
      	function checkAllInputs () {
          	let has_error = false;
          	stock_inputs.each(function (i, e) {
              	let v = parseFloat( $(e).val() );
              	let max = parseFloat( $(e).closest('tr').find('.cell_available .mx_avail').text() );
              	if( typeof max == 'number' && v > max ){
                  	$(e).val(max);
                  	has_error = true;
                }
            });
          	if(has_error){
              	overflow_info.slideDown();
            }else{
              	overflow_info.slideUp();
            }
        }
    }
});