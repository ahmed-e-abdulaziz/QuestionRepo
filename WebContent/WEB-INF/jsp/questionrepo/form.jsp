<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<t:genericpage title="QuestionRepo Form">

<script>
	$(document)
			.ready(
					function() {
						loadQuestions();
						readyFilter();
						var max_fields = 15; //maximum input boxes allowed
						
						var question_skills_wrapper = $(".questionskillscontainer"); //Fields wrapper
						
						var add_button_question_skill = $(".addquestionskill"); //Add Question Skill ID
						
 						
						var x = 1; //initlal text box count
						

						
						
						
						
						//Question_Skill
						$(add_button_question_skill).click(
										function(e) { //on add input button click
											e.preventDefault();
											if (x < max_fields) { //max input box allowed
												x++; //text box increment
												$(question_skills_wrapper).append('<div><select class="form-control" id="skills" name="skills[]">'+skillhtml+'</select><button type="button" id="remove" class="remove btn btn-info">-</button><div>'); //add input box
											}
										});

						$(question_skills_wrapper).on("click", ".remove", function(e) { //user click on remove text
							e.preventDefault();
							$(this).parent('div').remove();
							x--;
						})
						
						
					});
</script>

<spring:url value="/question/form" var="questionformurl"></spring:url>

<script type="text/javascript" >

jQuery(document).ready(function($) {
	$("#questionform").submit(function(event) {

		// Prevent the form from submitting via the browser.
		event.preventDefault();

	});

	$("#filterform").submit(function(event) {

		// Prevent the form from submitting via the browser.
		event.preventDefault();

	});
});

function getFormData($form){
    var unindexed_array = $form.serializeArray();
    var indexed_array = {};

    $.map(unindexed_array, function(n, i){
        indexed_array[n['name']] = n['value'];
    });

    return indexed_array;
}

function getSkillsData($skills){
    var unindexed_array = $skills.serializeArray();
	var final_array=[];
    $.map(unindexed_array, function(n, i){
        var indexed_array = {};
    	
        indexed_array['id'] = n['value'];
        final_array.push(indexed_array);
    });

    return final_array;
}
	


function deleteQuestion(id){
	var deletequestionpath = 'http://localhost:8080/questionrepo/question/delete/'+id+'.json';
	$.ajax({
            method: "DELETE",
            url: deletequestionpath,
            contentType: "application/json",
            success: function (data) {
                console.log('Deletion was successful.');
                console.log(JSON.stringify(data));
                loadQuestions();
            },
            error: function (data) {
                console.log('An error occurred.');
                console.log(data.responseText);
            },
        });
	
}

function updateQuestion(id){
	var getquestionpath='http://localhost:8080/questionrepo/question/get/'+id;
	
	$.ajax({
        type: "GET",
        url: getquestionpath,
        contentType: "application/json",
		dataType : 'json',
        success: function (data) {
            console.log('Submission was successful.');
            console.log(JSON.stringify(data));
            loadQuestionIntoForm(data);
        },
        error: function (data) {
            console.log('An error occurred.');
            console.log(data.responseText);
        },
    });
	
}
function addReturnButton(){
	var buttonText="Return to adding questions";
	var buttonHtml='<button onclick="resetForm()" class="col-md-12 btn btn-warning">'+buttonText+'</button>';
	$("#returnbuttoncontainer").html(buttonHtml);
}

function resetForm(){
	$("#id").val('');
	$("#questionbody").val('');
	$("#questioncategory").val(1);
	$("#questiontype").val(1);
	$("#questionlevel").val(1);
	$(".questionskillscontainer").html("");
	$(".skill0").val(1);
	$("#returnbuttoncontainer").html("");
}

function loadQuestionIntoForm(question){
	$("#id").val(question.id);
	$("#questionbody").val(question.body);
	$("#questioncategory").val(question.category.id);
	$("#questiontype").val(question.type.id);
	$("#questionlevel").val(question.level.id);
	
	
	$(".questionskillscontainer").html("");
	var len = question.skills.length;
	for(var i = 1;i<len; i++){
		$(".questionskillscontainer").append('<div><select class="form-control skill'+i+'" id="skills" name="skills[]">'+skillhtml+'</select><button type="button" id="remove" class="remove btn btn-info">-</button><div>');
	}
	for(var i =0;i<len;i++){
		var currentSkill=".skill"+i;
		$(currentSkill).val(question.skills[i].id);
	}
	addReturnButton(); 
}

function readyFilter(){
	$("#filterlevel").html('<option value="" selected>-No Filter-</option>');
	$("#filterlevel").append($("#questionlevel").html());
	
	$("#filtercategory").html('<option value="" selected>-No Filter-</option>');
	$("#filtercategory").append($("#questioncategory").html());
	
	$("#filtertype").html('<option value="" selected>-No Filter-</option>');
	$("#filtertype").append($("#questiontype").html());
	
}

