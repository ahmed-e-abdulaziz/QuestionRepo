<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<t:genericpage title="Question Settings">

<spring:url value="/skill/form" var="skillformurl"></spring:url>
<spring:url value="/level/form" var="levelformurl"></spring:url>
<spring:url value="/type/form" var="typeformurl"></spring:url>
<spring:url value="/category/form" var="categoryformurl"></spring:url>


<script>
jQuery(document).ready(function($) {
	
	loadSkill();
	loadLevel();
	loadType();
	loadCategory();
	
	$("#skillform").submit(function(event) {
		event.preventDefault();
	});
	$("#levelform").submit(function(event) {
		event.preventDefault();
	});
	$("#typeform").submit(function(event) {
		event.preventDefault();
	});
	$("#categoryform").submit(function(event) {
		event.preventDefault();
	});
});

function addSkill(){

    var skill={"id":null
    ,"skill":document.forms['skillform'].elements['skill'].value}
    
    console.log(JSON.stringify(skill));
    
    $.ajax({
        type: "POST",
        url: "${skillformurl}",
        contentType: "application/json",
        data: JSON.stringify(skill),
		dataType : 'json',
        success: function (data) {
            console.log('Submission was successful.');
            console.log(JSON.stringify(data));
            loadSkill();
        },
        error: function (data) {
            console.log('An error occurred.');
            console.log(data.responseText);
        },
    });
}
function addLevel(){

    var level={"id":null
    ,"level":document.forms['levelform'].elements['level'].value}
    
    console.log(JSON.stringify(level));
    
    $.ajax({
        type: "POST",
        url: "${levelformurl}",
        contentType: "application/json",
        data: JSON.stringify(level),
		dataType : 'json',
        success: function (data) {
            console.log('Submission was successful.');
            console.log(JSON.stringify(data));
            loadLevel();
        },
        error: function (data) {
            console.log('An error occurred.');
            console.log(data.responseText);
        },
    });
    loadLevel();
}
function addType(){
	
    var type={"id":null
    	    ,"type":document.forms['typeform'].elements['type'].value}
    	    
    	    console.log(JSON.stringify(skill));
    	    
    	    $.ajax({
    	        type: "POST",
    	        url: "${typeformurl}",
    	        contentType: "application/json",
    	        data: JSON.stringify(type),
    			dataType : 'json',
    	        success: function (data) {
    	            console.log('Submission was successful.');
    	            console.log(JSON.stringify(data));
    	    	    loadType();
    	        },
    	        error: function (data) {
    	            console.log('An error occurred.');
    	            console.log(data.responseText);
    	        },
    	    });
	
}
function addCategory(){
	
    var category={"id":null
    	    ,"category":document.forms['categoryform'].elements['category'].value}
    	    
    	    console.log(JSON.stringify(skill));
    	    
    	    $.ajax({
    	        type: "POST",
    	        url: "${categoryformurl}",
    	        contentType: "application/json",
    	        data: JSON.stringify(category),
    			dataType : 'json',
    	        success: function (data) {
    	            console.log('Submission was successful.');
    	            console.log(JSON.stringify(data));
    	    	    loadCategory();
    	        },
    	        error: function (data) {
    	            console.log('An error occurred.');
    	            console.log(data.responseText);
    	        },
    	    });
}

</script>

<script>
function deleteSkill(id){
	var deleteskillpath = 'http://localhost:8080/questionrepo/skill/delete/'+id+'.json';
	$.ajax({
            method: "DELETE",
            url: deleteskillpath,
            contentType: "application/json",
            success: function (data) {
                console.log('Deletion was successful.');
                console.log(JSON.stringify(data));
                loadSkill();
            },
            error: function (data) {
                console.log('An error occurred.');
                console.log(data.responseText);
            },
        });
}
function deleteLevel(id){
	var deletelevelpath = 'http://localhost:8080/questionrepo/level/delete/'+id+'.json';
	$.ajax({
            method: "DELETE",
            url: deletelevelpath,
            contentType: "application/json",
            success: function (data) {
                console.log('Deletion was successful.');
                console.log(JSON.stringify(data));
                loadLevel();
            },
            error: function (data) {
                console.log('An error occurred.');
                console.log(data.responseText);
            },
        });
	
}
function deleteType(id){
	var deletetypepath = 'http://localhost:8080/questionrepo/type/delete/'+id+'.json';
	$.ajax({
            method: "DELETE",
            url: deletetypepath,
            contentType: "application/json",
            success: function (data) {
                console.log('Deletion was successful.');
                console.log(JSON.stringify(data));
                loadType();
            },
            error: function (data) {
                console.log('An error occurred.');
                console.log(data.responseText);
            },
        });
	
}
function deleteCategory(id){
	var deletecategorypath = 'http://localhost:8080/questionrepo/category/delete/'+id+'.json';
	$.ajax({
            method: "DELETE",
            url: deletecategorypath,
            contentType: "application/json",
            success: function (data) {
                console.log('Deletion was successful.');
                console.log(JSON.stringify(data));
                loadCategory();
            },
            error: function (data) {
                console.log('An error occurred.');
                console.log(data.responseText);
            },
        });
	
}
</script>

<script>

function loadLevel(){
var levelJSONPath = 'http://localhost:8080/questionrepo/level/all';

$.getJSON(	levelJSONPath,
				{
					ajax : 'true'
				},
				function(levels) {
					var html = '';
					var len = levels.length;
					for (var i = 0; i < len; i++) {
						html += '<tr>'
							+'<td>'+levels[i].id+'</td>'
							+'<td>'+levels[i].level+'</td>'
							+'<td><button class="btn-sm btn-danger btn" onclick="deleteLevel('+levels[i].id+')">-</button></td>'
							+'</tr>';
					}
					$('#levelbody').html(html);
				});
}

