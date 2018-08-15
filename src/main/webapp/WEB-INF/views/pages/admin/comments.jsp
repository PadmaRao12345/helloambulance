<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<html>
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
$(document).ready(function(){
 	$("#packages-grid").jqGrid({
 		datatype : 'json',
 		mtype:'get',
 		/*url: 'list', */
	 url: "/helloambulance/comments/list", 
	  	colNames: ['contactId', 'name', 'email', 'message', 'dateOfMessage','Delete','view'],
		colModel:[
			{name:'contact_id',index:'contact_id', width:100,editable:true,editoptions:{readonly:false,size:10},hidden:true},
			{name:'name',index:'name', width:100,editable:true, editrules:{required:true}, editoptions:{size:10}},
			{name:'email_id',index:'email_id', width:100,editable:true, editrules:{required:true}, editoptions:{size:10}},
			{name:'message',index:'message', width:100,editable:true, editrules:{required:true}, editoptions:{size:10}},
			{name:'date_of_message',index:'date_of_message', width:100,editable:true, editrules:{required:true}, editoptions:{size:10}},
			{name:'Delete',index:'Delete',width: 100, formatter: linkFormatter },
		    {name:'view',index:'view', width:60,editable:true, editrules:{required:true}, editoptions:{size:10},formatter:linkFormatter1}

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
		width: 800,
		viewrecords: true,
		loadonce:true,
		rownumbers: true,
		sortname : 'contact_d',
		sortorder: "asc",
		filters:{"groupOp":"AND","rules":[]},
		caption:"ListOfComments",
		emptyrecords: "NO RECORDS TO DISPLAY",
		multiselect:false,
	    jsonReader : {
	        root: "rows",
	        page: "page",
	        total: "total",
	        records: "records",
	        repeatitems: false,
	        cell: "cell",
	        id: "contact_id"
	    }
 	});
	$("#packages-grid").jqGrid('navGrid','#packages-grid-page',
			 {stringResult: true, edit:false, add:false, del:false, search:true}, 
			{edit:false, add:false, del:false, search:true, refresh:true},
			{}, {}, {}, 
			{ 	// search
				sopt:['cn' , 'eq', 'ne', 'lt', 'gt', 'bw', 'ew' ],
				closeOnEscape: true, 
				multipleSearch: true, 
				closeAfterSearch: true
			},{}
	);
	/* $("#packages-grid").navButtonAdd('#packages-grid-page',
			{ 	caption:"Add", 
				buttonicon:"fa fa-lg fa-fw fa-plus", 
				onClickButton: addRow,
				position: "last", 
				title:"ADD PACKAGE", 
				cursor: "pointer"
			} 
	);
	
	$("#packages-grid").navButtonAdd('#packages-grid-page',
			{ 	caption:"Edit", 
				buttonicon:"fa fa-lg fa-fw fa-pencil", 
				onClickButton: editRow,
				position: "last", 
				title:"EDIT PACKAGE", 
				cursor: "pointer"
			} 
	);
	
	$("#packages-grid").navButtonAdd('#packages-grid-page',
		{ 	caption:"Delete", 
			buttonicon:"fa fa-lg fa-fw fa-trash-o", 
			onClickButton: deleteRow,
			position: "last", 
			title:"DELETE PACKAGE", 
			cursor: "pointer"
		} 
	); */
	// Toolbar Search
	jQuery("#packages-grid").jqGrid(/* 'filterToolbar' , */{searchOperators : true});
});

function linkFormatter(cellValue, options, rowdata, action) {
	  return "<button class=' btn-primary btn-xs'><a href='/helloambulance/admin/comments?rid=" + rowdata.contact_id + "' >Delete</a></button>";
	}

function linkFormatter1(cellValue, options, rowdata, action) {
	   return "<button class=' btn-primary btn-xs'><a href='/helloambulance/admin/contactpopup?contactID=" + rowdata.contact_id + "'>view</a></button>";
	}

function addRow() {
	// Get the currently selected row
	$('#packages-grid').jqGrid('editGridRow','new',
    		{ 	url: "<c:url value='/users/createOrUpdatePackages/'/>", 				editData: {},
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
			{	url: "<c:url value='/users/createOrUpdatePackages/'/>", 
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
    var row = $('#packages-grid').jqGrid('getGridParam','selrow');
    // A pop-up dialog will appear to confirm the selected action
	if( row != null ) 
		$('#packages-grid').jqGrid( 'delGridRow', row,
          	{	url: "<c:url value='/users/deleteExistingPackage/'/>", 
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
$("#mySearch").click(function () {
    var searchFiler = $("#searchText").val();
    var grid = $("#packages-grid"), f;

    if (searchFiler.length === 0) {
        grid[0].p.search = false;
        $.extend(grid[0].p.postData, { filters: "" });
    }
    f = { groupOp: "OR", rules: [] };
    f.rules.push({ field: "contact_id", op: "cn", data: searchFiler });
    f.rules.push({ field: "name", op: "cn", data: searchFiler });
    f.rules.push({ field: "email_id", op: "cn", data: searchFiler });
    f.rules.push({ field: "message", op: "cn", data: searchFiler });
    f.rules.push({ field: "date_of_message", op: "cn", data: searchFiler });


    
    grid[0].p.search = true;
    $.extend(grid[0].p.postData, { filters: JSON.stringify(f) });
    grid.trigger("reloadGrid", [{ page: 1, current: true }]);
});
</script> 