function filter(){
	var category=$("#filtercategory").val();
	var level=$("#filterlevel").val();
	var type=$("#filtertype").val();
	
	var filterurl='http://localhost:8080/questionrepo/question/get/filter?';
	filterurl+="category="+category;
	filterurl+="&level="+level;
	filterurl+="&type="+type;
	
	console.log(filterurl);
	$.ajax({
        type: "GET",
        url: filterurl,
        contentType: "application/json",
        success: function (data) {
            console.log('Submission was successful.');
            console.log(JSON.stringify(data));
            loadFilteredQuestions(data);
        },
        error: function (data) {
            console.log('An error occurred.');
            console.log(data.responseText);
        },
    });
	
}

function loadFilteredQuestions(questions){
	if(questions.length!=0){
	var html='';
	var len=questions.length;
	for (var i = 0; i < len; i++) {
		html += '<tr>'
			+'<td>'+questions[i].body+'</td>'
			+'<td>'+questions[i].type.type+'</td>'
			+'<td>'+questions[i].category.category+'</td>'
			+'<td>'+questions[i].level.level+'</td>';
		var skilllen=questions[i].skills.length;
		var skillquestionhtml='<td>'+questions[i].skills[0].skill;
		for(var j = 1;j<skilllen; j++){
			skillquestionhtml+=', '+questions[i].skills[j].skill;
		}
			html+=skillquestionhtml+'</td>';
			html+='<td><button class="btn btn-sm btn-info" onclick="updateQuestion('+questions[i].id+')"><small>Edit</small></button><br>'
				+'<button class="btn btn-sm btn-warning" onclick="deleteQuestion('+questions[i].id+')"><small>Del</small></button></td>'
				+'</tr>';
}
	}
	else{
		html='<tr><td colspan="6" style="text-align:center">No questions available per the filtering</td><tr>'
	}
$('#questioncontainer').html(html);

}

function submitquestion(){
    var form = $('#questionform');
    var question={"id":document.forms['questionform'].elements['id'].value
    ,"category":{"id":document.forms['questionform'].elements['category'].value}
    ,"type":{"id":document.forms['questionform'].elements['type'].value}
    ,"level":{"id":document.forms['questionform'].elements['level'].value}
    ,"body":document.forms['questionform'].elements['body'].value
    ,"skills":[]}
    
    question.skills=getSkillsData($("select[name='skills[]']"));
    console.log(JSON.stringify(question));
    
    $.ajax({
        type: "POST",
        url: "${questionformurl}",
        contentType: "application/json",
        data: JSON.stringify(question),
 		dataType : 'json',
        success: function (data) {
            console.log('Submission was successful.');
            console.log(JSON.stringify(data));
            loadQuestions();
        },
        error: function (data) {
            console.log('An error occurred.');
            console.log(data.responseText);
        },
    });
}
</script>

<script>


var levelselection = 0;
var levelJSONPath = 'http://localhost:8080/questionrepo/level/all';

$.getJSON(	levelJSONPath,
				{
					ajax : 'true'
				},
				function(levels) {
					var html = '';
					var len = levels.length;
					for (var i = 0; i < len; i++) {
						if (levels[i].id == levelselection) {
							html += '<option value="'+levels[i].id+'" selected>'
									+ levels[i].level
									+ '</option>'
						} else {
							html += '<option value="'+levels[i].id+'">'
									+ levels[i].level
									+ '</option>';
						}
					}
					html += '</option>';

					$('#questionlevel').html(html);
					readyFilter();
				});


var categoryselection = 0;
var categoryJSONPath = 'http://localhost:8080/questionrepo/category/all';

$.getJSON(	categoryJSONPath,
				{
					ajax : 'true'
				},
				function(categories) {
					var html = '';
					var len = categories.length;
					for (var i = 0; i < len; i++) {
						if (categories[i].id == categoryselection) {
							html += '<option value="'+categories[i].id+'" selected>'
									+ categories[i].category
									+ '</option>'
						} else {
							html += '<option value="'+categories[i].id+'">'
									+ categories[i].category
									+ '</option>';
						}
					}
					html += '</option>';

					$('#questioncategory').html(html);
					readyFilter();
				});
				

var typeselection = 0;
var typeJSONPath = 'http://localhost:8080/questionrepo/type/all';

$.getJSON(	typeJSONPath,
				{
					ajax : 'true'
				},
				function(types) {
					var html = '';
					var len = types.length;
					for (var i = 0; i < len; i++) {
						if (types[i].id == typeselection) {
							html += '<option value="'+types[i].id+'" selected>'
									+ types[i].type
									+ '</option>'
						} else {
							html += '<option value="'+types[i].id+'">'
									+ types[i].type
									+ '</option>';
						}
					}
					html += '</option>';

					$('#questiontype').html(html);
					readyFilter();
				});



