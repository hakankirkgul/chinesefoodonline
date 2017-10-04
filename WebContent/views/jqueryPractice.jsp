<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
	<title>JQuery / JQuery UI and Plugins</title>
	<link rel="stylesheet" href="/css/jq/tablesorter/jq.css" type="text/css"/>
	<link rel="stylesheet" href="/css/jq/tablesorter/theme.blue.css" type="text/css"/>
	<link rel="stylesheet" href="/css/jq/jquery-ui-1.10.4.custom.min.css"></link>
	<style type="text/css">
		.ui-autocomplete-loading {
			background: white url('../css/jq/images/ui-anim_basic_16x16.gif') right center no-repeat;
		}
	</style>
</head>
<body style="font-family:arial;font-size:8pt;">
	<div id="content">
		<ul>		
			<li><a href="#tab-1"><span>Tablesorter, dialog, draggable, droppable</span></a></li> <!-- TAB MENU -->
			<li><a href="#tab-2"><span>Accordion, draggable, droppable and HTML5 Canvas</span></a></li> <!-- TAB MENU -->
			<li><a href="#tab-3"><span>IMDB API</span></a></li> <!-- TAB MENU -->
		</ul>
		<div id="tab-1">
			<ul id="sayList" style="list-style-image:url('http://icons.iconarchive.com/icons/famfamfam/mini/16/arrow-right-icon.png');">
				<li>
					<input id="radioOK" type="radio" value="add" name="answer" checked="checked"/>
					<label for="radioOK">Add a row to table</label>
				</li>
				<li>
					<input id="radioAWESOME" type="radio" value="edit" name="answer"/>
					<label for="radioAWESOME">Edit a cell</label>
				</li>
				<li>
					<input id="radioLegendary" type="radio" value="delete" name="answer"/>
					<label for="radioLegendary">Delete a row from table</label>
				</li>
				<li>
					<input id="radioHighfive" type="radio" value="sort" name="answer"/>
					<label for="radioHighfive">Sort table with tablesorter and its zebra plugin.</label>
				</li>
			</ul>
			<input type="button" id="btnSay" value="Add row" onclick="addAnswer();"/>
			<div id="answersDiv" style="width:800px;height:600px;overflow:auto;">
				<table class="tablesorter-blue" id="answers" style="text-align:left;width:100%;">
				   <thead>
					  <tr>
						  <th style="width:10%;">#</th>
						  <th style="width:80%;">Answer</th>
						  <th style="width:5%;"></th>
						  <th style="width:5%;"></th>
					  </tr>
				   </thead>
				   <tbody></tbody>
				</table>
			</div>
			<div id="rule"></div>
		</div>
		<div id="tab-2">
			<div id="accordion">
				<h3><a href="#">Drag an item on the list below to trash can</a></h3>
				<table style="width:100%;"><tr>
					<td style="width:70%;"><ul id="draglist" style="list-style-image:url('http://icons.iconarchive.com/icons/famfamfam/mini/16/arrow-right-icon.png');">
						<li>Trash</li>
						<li>Waste</li>
						<li>Garbage</li>
						<li>Junk</li>
						<li>Rubbish</li>
						<li>Litter</li>
					</ul></td>
					<td style="width:30%;"><img id="trash" src="http://findicons.com/files//icons/562/glaze/128/trashcan_empty.png"/></td>
				</tr></table>
				<h3><a href="#">A pattern drawn on HTML5 canvas</a></h3>
				<div>
					<canvas id="myCanvas" width="500" height="500" style="border:1px solid #c3c3c3;">
						Your browser does not support the canvas element.
					</canvas>
				</div>
			</div>
		</div>
		<div id="tab-3">
			<table><tr>
				<th>Title</th><td><input type="text" id="title"/></td>
				<th>Type</th><td><select id="type">
					<option value="movie">Movie</option>
					<option value="series">Series</option>
					<option value="episode">Episode</option>
				</select></td>
				<th>Year</th><td><input type="text" id="year"/></td>
				<th class="episodes" style="display:none;">Season</th><td class="episodes" style="display:none;"><input type="text" id="season"/></td>
				<th class="episodes" style="display:none;">Episode</th><td class="episodes" style="display:none;"><input type="text" id="episode"/></td>
				<td><input type="button" value="Search" onclick="searchMovie();"/></td>
			</tr></table>
			<table id="movieTable" class="tablesorter-blue">
				<thead><tr>
					<th>Title</th>
					<th>Type</th>
					<th>Year</th>
				</tr></thead>
				<tbody></tbody>
			</table>
			<p>Courtesy of <a href="http://www.omdbapi.com" target="_blank">The Open Movie Database API by Brian Fritz</a></p>
		</div>
	</div>
	<div id="editDialog" style="display:none;">
		<label>New Text : </label>
		<input id="newText" type="text" style="width:300px;"/>
		<input id="trid" type="hidden"/>
	</div>
	<div id="loading" style="display:none;text-align:center;vertical-align: center;">
		<img src="/images/animated_loading.gif"/>
	</div>
	
	<script type="text/javascript" src="/js/jq/jquery-2.1.1.min.js"></script>
	<script type="text/javascript" src="/js/jq/jquery-ui-1.10.4.custom.min.js"></script>
	<script type="text/javascript" src="/js/jq/jquery.tablesorter.min.js"></script>
	<script type="text/javascript" src="/js/jqueryPractice.js?ver=3.0"></script>
</body>
</html>

