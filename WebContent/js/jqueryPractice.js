var index = 1; 
var dragged = null;
$(document).ready(function(){
	$('#content').tabs();
	$('#answers').tablesorter({
		headers : {
			2 : {sorter : false},
			3 : {sorter : false}
		},
		widgets: ['zebra']
	});
	
	$('#accordion').accordion({heightStyle: "content"});
	
	$("#draglist li").draggable({
		start : function(event, ui){
			dragged = $(this);
		}
	});
	
	$("#trash").droppable({
		accept : "#draglist li",
		tolerance : "pointer",
		drop: function(event, ui){
			dragged.remove();
			$('#trash').prop('src','http://findicons.com/files//icons/562/glaze/128/trashcan_full.png');
			dragged = null;
		}
	});
	
	$("#sayList label").draggable({
		revert: "valid",
		start : function(event, ui){
			dragged = $(this);
		}
	});
	
	$("#answersDiv").droppable({
		accept : "#sayList label",
		tolerance : "pointer",
		drop: function(event, ui){
			var row = $("<tr id='" + index + "'><td>" + (index)
					+ "</td><td>" + $(dragged).html()
					+ "</td><td><input type='button' value='X' "
					+ "onclick='delAnswer("+index+");'/></td>"
					+ "<td><input type='button' value='&gt;&gt;' "
					+ "onclick='editAnswer("+(index++)+");'/></td></tr>");
			row.appendTo('#answers tbody');
			$("#answers").trigger("update").trigger("applyWidgets");
		}
	});
	
	$('#editDialog').dialog({
		autoOpen : false,
		resizable : false,
		modal : true,
		width : 325,
		buttons : {
			'Cancel' : function(){
				$('#editDialog').dialog('close');
			},
			'Update' : function(){
				$('#' + $('#trid').val() + ' td:eq(1)').html($('#newText').val());
				$("#answers").trigger("update").trigger("applyWidgets");
				$('#editDialog').dialog('close');
			}
		}
	});
	
	$('#answersDiv').resizable({
		handles : 'se',
		aspectRatio : false,
		autoHide : true,
		containment : 'parent',
		delay : 20,
		distance : 20,
		ghost : true,
		grid : [250,250],
		helper: "ui-state-highlight",
		maxWidth: 1280,
		minWidth: 640,
		animate : true,
		animateDuration : 500,
		animateEasing : 'swing'
	});
	
	$('#trashlist').selectable();
	
	var c=document.getElementById("myCanvas");
	var ctx=c.getContext("2d");
	ctx.moveTo(10,10);
	for(var i=1; i < 50; i++)
		ctx.lineTo((i % 2 > 0 ? 10 : 0),i*10);
	for(var i=1; i < 50; i++)
		ctx.lineTo(i*10,(i % 2 > 0 ? 490 : 500));
	for(var i=49; i > 0; i--)
		ctx.lineTo((i % 2 > 0 ? 490 : 500),i*10);
	for(var i=49; i > 0; i--)
		ctx.lineTo(i*10,(i % 2 > 0 ? 10 : 0));
	for(var i=30;i < 480; i+= 20){
		ctx.moveTo(10,i);
		ctx.lineTo(i,10);
	}
	for(var i=30;i < 480; i+= 20){
		ctx.moveTo(i,490);
		ctx.lineTo(490,i);
	}
	for(var i=30;i < 480; i+= 20){
		ctx.moveTo(i,10);
		ctx.lineTo(490,500 - i);
	}
	for(var i=30;i < 480; i+= 20){
		ctx.moveTo(i,490);
		ctx.lineTo(10,500 - i);
	}
	ctx.stroke();
	
	$('#movieTable').tablesorter({
		headers : {
			0  : {sorter : false},
			3  : {sorter : false},
			4  : {sorter : false},
			5  : {sorter : 'double'},
			7  : {sorter : false},
			8  : {sorter : false},
			9  : {sorter : false},
			10 : {sorter : false},
			11 : {sorter : false},
			12 : {sorter : 'date'}
		},
		widgets: ['zebra']
	});

	$('#title').autocomplete({
		source : function(request, response) {
			if($('#type').val() == 'episode'){
				$('#title').removeClass('ui-autocomplete-loading');
			} else {
	    		$.ajax({
					type : 'get',
					url  : 'http://www.omdbapi.com/',
					data : {
						s : request.term,
						y : $('#year').val(),
						type : $('#type').val()
					},
					dataType : 'json',
	    			success : function(movies){
						if(movies.Search != undefined){
							response(
								$.map(movies.Search,function(movie) {
										return {
											key : movie.imdbID,
											value : movie.Title 
										};
									}
								)
							)
						} else
							$('#title').removeClass('ui-autocomplete-loading');
					}
	    		});
			}
		},
		select: function(event, ui) {
    		$("#title").val(ui.item.value);
			getMovie(ui.item.key);
    	},
    	minLength : 3
	});
	
	$('#type').on('change',function(){
		if($('#type').val() == 'episode'){
			$('.episodes').show();
		} else {
			$('.episodes').hide();
		}
	});
	
	$('#loading').dialog({
		autoOpen : false,
		resizable : false,
		modal : true,
		draggable : false,
		width : 600,
		height : 'auto'
	});

});

