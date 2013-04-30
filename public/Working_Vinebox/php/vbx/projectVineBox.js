(function( $ ){
	$.fn.vineBox = function(options) {
	// this. is the same as $("#video") 

	var settings = $.extend( {
		'search_term'   : undefined
    }, options);
    
    // Prepping Twitter API
    var vine_object=[];
    var results = [];
    
	var search_parms = {
		q : options.search_term + '+vine.co/v/',
	    rpp : 100,
	    result_type : 'recent',
	    include_entities: true
    };
   var master;
	$.getJSON("http://search.twitter.com/search.json?"+$.param(search_parms)+"&amp;callback=?", function(data) {
	 // Does not get the actual vine info. need to scrape metadata!
	 	console.log(data);
	 	// Placing results intp one object
		for (i=0; i<data.results.length; i++){
			results[i] = data.results[i];
			var tweet_vine_url = results[i]['entities']['urls'][0]['display_url'];
			var vine_id = tweet_vine_url.replace("vine.co/v/", "");
			
			var created_at = results[i]['created_at'];
			var text = results[i]['text'];
			
			vine_object[i] = { 
				'vine_url' : tweet_vine_url,
				'vine_id' : vine_id,
				'created_at' : created_at,
				'text' : text
			};
		} // end for statement
	
	 
	 var master = vine_object;
	 masterFunction(master);

	});
	
	function masterFunction(data){
		var myPlayer = _V_("Player");
		
		var e = 0;
		
		$('#tweet').html(data[0]['created_at'] + ' |  ' + data[0]['text']);

		$.ajax({
			url: "/proxy.php?ID=" + data[0]['vine_id'],
			async: true,
			success: function( data ) {
				console.log(data); // data is the url here!

				myPlayer.src({type: "video/mp4", src: data});
				myPlayer.volume(0);
				myPlayer.play();
				
				

			}
		});
		
		myPlayer.addEvent("ended", function(){
			e = e + 1;
			$.ajax({
				url: "/proxy.php?ID=" + data[e]['vine_id'],
				async: true,
				success: function( data ) {
					console.log(e);
					myPlayer.src({type: "video/mp4", src: data});
					myPlayer.volume(0);
					myPlayer.play();
				}
			});
			$('#tweet').html(data[e]['created_at'] + ' |  ' + data[e]['text']);
		});
		
		
		// data[0]['vine_id']
		
		
					/*
myPlayer.addEvent("ended", function(){
				var next_vine_id = vine_object[i]['vine_id'];
				var vine_url = "/proxy.php?ID=" + next_vine_id;	
				
				$.ajax({
					url: "/proxy.php?ID=" + ID,
					async: true,
					success: function( data ) {
						console.log(data); // data is the url here!
						myPlayer.src({type: "video/mp4", src: data});
						myPlayer.play();
						i = i+1;	
					}
				});		
			});
*/
	}
	
	
    function init_player(){
	    var myPlayer = _V_("Player");
	    myPlayer.src({type: "video/mp4", src: 'https://vines.s3.amazonaws.com/v/videos/2013/04/02/5FBEF637-F7BD-4E4F-BFD9-39B7E6D8A475-651-000000BCB27D4038_1.0.7.mp4?versionId=srm2xEEtSI97VOQbEFuxmVUYAE6sNnra'});
	    myPlayer.volume(0);
	    myPlayer.play();
	    
    }



	function start_player(){
		
	}

	function switch_player( ID ){
			var vine_url = "/proxy.php?ID=" + vine_id;		
			$.ajax({
				url: vine_url,
				async: false,
				success: function( data ) {
					//console.log(data + " "+ options.search_term); // data is the url here!
				}
			});				
	}
	
	$('#Player').click(function(){
		myPlayer = _V_("Player");
		
		if ( myPlayer.paused() ){ // it is currently paused right now. You might want to play
				myPlayer.volume(0);
				myPlayer.play();
			} else {
				myPlayer.pause();
		}
	});
	
	
	
	// TOGGLE SOUND FUNCTION
	$('#sound').click(function(){
		myPlayer = _V_("Player");
		var howLoudIsIt = myPlayer.volume();
		if( howLoudIsIt == 1 ){ 
			myPlayer.volume(0);
		} else {
			myPlayer.volume( 1 ); 
		} //end if how loud it is
	});
				
		

  };
})( jQuery );