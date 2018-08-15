
 
<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head></head>
<h2  style="color:red;" align=center></h2>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.11.4/themes/redmond/jquery-ui.min.css">
<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/free-jqgrid/4.15.4/css/ui.jqgrid.min.css">
<script
src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
src="https://cdnjs.cloudflare.com/ajax/libs/free-jqgrid/4.15.4/jquery.jqgrid.min.js"></script>

<style>
video{
 height:100px;
width:100%; 
}

img{
width:100%;
height:150px;
}


   .ui-jqgrid-titlebar {
       display: none;
   }

   .ui-jqgrid-hbox {
       display: none;
   }

   .align {
       float: left;
   }

   #pager {
       margin-top: 100px !important;
       height: 50px !important;
       width: 100%;
       display: none;
   }

   .ui-jqgrid-pager {
       width: 100% !important;
   }

  /*  .image {
       height: 200px;
       width: 100%;
   } */

   .ui-jqgrid tr.jqgrow td {
       height: auto;
       border-bottom-width: none !important;
       border-bottom-color: none !important;
       border-bottom-style: none !important;
       float: left !important;
       width: 100% !important;
   }

   .ui-widget-content {
      
       border: none !important;
   }

   .ui-jqgrid tr.ui-row-ltr td {
       float: left;
       text-align: center !important;
       font-size:14px !important;
       border-right-width: 1px;
       border-right-style: none !important;
       border: none;
   }

   .ui-widget-content {
      /*  padding: 0.5% !important; */
       width: 100% !important;
   }

   .ui-row-ltr {
   padding: 5px;
       width: 25% !important;
       padding-bottom: 10px;
   	/* margin: .5% !important; */
       /*border: 1px solid #c1c1c1 !important;*/
       border: 5px solid #e5e5e5 !important;
   }

  

   table tbody {
   background: #e5e5e5;
       width: 100% !important;
   }

   td div {
       /*margin: 5px;*/
   }

   .ui-jqgrid-bdiv {
       width: 100% !important;
   }

   .ui-jqgrid tr {
       float: left !important;
       /*margin: 0px 60px 0px 0px;*/
   }

   tbody.ui-jqgrid tr {
       /*border: 1px solid #c0bebe !important;*/
       padding: 5px !important;
       margin: 10px !important;
       border: none;
   }

   .ui-widget-content {
       border: 1px solid #a6c9e2;
       color: #222222;
       background: #fff !important;
       border-radius:10px;
      /*  margin-bottom:10px !important; */
       
   }

   .ui-state-hover {
       color: none !important;
       background-color:#fff !important;
   }
   /* #list_records td .view
   {
     background-color: blue;
   } */
   .bold {
       color: black;
   }
   .ui-jqgrid tr.jqfoot>td, .ui-jqgrid tr.jqgroup>td, .ui-jqgrid tr.jqgrow>td {
   padding: 0px 0px 0 0px;
}

   .ui-jqgrid .ui-jqgrid-view {
       position: relative;
       left: 0;
       top: 0;
       padding: 0;
       font-size: 11px;
       width: 100% !important;
   }

   .ui-jqgrid .ui-jqgrid-btable {
       table-layout: fixed;
       margin: 0;
       width: 100% !important;
       outline-style: none;
   }

   .jqgfirstrow,.ui-widget-header ,.jqgrid-rownum {
       display: none;

</style> 
<script type="text/javascript">

$(document).ready(function(){
 	$("#packages-grid").jqGrid({
 		datatype : 'json',
 		mtype:'Post',
        url: "<c:url value='listOfDoctorsforHospital'/>",
	  	
	  	colModel:[
	  	{name:'register_as_doctor_id',index:'register_as_doctor_id', width:70,hidden:false, edithidden:true /* editable:true,editoptions:{readonly:true,size:10} */},
	  	{name:'vendor_reg_id',index:'vendor_reg_id', width:70,hidden:true,  edithidden:true /* editable:true,editoptions:{readonly:true,size:10} */},
	  	{name:'doctor_degree',index:'doctor_degree', width:100, hidden:false,editable:true, editrules:{required:true}, editoptions:{size:10}},
	  	{name:'doctor_specialization',index:'doctor_specialization', width:100, hidden:false,editable:true, editrules:{required:true}, editoptions:{size:10}},
	  	{name:'hospitalname',index:'hospitalname', width:100, hidden:false,editable:true, editrules:{required:true}, editoptions:{size:10}},
	  	{name:'experience',index:'experience', width:100, hidden:false,editable:true, editrules:{required:true}, editoptions:{size:10}},
		
	 /*  	{name:'data',index:'data', width:400,editable:true,edittype:'file',edithidden:true,  editrules:{required:true}, editoptions:{size:10},formatter: function $(cellvalue, options, rowObject) {
            var cellPrefix = '';
            if (rowObject.Category === '3') {
                cellPrefix = iconAlert;
            }
            return cellPrefix + '<video width="400" controls=false><source src="data:video/mp4;base64,'+ cellvalue +'">' +
                   cellvalue + '</video>';
        }},
	  	{name:'video_title',index:'video_title', width:70,hidden:false,editable:true, editrules:{required:true}, editoptions:{size:10}},

		{name:'duration',index:'duration', width:100,editable:true, hidden:true, editrules:{required:true}, editoptions:{size:10}},
	  	{name:'width',index:'width', width:100,editable:true,hidden:true, editrules:{required:true}, editoptions:{size:10}},
	  	{name:'height',index:'height', width:160,editable:true,hidden:true,  editrules:{required:true}, editoptions:{size:10}},
	    {name:'codec_name',index:'codec_name', width:100,hidden:true, editable:true, editrules:{required:true}, editoptions:{size:10}},
	  	{name:'codec_description',index:'codec_description', hidden:true, width:100,editable:true, editrules:{required:true}, editoptions:{size:10}},
	    {name:'code_tag',index:'code_tag', width:100,hidden:true, editable:true, editrules:{required:true}, editoptions:{size:10}},
		{name:'bitrate',index:'bitrate', width:100,hidden:true, edithidden:true/* editable:true, editrules:{required:true}, editoptions:{size:10} },
		{name:'frame_rate',index:'frame_rate',hidden:true, width:100,editable:true, editrules:{required:true}, editoptions:{size:10}},
		{name:'uploaded_date',index:'uploaded_date', hidden:true, width:100,editable:true, editrules:{required:true}, editoptions:{size:10}},
		{name:'tutorial_links',index:'tutorial_links',hidden:true, width:100,editable:false, editrules:{required:false}, editoptions:{size:10},formatter: 'showlink', formatoptions: { baseLinkUrl: "https://www.youtube.com/?gl=IN"}},
		
		 */
	  	],
		pager: jQuery('#packages-grid-page'),
		postData: {
			filters:"filters"
/* 			filters:{
				groupOp : "groupOp"
				rules : [
					"field","op","data"	
				]
			} */
	  	},
   		/* guiStyle: "bootstrap", */
		iconSet: "fontAwesome",
		rowNum:true,
		/* rowList:[10 , 20 ,30,50], */
		width: 100,
		viewrecords: true,
		loadonce:false,
		rownumbers: true,
		sortname : 'register_as_doctor_id',
		sortorder: "asc",
		filters:{"groupOp":"AND","rules":[]},
		caption:"Our Doctors",
		emptyrecords: "NO RECORDS TO DISPLAY",
		multiselect:false,
		jsonReader : {
	        root: "rows",
	        page: "page",
	        total: "total",
	        records: "records",
	        repeatitems: false,
	        cell: "cell",
	        id: "register_as_doctor_id"
	    }
 	});
	$("#packages-grid").jqGrid('navGrid','#packages-grid-page',
			/* {stringResult: true, edit:false, add:false, del:false, search:true}, */
			{edit:false, add:false, del:false, search:false, refresh:false},
			{}, {}, {}, 
			{ 	// search
				sopt:['cn'/* , 'eq', 'ne', 'lt', 'gt', 'bw', 'ew' */],
				closeOnEscape: true, 
				multipleSearch: false, 
				closeAfterSearch: true
			},{}
	);
	

	function Link(id) {

	    var row = id.split("=");
	    var row_ID = row[1];
	    var sitename= $("#packages-grid").getCell(row_ID, 'tutorial_links');
	    var url = "https://www.youtube.com/?gl=IN"+tutorial_links; // sitename will be like google.com or yahoo.com

	    window.open(url);


	}
	
/* 	$("#packages-grid").navButtonAdd('#packages-grid-page',
			{ 	caption:"Add", 
				buttonicon:"fa fa-lg fa-fw fa-plus", 
				onClickButton: addRow,
				position: "last", 
				title:"ADD ", 
				cursor: "pointer"
			} 
	);
	
	$("#packages-grid").navButtonAdd('#packages-grid-page',
			{ 	caption:"Edit", 
				buttonicon:"fa fa-lg fa-fw fa-pencil", 
				onClickButton: editRow,
				position: "last", 
				title:"EDIT", 
				cursor: "pointer"
			} 
	);
	
	$("#packages-grid").navButtonAdd('#packages-grid-page',
		{ 	caption:"Delete", 
			buttonicon:"fa fa-lg fa-fw fa-trash-o", 
			onClickButton: deleteRow,
			position: "last", 
			title:"DELETE ", 
			cursor: "pointer"
		} 
	);
	/* // Toolbar Search
	jQuery("#packages-grid").jqGrid('filterToolbar',{searchOperators : true});*/
}); 

//adding image
/* function formatVideo(cellValue, options, rowObject) {
	var video = "<video src='data:video/mp4;base64," + cellValue + "' originalValue='" + cellValue + "' />";
	return video;
	}  */

//adding row
function addRow() {
	// Get the currently selected row
	$('#packages-grid').jqGrid('editGridRow','new',
    		{ 	
		url: "<c:url value='/ceramicgrid/add/?${_csrf.parameterName}=${_csrf.token}'/>", 				editData: {},
                serializeEditData: function(data){ 
                    data.id = 0; 
                    return $.param(data);
                },
			    recreateForm: true,
/* 			    beforeShowForm: function(form) {
		            $('#pData').hide();  
		            $('#nData').hide();
		            $('#password',form).addClass('ui-widget-content').addClass('ui-corner-all');
			    }, */
				beforeInitData: function(form) {},
				closeAfterAdd: true,
				reloadAfterSubmit:true,
				afterSubmit : function(response, postdata) 
				{ 
					var result = eval('(' + response.responseText + ')');
					var errors = "";
					$("#packages-grid").trigger("reloadGrid"); 
				
					
					
			        if (result.success == false) {
						for (var i = 0; i < result.message.length; i++) {
							errors +=  result.message[i] + "<br/>";
						}
			        }  else {
			        	$('#msgbox').text('Entry has been added successfully');
						$('#msgbox').dialog( 
								{	title: 'Success',
									modal: true,
									buttons: {"Ok": function()  {
										$(this).dialog("close");} 
									}
								});
	                }
			    	// only used for adding new records
			    	var newId = null;
					return [result.success, errors, newId];
				}
    		});
} // end of addRow


//editing row
function editRow() {
	// Get the currently selected row
	var row = $('#packages-grid').jqGrid('getGridParam','selrow');
	if( row != null ) {
		$('#packages-grid').jqGrid('editGridRow', row,
			{	url: "<c:url value='/ceramicgrid/update/?${_csrf.parameterName}=${_csrf.token}'/>", 
				editData: {},
		        recreateForm: true,
		        beforeShowForm: function(form) {
		            $('#pData').hide();  
		            $('#nData').hide();
		        },
				beforeInitData: function(form) {},
				closeAfterEdit: true,
				reloadAfterSubmit:true,
				afterSubmit : function(response, postdata) 
				{ 
		         var result = eval('(' + response.responseText + ')');
					var errors = "";
					$('#packages-grid').trigger("reloadGrid");
		            if (result.success == false) {
						for (var i = 0; i < result.message.length; i++) {
							errors +=  result.message[i] + "<br/>";
						}
		            }  else {
		            	$('#msgbox').text('Entry has been edited successfully');
						$('#msgbox').dialog( 
								{	title: 'Success',
									modal: true,
									buttons: {"Ok": function()  {
										$(this).dialog("close");} 
									}
								});
	                }
			    	// only used for adding new records
			    	var newId = null;
		        	
					return [result.success, errors, newId];
				}
			});
	} else {
		$('#msgbox').text('You must select a record first!');
		$('#msgbox').dialog( 
				{	title: 'Error',
					modal: true,
					buttons: {"Ok": function()  {
						$(this).dialog("close");} 
					}
				});
	}
}

//deleting row

function deleteRow(obj, args) {
	// Get the currently selected row
    var row = $('#packages-grid').jqGrid('getGridParam','selrow');
    // A pop-up dialog will appear to confirm the selected action
	if( row != null ) 
		$('#packages-grid').jqGrid( 'delGridRow', row,
          	{	url: "<c:url value='/ceramicgrid/delete/?${_csrf.parameterName}=${_csrf.token}'/>", 
				recreateForm: true,
			    beforeShowForm: function(form) {
			    	//Change title
			        $(".delmsg").replaceWith('<span style="white-space: pre;">' +
			        		'Delete selected record?' + '</span>');
	            	//hide arrows
			        $('#pData').hide();  
			        $('#nData').hide();
			    },
          		reloadAfterSubmit:true,
          		closeAfterDelete: true,
          		serializeDelData: function (postdata) {
	          	      var rowdata = $('#packages-grid').getRowData(postdata.id);
	          	      // append postdata with any information 
	          	      return {id: postdata.id, oper: postdata.oper, packages: rowdata.packages};
	          	},
          		afterSubmit : function(response, postdata) 
				{ 
		            var result = eval('(' + response.responseText + ')');
					var errors = "";
					$('#packages-grid').trigger("reloadGrid");
					
		            if (result.success == false) {
						for (var i = 0; i < result.message.length; i++) {
							errors +=  result.message[i] + "<br/>";
						}
		            }  else {
		            	$('#msgbox').text('Entry has been deleted successfully');
						$('#msgbox').dialog( 
								{	title: 'Success',
									modal: true,
									buttons: {"Ok": function()  {
										$(this).dialog("close");} 
									}
								});
	                }
			    	// only used for adding new records
			    	var newId = null;
		        	
					return [result.success, errors, newId];
				}
          	});
	else {
		$('#msgbox').text('You must select a record first!');
		$('#msgbox').dialog( 
				{	title: 'Error',
					modal: true,
					buttons: {"Ok": function()  {
						$(this).dialog("close");} 
					}
		});
	}
}
 			</script>


 			<!-- <div class=" " id="main" onmouseover="closeNavi()">
 			<div class="page-content" style="padding:30px">
 		 -->					
 			<div class="row">
 			
 			
 			<div id='jqgrid'>
 			<table id='packages-grid' class="scroll"></table>
 			<div id='packages-grid-page' class="scroll" style="text-align:center;"></div>

 			</div> </div></div></div>
 			<div id='msgbox' title='' style='display: none'></div>
                