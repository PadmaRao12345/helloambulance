<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head></head>
<h2  style="color:red;" align=center></h2>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.11.4/themes/redmond/jquery-ui.min.css">
<link rel="stylesheet"
href="https://cdnjs.cloudflare.com/ajax/libs/free-jqgrid/4.15.4/css/ui.jqgrid.min.css">
<script
src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
src="https://cdnjs.cloudflare.com/ajax/libs/free-jqgrid/4.15.4/jquery.jqgrid.min.js"></script>
<style>
img{
height:100px;
width:100%;}
</style> 

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
       width: 40% !important;
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

   .jqgfirstrow,.ui-widget-header ,.jqgrid-rownum,.ui-jqgrid>.ui-jqgrid-pager {
       display: none;
}
.ui-jqgrid tr.jqfoot>td, .ui-jqgrid tr.jqgroup>td, .ui-jqgrid tr.jqgrow>td, .ui-jqgrid tr.ui-subgrid>td, .ui-jqgrid tr.ui-subtblcell>td {
    overflow: auto !important; 
    word-wrap: break-word;
     white-space: pre-wrap !important; 
   
    }
</style>  
<script>
$(document).ready(function(){
 	$("#packages-grid").jqGrid({
 		datatype : 'json',
 		mtype:'Post',
url: "<c:url value='listOfAmbulanceForAmbulance'/>",

	  	colModel:[
	  		
 {name:'profilepic',index:'profilepic', width:200,height:300,editable:true,edittype:'file',edithidden:true,  editrules:{required:true}, editoptions:{size:10},formatter: formatImage},
 	{name:'register_ambulance_id',index:'register_ambulance_id', width:200,hidden:true, edithidden:true},
 {name:'vechicle_reg_no',index:'vechicle_reg_no', width:70,hidden:false, edithidden:true,formatter:vehicleRegNo},
 {name:'organization_name',index:'organization_name', width:200,hidden:false, edithidden:true,formatter: organizationName},
		{name:'type_of_ambulance',index:'type_of_ambulance', width:70,hidden:false, edithidden:true,formatter:ambulanceType},
		{name:'gender',index:'gender', width:70,hidden:false, edithidden:true},
		
	  	{name:'View/Edit profile',index:'View/Edit profile',width: 100, formatter: viewandEditprofile },
	  	],
		pager: jQuery('#packages-grid-page'),
		postData: {
			filters:"filters"

	  	},
   		/* guiStyle: "bootstrap", */
		iconSet: "fontAwesome",
		rowNum:true,
		/* rowList:[10 , 20 ,30,50], */
		width: 500,
		viewrecords: true,
		loadonce:false,
		
		rownumbers: true,
		sortname : 'register_ambulance_id',
		sortorder: "asc",
		filters:{"groupOp":"AND","rules":[]},
		caption:"our Doctors",
		emptyrecords: "NO RECORDS TO DISPLAY",
		multiselect:false,
		jsonReader : {
	        root: "rows",
	        page: "page",
	        total: "total",
	        records: "records",
	        repeatitems: false,
	        cell: "cell",
	        id: "register_ambulance_id"
	    }
 	});
	/* $("#packages-grid").jqGrid('navGrid','#packages-grid-page',
			{edit:false, add:false, del:false, search:false, refresh:false},
			{}, {}, {}, 
			{ 	// search
				sopt:['cn'],
				closeOnEscape: true, 
				multipleSearch: false, 
				closeAfterSearch: true
			},{}
	); */
	/* $("#packages-grid").navButtonAdd('#packages-grid-page',
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
	); */
	/* // Toolbar Search
	jQuery("#packages-grid").jqGrid('filterToolbar',{searchOperators : true});*/
}); 
function viewandEditprofile(cellValue, options, rowdata, action) {
	  return "<button><a href='/helloambulance/vendor/getAmbulanceProfileDetialsById?register_ambulance_id=" + rowdata.register_ambulance_id + "' >View profile</a></button>  <button><a href='/helloambulance/vendor/deleteAmbulanceInAmbulance?register_ambulance_id=" + rowdata.register_ambulance_id + "' >Delete Ambulance</a></button>";
	}
/*  function editprofile(cellValue, options, rowdata, action) {
	  return "<button><a href='/helloambulance/vendor/doctorviewprofile?register_ambulance_id=" + rowdata.register_ambulance_id + "' >Edit profile</a></button>";
	} */
 
function vehicleRegNo(cellValue, options,rowObject, rowdata, action) {
	var vechicle_reg_no ="Vehicle Registration Number :  "+rowObject.vechicle_reg_no;
	  return vechicle_reg_no;
	}
	
function ambulanceType(cellValue, options,rowObject, rowdata, action) {
	var type_of_ambulance ="Ambulance Type  :  "+rowObject.type_of_ambulance;
	  return type_of_ambulance;
	}


function organizationName(cellValue, options,rowObject, rowdata, action) {
	var organizationName ="Name of Organization  :  "+rowObject.organization_name;
	  return organizationName;
	}  
function hospitalName(cellValue, options,rowObject, rowdata, action) {
	var hospitalname ="Hospital Name   :  "+rowObject.hospitalname;
	  return hospitalname;
	}  

function doctorExperiance(cellValue, options,rowObject, rowdata, action) {
	var experiance ="Experiance :  "+rowObject.experience+"  Years";
	  return experiance;
	}
//adding image
function formatImage(cellValue, options, rowObject,rowdata) {
	var image;
	/*  if(rowObject.image!=null){
		image = "<img src='data:image/png;base64," + cellValue + "' originalValue='" + cellValue + "' />";
} 
	 else { */
		 if(rowObject.gender=='Male'){
		image="<img src = ../resources/images/user_male_dummy.jpg>";
		 }
		 if(rowObject.gender=='Female'){
				image="<img src = ../resources/images/user_female_dummy.jpg>";
				 }
 		
	/* } */
	return image;
	}


		</script>
		
		<!-- <button><a href='/helloambulance/vendor/ambulanceUpdatePage?register_ambulance_id=" + rowdata.register_ambulance_id + "' >Edit profile</a></button> -->

<div class="col-md-9">
	
 			<div class="page-content " style="padding:30px">
 							
 			<div class="row">
 			
 			
 			<div id='jqgrid' >
 			<table id='packages-grid' class="scroll "></table>
 			<div id='packages-grid-page' class="scroll" style="text-align:center;"></div>

 			</div> </div></div>
 			<div id='msgbox' title='' style='display: none'></div>

</div>





 