function addAnswer(){
	var row = $("<tr id='"+index+"'><td>"+ (index) + "</td><td>"
			+ $('input[name="answer"]:checked').next().text()
			+ "</td><td><input type='button' value='X' "
			+ "onclick='delAnswer("+index+");'/></td>"
			+ "<td><input type='button' value='&gt;&gt;' "
			+ "onclick='editAnswer("+(index++)+");'/></td></tr>");
	row.appendTo('#answers tbody');
	$("#answers").trigger("update").trigger("applyWidgets"); 
}

function delAnswer(tr){
	$('#'+tr).remove();
	$("#answers").trigger("update").trigger("applyWidgets"); 

}

function editAnswer(tr){
	$('#trid').val(tr);
	$('#newText').val($('#'+tr+' td').eq(1).html());
	$('#editDialog').dialog('open');
}

function searchMovie(){
	$('#loading').dialog('open');
	var params = {
		s : $('#title').val(),
		y : $('#year').val(),
		type : $('#type').val(),
	};
	if($('#type').val() == 'episode'){
		params['s'] = undefined;
		params['Season'] = $('#season').val();
		params['Episode'] = $('#episode').val();
		params['t'] = $('#title').val();
	}
	$.ajax({
		type : 'get',
		url  : 'http://www.omdbapi.com/',
		data : params,
		dataType : 'json',
		success : function(data){
			if(data.Search != undefined){
				var movies = data.Search;
				$('#movieTable tbody').html('');
				for(var i=0;i<movies.length;i++){
					var movie = movies[i];
					var row = '<tr><td><a style="text-decoration: none;" href="javascript:getMovie(\'' 
							+ movie.imdbID + '\');">' + movie.Title + '</a></td>'
							+ '<td>' + movie.Type + '</td>'
							+ '<td>' + movie.Year + '</td></tr>';
					$('#movieTable tbody').append(row);
				}
				$("#movieTable").trigger("update").trigger("applyWidgets");
			} else if(data.Title != undefined){
				$('#movieTable tbody').html('');
				var movie = data;
				var row = '<tr><td><a style="text-decoration: none;" href="javascript:getMovie(\'' 
						+ movie.imdbID + '\');">' + movie.Title + '</a></td>'
						+ '<td>' + movie.Type + '</td>'
						+ '<td>' + movie.Year + '</td></tr>';
				$('#movieTable tbody').append(row);
				$("#movieTable").trigger("update").trigger("applyWidgets");
			}
			$('#loading').dialog('close');
		}
	});
}

function getMovie(id){
	$('#loading').dialog('open');
	$.ajax({
		type : 'get',
		url  : 'http://www.omdbapi.com/',
		data : {
			i : id,
			r : 'xml'
		},
		dataType : 'xml',
		success : function(xml){
			var movie = $(xml).find('movie').eq(0);
			var movieHTML = '<table>'
						  + '<tr><td rowspan="16"><iframe style="width:350px;height:500px;border:none;" src=\'data:text/html,<form method=post action="'+$(movie).attr('poster')
						  + '"></form><script>document.forms[0].submit()</script>\'></iframe></td><td>Type</td><td>'+$(movie).attr('type')+'</td></tr>'
					      + '<tr><td>Title</td><td><a target="_blank" href="http://www.imdb.com/title/'
						  + $(movie).attr('imdbID')+'">'+$(movie).attr('title')+'</a></td></tr>'
						  + '<tr><td>Rated</td><td>'+$(movie).attr('rated')+'</td></tr>'
						  + '<tr><td>Released</td><td>'+$(movie).attr('released')+'</td></tr>'
						  + '<tr><td>Runtime</td><td>'+$(movie).attr('runtime')+'</td></tr>'
						  + '<tr><td>Genre</td><td>'+$(movie).attr('genre')+'</td></tr>'
						  + '<tr><td>Director</td><td>'+$(movie).attr('director')+'</td></tr>'
						  + '<tr><td>Writer</td><td>'+$(movie).attr('writer')+'</td></tr>'
						  + '<tr><td>Actors</td><td>'+$(movie).attr('actors')+'</td></tr>'
						  + '<tr><td>Plot</td><td>'+$(movie).attr('plot')+'</td></tr>'
						  + '<tr><td>Language</td><td>'+$(movie).attr('language')+'</td></tr>'
						  + '<tr><td>Country</td><td>'+$(movie).attr('country')+'</td></tr>'
						  + '<tr><td>Awards</td><td>'+$(movie).attr('awards')+'</td></tr>'
						  + '<tr><td>Metascore</td><td>'+$(movie).attr('metascore')+'</td></tr>'
						  + '<tr><td>Rating</td><td>'+$(movie).attr('imdbRating')+'</td></tr>'
						  + '<tr><td>Votes</td><td>'+$(movie).attr('imdbVotes')+'</td></tr>'
						  + '</table>';
			$('#loading').dialog('close');
			$(movieHTML).dialog({
				title : $(movie).attr('title'),
				width : 800,
				modal : true
			});
		}
	});
}