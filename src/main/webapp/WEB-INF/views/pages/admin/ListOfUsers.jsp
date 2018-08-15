<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<div id='jqgrid'
	style="position: absolute; margin: 10% 40% 40% 10%; color: black;">

<div class="di" align="right">
<fieldset>
<input type="text" name="a" id="searchText" placeholder="Search....." />
            <button type="button" id="mySearch" class='btn btn-info'>Search</button>
        </fieldset>
       
    </div>
	<table id='packages-grid'></table>

			<div id="packages-grid-page"></div>
		</div>
	<div id='msgbox' title='' style='display: none'></div>
</body>
</html>
<script type="text/javascript">
	$(document).ready(
			function() {
				$("#packages-grid").jqGrid(
						{
							datatype : 'json',
							mtype : 'Get',
							url : "<c:url value='/admin/list1'/>",
							colNames : [ 'user_reg_id', 'name',
									'mobile_number', 'email_id', 
									'date_of_birth', 'gender', 'blood_group',
									'country', 'state', 'city', 'pincode',
									/* 'user_status', 'remarks','date_of_register', */'ViewProfile','Delete'],
							colModel : [ {
								name : 'user_reg_id',
								index : 'user_reg_id',
								width : 55,
								editable : true,
								editoptions : {
									readonly : true,
									size : 10
								},
								hidden : false
							}, {
								name : 'full_name',
								index : 'full_name',
								width : 100,
								editable : true,
								
								editrules : {
									required : true
								},
								editoptions : {
									size : 10
								}
							}, {
								name : 'mobile_number',
								index : 'mobile_number',
								width : 100,
								editable : true,
								editrules : {
									required : true
								},
								editoptions : {
									size : 10
								}
							}, {
								name : 'email_id',
								index : 'email_id',
								width : 100,
								editable : true,
								editrules : {
									required : true
								},
								editoptions : {
									size : 10
								}
							}, 
							 {
								name : 'date_of_birth',
								index : 'date_of_birth',
								width : 100,
								editable : true,
								editrules : {
									required : true
								},
								editoptions : {
									size : 10
								}
							}, {
								name : 'gender',
								index : 'gender',
								width : 100,
								editable : true,
								editrules : {
									required : true
								},
								editoptions : {
									size : 10
								}
							}, {
								name : 'blood_grp',
								index : 'blood_grp',
								width : 100,
								editable : true,
								editrules : {
									required : true
								},
								editoptions : {
									size : 10
								}
							}, {
								name : 'country',
								index : 'country',
								width : 100,
								editable : true,
								editrules : {
									required : true
								},
								editoptions : {
									size : 10
								}
							}, {
								name : 'state',
								index : 'state',
								width : 100,
								editable : true,
								editrules : {
									required : true
								},
								editoptions : {
									size : 10
								}
							}, {
								name : 'city',
								index : 'city',
								width : 100,
								editable : true,
								editrules : {
									required : true
								},
								editoptions : {
									size : 10
								}
							}, {
								name : 'pincode',
								index : 'pincode',
								width : 100,
								editable : true,
								editrules : {
									required : true
								},
								editoptions : {
									size : 10
								}
							},
							
							{name:'ViewProfile',index:'ViewProfile',width: 100, formatter: linkFormatter },
							{name:'Delete',index:'Delete',width: 100, formatter: linkFormatter1 },

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
							width: 900,
							viewrecords: true,
							loadonce:true,
							rownumbers: true,
							sortname : 'packid',
							sortorder: "asc",
							filters:{"groupOp":"AND","rules":[]},
							 caption:"ListOfUsers",  
							emptyrecords: "NO RECORDS TO DISPLAY",
							multiselect:false,
						    jsonReader : {
						        root: "rows",
						        page: "page",
						        total: "total",
						        records: "records",
						        repeatitems: false,
						        cell: "cell",
						        id: "packid"
						    }
					 	});
						$("#packages-grid").jqGrid('navGrid','#packages-grid-page',
								 {stringResult: true, edit:false, add:false, del:false, search:true}, 
								{edit:false, add:false, del:false, search:true, refresh:true},
								{}, {}, {}, 
								{ 	// search
									sopt:['cn', 'eq', 'ne', 'lt', 'gt', 'bw', 'ew'],
									closeOnEscape: true, 
									multipleSearch: false, 
									closeAfterSearch: true
								},{}
								);
			
			/* 	
				$("#packages-grid").navButtonAdd('#packages-grid-page', {
					caption : "Add",
					buttonicon : "fa fa-lg fa-fw fa-plus",
					onClickButton : addRow,
					position : "last",
					title : "ADD PACKAGE",
					cursor : "pointer"
				});

				$("#packages-grid").navButtonAdd('#packages-grid-page', {
					caption : "Edit",
					buttonicon : "fa fa-lg fa-fw fa-pencil",
					onClickButton : editRow,
					position : "last",
					title : "EDIT PACKAGE",
					cursor : "pointer"
				}); */

				/* $("#packages-grid").navButtonAdd('#packages-grid-page', {
					caption : "Delete",
					buttonicon : "fa fa-lg fa-fw fa-trash-o",
					onClickButton : deleteRow,
					position : "last",
					title : "DELETE PACKAGE",
					cursor : "pointer"
				}); */

				

				 // Toolbar Search
			 	 jQuery("#packages-grid").jqGrid( /* 'filterToolbar' ,*/ {searchOperators : true});  
				
			});
	
	
	function linkFormatter(cellValue, options, rowdata, action) {
		 // return "<button class=' btn-primary btn-xs'><a href='/helloambulance/admin/view?rid=" + rowdata.user_reg_id + "'>view_profile</a></button>";
		  return "<button><a href='/helloambulance/admin/view?user_reg_id=" +  rowdata.user_reg_id + "'>View Profile</a></button>"
		}

	 function linkFormatter1(cellValue, options, rowdata, action) {
		  return "<button class=' btn-success btn-xs'><a href='/helloambulance/list/deleteListUsers?user_reg_id=" + rowdata.user_reg_id + "' >Delete</a></button>";
		}
	 
			 function addRow() {
				// Get the currently selected row
				$('#packages-grid').jqGrid('editGridRow','new',
			    		{ 	 url: "<c:url value='/admin/createOrUpdatePackages/?${_csrf.parameterName}=${_csrf.token}'/>",			editData: {},
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
			function editRow() {
				// Get the currently selected row
				var row = $('#packages-grid').jqGrid('getGridParam','selrow');
				if( row != null ) {
					$('#packages-grid').jqGrid('editGridRow', row,
						{	url: "<c:url value='/admin/createOrUpdatePackages/?${_csrf.parameterName}=${_csrf.token}'/>", 
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
		var row = $('#packages-grid').jqGrid('getGridParam', 'selrow');
		// A pop-up dialog will appear to confirm the selected action
		if (row != null)
			$('#packages-grid')
					.jqGrid(
							'delGridRow',
							row,
							{
								url : "<c:url value='/list/deleteListUsers/?${_csrf.parameterName}=${_csrf.token}'/>",
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
									var rowdata = $('#packages-grid')
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
			$('#msgbox').dialog({
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
	     var searchFiler = $("#searchText").val();
	     var grid = $("#packages-grid"), f;

	     if (searchFiler.length === 0) {
	         grid[0].p.search = false;
	         $.extend(grid[0].p.postData, { filters: "" });
	     }
	     f = { groupOp: "OR", rules: [] };
	     f.rules.push({ field: "user_reg_id", op: "cn", data: searchFiler });
	     f.rules.push({ field: "full_name", op: "cn", data: searchFiler });
	     f.rules.push({ field: "mobile_number", op: "cn", data: searchFiler });
	     f.rules.push({ field: "email_id", op: "cn", data: searchFiler });
	     f.rules.push({ field: "date_of_birth", op: "cn", data: searchFiler });
	     f.rules.push({ field: "gender", op: "cn", data: searchFiler });
	     f.rules.push({ field: "blood_grp", op: "cn", data: searchFiler });
	     f.rules.push({ field: "country", op: "cn", data: searchFiler });
	     f.rules.push({ field: "state", op: "cn", data: searchFiler });
	     f.rules.push({ field: "city", op: "cn", data: searchFiler });
	     f.rules.push({ field: "pincode", op: "cn", data: searchFiler });

	     grid[0].p.search = true;
	     $.extend(grid[0].p.postData, { filters: JSON.stringify(f) });
	     grid.trigger("reloadGrid", [{ page: 1, current: true }]);
	 });
	 </script> 