function loadCategory(){

var categoryJSONPath = 'http://localhost:8080/questionrepo/category/all';

$.getJSON(	categoryJSONPath,
				{
					ajax : 'true'
				},
				function(categories) {
					var html = '';
					var len = categories.length;
					for (var i = 0; i < len; i++) {
						html += '<tr>'
							+'<td>'+categories[i].id+'</td>'
							+'<td>'+categories[i].category+'</td>'
							+'<td><button class="btn-sm btn-danger btn" onclick="deleteCategory('+categories[i].id+')">-</button></td>'
							+'</tr>';
					}
					$('#categorybody').html(html);
				});
}

function loadType(){
	
var typeJSONPath = 'http://localhost:8080/questionrepo/type/all';

$.getJSON(	typeJSONPath,
		{
			ajax : 'true'
		},
		function(types) {
			var html = '';
			var len = types.length;
			for (var i = 0; i < len; i++) {
				html += '<tr>'
					+'<td>'+types[i].id+'</td>'
					+'<td>'+types[i].type+'</td>'
					+'<td><button class="btn-sm btn-danger btn" onclick="deleteType('+types[i].id+')">-</a></td>'
					+'</tr>';
			}
			$('#typebody').html(html);
		});

}

function loadSkill(){
var skillJSONPath = 'http://localhost:8080/questionrepo/skill/all';

$.getJSON(	skillJSONPath,
		{
			ajax : 'true'
		},
		function(skills) {
			var html = '';
			var len = skills.length;
			for (var i = 0; i < len; i++) {
				html += '<tr>'
					+'<td>'+skills[i].id+'</td>'
					+'<td>'+skills[i].skill+'</td>'
					+'<td><button class="btn-sm btn-danger btn" onclick="deleteSkill('+skills[i].id+')">-</button></td>'
					+'</tr>';
			}
			$('#skillbody').html(html);
		});
}
</script>

		<div class="col-md-3" style="padding-top: 20px; padding-bottom: 20px;">
				<div class="modal-content">
					<div class="modal-header">
						<h3 class="modal-title">Skills</h3>
					</div>
					<div class="modal-body">
						<div class="well">
							<div class="row">
							<table class="table table-responsive" id="skillbody">
												
							</table>
								<form id="skillform" method="post" action="${skillformurl}" role="form">
									<div class="row">
										<div class="col-md-12">
											<div class="form-group">
												<div><input id="skill" type="text" name="skill" class="form-control" required></div>
										</div>
										</div>
									</div>
									<div class="col-md-12">
										<button type="submit" class="btn btn-success col-md-12" onclick="addSkill()">Submit changes</button>
									</div>

								</form>

							</div>
						</div>
					</div>
			</div>
		</div>
				<div class="col-md-3" style="padding-top: 20px; padding-bottom: 20px;">
				<div class="modal-content">
					<div class="modal-header">
						<h3 class="modal-title">Levels</h3><small>(all questions related to any deleted level will be deleted as well)</small>
					</div>
					<div class="modal-body">
						<div class="well">
							<div class="row">
							
												<table class="table table-responsive" id="levelbody">
												
												</table>
								<form id="levelform" method="post" action="${levelformurl}"  role="form">
									<div class="row">
										<div class="col-md-12">
											<div class="form-group">
												<div><input type="text" name="level" class="form-control" required></div>
										</div>
										</div>
									</div>
									<div class="col-md-12">
										
										<button type="submit" class="btn btn-success col-md-12" onclick="addLevel()">Submit changes</button>
									</div>

								</form>

							</div>
						</div>
					</div>
			</div>
		</div>
		<div class="col-md-3" style="padding-top: 20px; padding-bottom: 20px;">
				<div class="modal-content">
					<div class="modal-header">
						<h3 class="modal-title">Types</h3>
						<small>(all questions related to any deleted type will be deleted as well)</small>
					</div>
					<div class="modal-body">
						<div class="well">
							<div class="row">
							
												<table class="table table-responsive" id="typebody">
												
												</table>
								<form id="typeform" method="post" action="${typeformurl}"  role="form">
									<div class="row">
										<div class="col-md-12">
											<div class="form-group">
												<div><input type="text" name="type" class="form-control" required></div>
											</div>
										</div>
									</div>
									<div class="col-md-12">
										
										<button type="submit" class="btn btn-success col-md-12" onclick="addType()">Submit changes</button>
									</div>

								</form>

							</div>
						</div>
					</div>
			</div>
		</div>
		<div class="col-md-3" style ="padding-top: 20px; padding-bottom: 20px;">
				<div class="modal-content">
					<div class="modal-header">
						<h3 class="modal-title">Categories</h3>
						<small>(all questions related to any deleted category will be deleted as well)</small>
					</div>
					<div class="modal-body">
						<div class="well"> 
							<div class="row">
							
												<table class="table table-responsive" id="categorybody">
												
												</table>
								<form id="categoryform" method="post" action="${categoryformurl}"  role="form">
									<div class="row">
										<div class="col-md-12">
											<div class="form-group">
												<div><input type="text" name="category" class="form-control" required></div>
										</div>
										</div>
									</div>
									<div class="col-md-12">
										
										<button type="submit" class="btn btn-success col-md-12" onclick="addCategory()">Submit changes</button>
									</div>

								</form>

							</div>
						</div>
					</div>
			</div>
		</div> 

</t:genericpage>