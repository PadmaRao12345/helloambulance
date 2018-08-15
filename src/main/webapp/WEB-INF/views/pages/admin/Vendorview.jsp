
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<link rel="stylesheet"
	href='<c:url value="../resources/cssfiles/style.css"/>'>
<link rel="stylesheet"
	href='<c:url value="../resources/cssfiles/user.css"/>'>


<style>
div.row {
	/* height:50px; */
	font-family: "Times New Roman", Times, serif;
	font-size: 15px;
	font-weight: bold;
	/* font-variant: small-caps; */
	font-variant: small;
}
</style>
<div class="container-fluid " id="main" onmouseover="closeNavi()">
	<div class="page-content" style="padding: 30px">

		<div class="row">
			<div class=" container user_profile">
				<div class="row user">
					<div class="col-sm-3">
						<div class="profile_pic"></div>
					</div>
				</div>
			</div>
			<div class="col-sm-9">
				<div class="row">
					<div class="col-sm-6"></div>
					<div class="col-sm-8" style="margin-top: 70px">
						<span class="title">Name:</span> <span><c:out
								value="${Vendorview.name}"></c:out></span><br> <span class="title">MobileNo:</span>
						<span><c:out value="${Vendorview.mobile_no}"></c:out></span><br>
						<span class="title">EmailId:</span> <span><c:out
								value="${Vendorview.email_id}"></c:out></span><br> <span
							class="title">Date Of Birth:</span> <span><c:out
								value="${Vendorview.date_of_birth}"></c:out></span><br> <span
							class="title">Gender:</span> <span><c:out
								value="${Vendorview.gender}"></c:out></span><br> <span
							class="title">BloodGroup:</span> <span><c:out
								value="${Vendorview.blood_group}"></c:out></span><br> <span
							class="title">RegistorAs :</span>
						<c:out value="${Vendorview.register_as}"></c:out>
						<br> <a href='<c:url value="/admin/Vendors"/>'><button
								class="btn btn-warning">BackToHome</button></a>
					</div>
					<div class="col-sm-6"></div>
				</div>
			</div>
		</div>
	</div>