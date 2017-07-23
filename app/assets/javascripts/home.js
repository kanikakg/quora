
$(document).ready(function() {
	var textarea = document.getElementById('question_content');


    var create_question_submit = document.getElementById('create_question_submit');
	moveToTopLibrary('moveToTop', 2000, 100 );

});

var moveToTopLibrary = function(idOfButton, time, frequency){
	var moveToTopButton = document.getElementById(idOfButton);

	var intervalId;

	window.addEventListener('wheel', function(event){
		if(intervalId!=null && event.deltaY > 0){
			clearInterval(intervalId);
		}
	});

	var moveToTop = function(event){
		console.log(this);
		console.log("moveToTop was called");


		var currentY = window.scrollY;


		var delta = currentY / (time/frequency);
		if(intervalId != null){
			clearInterval(intervalId);
		}
		intervalId = setInterval(function(){

			window.scrollTo(window.scrollX, window.scrollY - delta);

			if(window.scrollY == 0){
				clearInterval(intervalId);
			}

		},frequency);

	};
	moveToTopButton.addEventListener('click', moveToTop);
};


