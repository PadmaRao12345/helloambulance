<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
</head>
<div id='jqgrid'
	style="position: absolute; margin: 10% 40% 40% 10%; color: black;">

<div class="di" align="right">
<fieldset>
<input type="text" name="a" id="searchText" placeholder="Search....." />
            <button type="button" id="mySearch" class='btn btn-info'>Search</button>
        </fieldset>
       
    </div>
	<table id='grid'></table>

			<div id="packages-grid-page"></div>
		</div>
	</div>
	<div id='msgbox' title='' style='display: none'></div>
</div>

</body>
</html>
<script type="text/javascript">
	$(document).ready(
			function() {
				$("#grid").jqGrid(
						{
							datatype : 'json',
							mtype : 'Get',
							url : "<c:url value='/Doctor/DoctorDegree'/>",
							colNames : [ 'doctor_degree_id','doctor_degree','Status','Delete'],
							colModel : [ {
								name : 'doctor_degree_id',
								index : 'doctor_degree_id',
								width : 55,
								editable : true,
								editoptions : {
									readonly : true,
									size : 10
								},
								//hidden : false
							}, {
								name : 'doctor_degree',
								index : 'doctor_degree',
								width : 100,
								editable : true,
								
								editrules : {
									required : true
								},
								editoptions : {
									size : 10
								}
							},
							{name:'Status',index:'Status',width: 100, formatter: linkFormatter1 },
							{name:'Delete',index:'Delete',width: 100, formatter: linkFormatter },

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
					   		//guiStyle: "bootstrap",
							iconSet: "fontAwesome",
							rowNum:true,
							rowList:[2 ,3, 20 ,50],
							width: 700,
							viewrecords: true,
							loadonce:true,
							rownumbers: true,
							sortname : 'doctor_degree_id',
							sortorder: "asc",
							filters:{"groupOp":"AND","rules":[]},
							 caption:"Doctor",  
							emptyrecords: "NO RECORDS TO DISPLAY",
							multiselect:false,
						    jsonReader : {
						        root: "rows",
						        page: "page",
						        total: "total",
						        records: "records",
						        repeatitems: false,
						        cell: "cell",
						        id: "doctor_degree_id"
						    }
					 	});
				$("#bedata").click(function(){
					jQuery("#editgrid").jqGrid('editGridRow',"new",{height:280,reloadAfterSubmit:false});
				});
						$("#grid").jqGrid('navGrid','#packages-grid-page',
								{stringResult: true, edit:false, add:false, del:false, search:true}, 
								{edit:false, add:false, del:false, search:true, refresh:true},
								{}, {}, {}, 
								{ 	// search
									sopt:['cn' , 'eq', 'ne', 'lt', 'gt', 'bw', 'ew' ],
									closeOnEscape: true, 
									multipleSearch: false, 
									closeAfterSearch: true
								},{}
								);
			
				
				$("#grid").navButtonAdd('#packages-grid-page', {
					caption : "Add",
					buttonicon : "fa fa-lg fa-fw fa-plus",
					onClickButton : addRow,
					position : "last",
					title : "ADD PACKAGE",
					cursor : "pointer"
				});

				$("#grid").navButtonAdd('#packages-grid-page', {
					caption : "Edit",
					buttonicon : "fa fa-lg fa-fw fa-pencil",
					onClickButton : editRow,
					position : "last",
					title : "EDIT PACKAGE",
					cursor : "pointer"
				});

				

			
				 // Toolbar Search
			 	 jQuery("#grid").jqGrid(/*  'filterToolbar', */ {searchOperators : true});  
				
			});
	
	
	function linkFormatter(cellValue, options, rowdata, action) {
		  return "<button class=' btn-success btn-xs'><a href='/helloambulance/list/degree?doctor_degree_id=" + rowdata.doctor_degree_id + "' >Delete</a></button>";
		}
	
	function linkFormatter1(cellValue, options, rowObject, action) {
		  return '<button  id="'+ rowObject["doctor_degree_id"]+'" status="'+cellValue+'" onclick=\"changeStatus(this)" \>'+cellValue+'</button>';  
};
	function changeStatus(DoctorDegreeStatus){
		//alert(id);
		
		var doctor_degree_id=DoctorDegreeStatus.id;
		
		//alert(doctor_degree_id);
		var userstatus=DoctorDegreeStatus.attributes["status"].value;
		//alert(userstatus);
		if(userstatus=='1'){
			var status='0';	
		}
		else{
			var status='1';
		}
		 $.post('<c:url value="/Doctor/DoctorDegreeStatus"/>', {
			 doctor_degree_id:doctor_degree_id,
			status:status
		 },
	
	  function(data) {
			 
		 });
	 	 var grid = $('#packages-grid');
		 grid.trigger("reloadGrid"); 
	} 
	
	
	
	
	
	//ADD row
	function addRow() {		
		// Get the currently selected row
		$('#grid').jqGrid('editGridRow', 'new', {
        url: "<c:url value='/Doctor/add/?${_csrf.parameterName}=${_csrf.token}'/>",

			editData : {},
			serializeEditData : function(data) {
				data.id = 0;
				return $.param(data);
			},

			recreateForm : true,
			/* 			    beforeShowForm: function(form) {
			 $('#pData').hide();  
			 $('#nData').hide();
			 $('#password',form).addClass('ui-widget-content').addClass('ui-corner-all');
			 }, */
			beforeInitData : function(form) {
			},
			closeAfterAdd : true,
			reloadAfterSubmit : true,
			afterSubmit : function(response, postdata) {
				
				/* var result = eval('(' + response.responseText + ')'); */
				var errors = "";
				$("#grid").jqGrid('setGridParam',{datatype:'json'}).trigger('reloadGrid');
				return [true, "", ""];	
				
				grid.trigger("reloadGrid", [{ page: 1, current: true }]);
				
				if (result.success == false) {
					for (var i = 0; i < result.message.length; i++) {
						errors += result.message[i] + "<br/>";
					}
				} else {
					$('#msgbox').text('Entry has been added successfully');
					$('#msgbox').dialog({
						title : 'Success',
						modal : true,
						buttons : {
							"Ok" : function() {
								$(this).dialog("close");
							}
						}
					});
				}
				// only used for adding new records
				var newId = null;
				return [ result.success, errors, newId ];
			}
		});
	} // end of addRow
			function editRow() {
				// Get the currently selected row
				var row = $('#grid').jqGrid('getGridParam','selrow');
				if( row != null ) {
					$("#grid").jqGrid('editGridRow', row,
						{	url: "<c:url value='/list/EditDoctorDegree/?${_csrf.parameterName}=${_csrf.token}'/>",
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
					           /*  var result = eval('(' + response.responseText + ')'); */
								var errors = "";
				    			$("#grid").jqGrid('setGridParam',{datatype:'json'}).trigger('reloadGrid');
				    			return [true, "", ""];
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
	
	
	 
	 function deleteRow(obj, args) {
		    // Get the currently selected row
		    var row = $('#grid').jqGrid('getGridParam', 'selrow');
		    // A pop-up dialog will appear to confirm the selected action
		    if (row != null)
		    $('#grid')
		    .jqGrid(
		    	'delGridRow',
		    	row,
		    	{
		    		url : "<c:url value='/list/deleteExistingPackage/?${_csrf.parameterName}=${_csrf.token}'/>",
		    		recreateForm : true,
		    		beforeShowForm : function(form) {
		    			//Change title
		    			$(".delmsg").replaceWith(
		    					'<span style="white-space: pre;">'
		    							+ 'Delete selected record?'
		    							+ '</span>');
		    			//hide arrows
		    			$('#pData').hide();
		    			$('#nData').hide();
		    		},
		    		reloadAfterSubmit : true,
		    		closeAfterDelete : true,
		    		serializeDelData : function(postdata) {
		    			var rowdata = $('#grid')
		    					.getRowData(postdata.id);
		    			// append postdata with any information 
		    			return {
		    				id : postdata.id,
		    				oper : postdata.oper,
		    				packages : rowdata.packages
		    			};
		    		},
		    		afterSubmit : function(response, postdata) {
		    			var result = eval('('
		    					+ response.responseText + ')');
		    			var errors = "";
						$("#grid").jqGrid('setGridParam',{datatype:'json'}).trigger('reloadGrid');
		    			if (result.success == false) {
		    				for (var i = 0; i < result.message.length; i++) {
		    					errors += result.message[i]
		    							+ "<br/>";
		    				}
		    			} else {
		    				$('#msgbox')
		    						.text(
		    								'Entry has been deleted successfully');
		    				$('#msgbox').dialog({
		    					title : 'Success',
		    					modal : true,
		    					buttons : {
		    						"Ok" : function() {
		    							$(this).dialog("close");
		    						}
		    					}
		    				});
		    			}
		    			// only used for adding new records
		    			var newId = null;

		    			return [ result.success, errors, newId ];
		    		}
		    	});
		    else {
		    $('#msgbox').text('You must select a record first!');
		    $('#msgbox').dialog(
		    		{
		    			title : 'Error',
		                modal : true,
		                 buttons : {
		               "Ok" : function() {
		               $(this).dialog("close");
		    }
		    }
		    });
		    }
	 }
 

	 $("#mySearch").click(function () {
	     var searchFiler = $("#searchText").val(), grid = $("#grid"), f;

	     if (searchFiler.length === 0) {
	         grid[0].p.search = false;
	         $.extend(grid[0].p.postData, { filters: "" });
	     }
	     f = { groupOp: "OR", rules: [] };
	     f.rules.push({ field: "doctor_degree_id", op: "cn", data: searchFiler });
	     f.rules.push({ field: "doctor_degree", op: "cn", data: searchFiler });
	     
	     
	     grid[0].p.search = true;
	     $.extend(grid[0].p.postData, { filters: JSON.stringify(f) });
	     grid.trigger("reloadGrid", [{ page: 1, current: true }]);
	 });
	 </script> 
<!-- <div id='jqgrid'
	style="position: absolute; margin: 10% 40% 40% 10%; color: black;">

	<div style="height: 100px">

		 <button style="float:right" ><i class="fa fa-search"></i></button><input  type="text" placeHolder="search" style="float:right" name="name" id="search" style="width:250px"  />


		<div style="padding-top: 20px">



			<table id='packages-grid'></table>

			<div id='packages-grid-page'></div>
		</div>
	</div>
	<div id='msgbox' title='' style='display: none'></div>
</div>

</body>
</html> -->