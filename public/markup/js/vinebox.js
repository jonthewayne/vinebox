/**** 
	* 
	* 
	* 
	* 
	* 
	* Made by Curious Entity during StartupWeekend Sacramento April 5-7, 2013
	* 
	* 
	* 
	* 
	* 
*****/

// TEST URL, REMOVE WHEN PROXY ARRIVES
function testVideoURL(){
/* 	var vineURL = 'https://vines.s3.amazonaws.com/videos/2013/04/06/B15F7BDE-74A4-4D43-B81A-8E2AF2A5B1AC-305-000000935BA4A4CB_1.0.7.mp4?versionId=bCRp4zWMDa_VqxSl3ykWa0c5oERUxRih'; */
	var vineURL = 'https://vines.s3.amazonaws.com/v/videos/2013/04/02/5FBEF637-F7BD-4E4F-BFD9-39B7E6D8A475-651-000000BCB27D4038_1.0.7.mp4?versionId=srm2xEEtSI97VOQbEFuxmVUYAE6sNnra';
	return vineURL;
}


// Initial Player Settings
_V_("vb_cont", {
	'loop' : false,
	'autoplay': true,
	'controls' : false
}, function(){ this.volume(0);

	myPlayer = this;
	
var search = new Vine.Search("#fast6", function(){
	search.fetch(function () {
		
		vinearray = this.results; 
		var i = 0; 
		
		loadVideo(i);
		function loadVideo(i){
		
			var vine_url = vinearray[i]['url'];
			var tweet = vinearray[i]['tweet']['text'];

			console.log('shot');
			vineMP4 = testVideoURL();
			myPlayer.src({ 
				type: "video/mp4", 
				src: vineMP4
			}),
			myPlayer.play();
			
			$('#tweet_deets').html(vinearray[i]['tweet']['text']);
		}

		myPlayer.addEvent("ended", function(){
			i++;
			loadVideo(i);
		});		

		



		
	}); // end search	 
	
	
});



 }); // Later we get to play with the cool events!


var csz = $('.video-container').width();
myPlayer.size(csz, csz);

// From here we need the document to load up
$(function() {




// PLAY PAUSE FUNCTION	
$('#vb_cont').click(function(){
	var howLongIsThis = myPlayer.duration();
	if ( myPlayer.paused() ){ // it is currently paused right now. You might want to play
			myPlayer.play();
		} else {
			myPlayer.pause();
	}
});

// TOGGLE SOUND FUNCTION
$('#sound').click(function(){
	var howLoudIsIt = myPlayer.volume();
	var SI = $('#sound > img');
	if( howLoudIsIt == 1 ){ 
		myPlayer.volume(0);
		SI.attr('src','img/SoundOff.png');
	} else {
		myPlayer.volume( 1 ); 
		SI.attr('src','img/SoundOn.png');
	} //end if how loud it is
});

// TOGGLE FULL SCREEN
$('#fs').click(function(){
	myPlayer.requestFullScreen();
});






}); //end doc ready 