var skillselection = 0;
var skillJSONPath = 'http://localhost:8080/questionrepo/skill/all';
var skillhtml='';
$.getJSON(	skillJSONPath,
				{
					ajax : 'true'
				},
				function(skills) {
					var html = '';
					var len = skills.length;
					for (var i = 0; i < len; i++) {
						if (skills[i].id == skillselection) {
							html += '<option value="'+skills[i].id+'" selected>'
									+ skills[i].skill
									+ '</option>'
						} else {
							html += '<option value="'+skills[i].id+'">'
									+ skills[i].skill
									+ '</option>';
						}
					}
					html += '</option>';
					skillhtml=html;
					$('#skills').html(html);
					
				});


function loadQuestions(){
	var questionJSONPath = 'http://localhost:8080/questionrepo/question/all';


	$.getJSON(	questionJSONPath,
				{
					ajax : 'true'
				},
				function(questions) {
					var html = '';
					var len = questions.length;
					for (var i = 0; i < len; i++) {
							html += '<tr>'
								+'<td>'+questions[i].body+'</td>'
								+'<td>'+questions[i].type.type+'</td>'
								+'<td>'+questions[i].category.category+'</td>'
								+'<td>'+questions[i].level.level+'</td>';
							var skilllen=questions[i].skills.length;
							var skillquestionhtml='<td>'+questions[i].skills[0].skill;
							for(var j = 1;j<skilllen; j++){
								skillquestionhtml+=', '+questions[i].skills[j].skill;
							}
								html+=skillquestionhtml+'</td>';
								html+='<td><button class="btn btn-sm btn-info" onclick="updateQuestion('+questions[i].id+')"><small>Edit</small></button><br>'
									+'<button class="btn btn-sm btn-warning" onclick="deleteQuestion('+questions[i].id+')"><small>Del</small></button></td>'
									+'</tr>';
					}
					$('#questioncontainer').html(html);
				});

}
</script>
	
	<div id="login-overlay" class="col-md-6 modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h3 class="modal-title">Question Form</h3>
					</div>
					<div class="modal-body">
						<div class="well">
							<div class="row">
							<div id="returnbuttoncontainer"></div>
								<form id="questionform" method="post" action="${questionformurl}" role="form">
								<input type="hidden" value="" name="id" id="id">

									<div class="row">
										<div class="col-md-12">
											<div class="form-group">
											
												<label class="pull-left col-md-2">Body</label>
												<div class="col-md-10">
												<div class="form-group">
														<label for="form_message"></label>
														<textarea id="questionbody" name="body"
															class="form-control"
															placeholder="Enter Question Body"
															rows="4" required></textarea>
													</div>
												</div>
												<label class="pull-left col-md-2">Category</label>
												<div class="col-md-10">

													<select class="form-control" id="questioncategory"
														name="category">
														
													</select>
												</div>
												<label class="pull-left col-md-2">Type</label>
												<div class="col-md-10">

													<select class="form-control" id="questiontype"
														name="type">
														
													</select>
												</div>
												<label class="pull-left col-md-2">Level</label>
												<div class="col-md-10">

													<select class="form-control" id="questionlevel"
														name="level">
														
													</select>
												</div>
												
												<label>Skills </label> <small style="color: graytext;">--> If the same skill is chosen twice, it will still be only stored ONCE </small>
												<div><select class="form-control skill0" id="skills"
														name="skills[]">
														
														</select>
													</div>
												<button id="addquestionskill" class="addquestionskill btn btn-success">+</button>
												<div class="questionskillscontainer" id="questionskillscontainer"></div>
											</div>
										</div>
									</div>
									<div class="col-md-12">

											<button onclick="submitquestion()" class="btn btn-success col-md-12">Submit Question</button>
									</div>

								</form>

							</div>
						</div>
					</div>
				</div>
			</div>

		<div class="col-md-6" style="padding-top: 30px">
			<div class="col-md-12">
			<div class="well">
			 <form class="form-inline" id="filterform" name="filterform">
			 
			  <div class="form-group">
			    <label>Type</label>
			    <select class="input-sm form-control" id="filtertype" name="filtertype">
														
				</select>
			  </div>
 				<div class="form-group">
    			<label>Category</label>
			    <select class="input-sm form-control" id="filtercategory" name="filtercategory">
														
				</select>
			  </div>
			  <div class="form-group">
			    <label>Level</label>
			    <select class="input-sm form-control" id="filterlevel" name="filterlevel">
														
				</select>
			  </div>
			  <button class="btn btn-default btn-sm" onclick="filter()">Go</button>
				<br>
				<small id="resetfiltertext" style="color:graytext;">To reset the filters to see all questions make all filters to -No filter- then press Go</small>
			</form> 
				<table  class="table table table-inverse">
				<thead>
				<tr>
				<td >Question</td>
				<td >Type</td>
				<td >Category</td>
				<td >Level</td>
				<td >Skills</td>
				<td >Operations</td>
				</tr>
				</thead>
				<tbody id="questioncontainer">
				
				</tbody>
				</table>
				</div>			
				</div>
		</div>


</t:genericpage>