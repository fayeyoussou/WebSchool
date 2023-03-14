<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html dir="ltr" lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<!-- Tell the browser to be responsive to screen width -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="keywords"
	content="wrappixel, admin dashboard, html css dashboard, web dashboard, bootstrap 5 admin, bootstrap 5, css3 dashboard, bootstrap 5 dashboard, Monsterlite admin bootstrap 5 dashboard, frontend, responsive bootstrap 5 admin template, Monster admin lite design, Monster admin lite dashboard bootstrap 5 dashboard template">
<meta name="description" content="Devoir Java">

<title><%=request.getAttribute("title")%> <%=request.getAttribute("myPath")%></title>
<link rel="icon" type="image/png" sizes="16x16"
	href="${myroutes}assets/images/favicon.png">
<!-- Custom CSS -->
<link href="${myroutes}assets/css/style.min.css" rel="stylesheet">
</head>
<body>
	<div id="main-wrapper" data-layout="vertical" data-navbarbg="skin5"
		data-sidebartype="full" data-sidebar-position="absolute"
		data-header-position="absolute" data-boxed-layout="full">
		<header class="topbar" data-navbarbg="skin6">
			<nav class="navbar top-navbar navbar-expand-md navbar-dark">
				<div class="navbar-header" data-logobg="skin6">

					<a class="navbar-brand" href="index.html"> <!-- Logo icon --> <b
						class="logo-icon"> <!--You can put here icon as well // <i class="wi wi-sunset"></i> //-->
							<!-- Dark Logo icon --> <img
							src="${myroutes}assets/images/logo-icon.png" alt="homepage"
							class="dark-logo" />

					</b> <!--End Logo icon --> <!-- Logo text --> <span class="logo-text">
							<!-- dark Logo text --> <img
							src="${myroutes}assets/images/logo-text.png" alt="homepage"
							class="dark-logo" />

					</span>
					</a>
					<!-- ============================================================== -->
					<!-- End Logo -->
					<!-- ============================================================== -->
					<!-- ============================================================== -->
					<!-- toggle and nav items -->
					<!-- ============================================================== -->
					<a
						class="nav-toggler waves-effect waves-light text-dark d-block d-md-none"
						href="javascript:void(0)"><i class="ti-menu ti-close"></i></a>
				</div>
				<!-- ============================================================== -->
				<!-- End Logo -->
				<!-- ============================================================== -->
				<div class="navbar-collapse collapse" id="navbarSupportedContent"
					data-navbarbg="skin5">

					<!-- ============================================================== -->
					<!-- toggle and nav items -->
					<!-- ============================================================== -->
					<ul class="navbar-nav me-auto mt-md-0 ">
						<!-- ============================================================== -->
						<!-- Search -->
						<!-- ============================================================== -->

						<li class="nav-item hidden-sm-down">
							<form class="app-search ps-3">
								<input type="text" class="form-control"
									placeholder="Search for..."> <a class="srh-btn"><i
									class="ti-search"></i></a>
							</form>
						</li>
					</ul>

					<!-- ============================================================== -->
					<!-- Right side toggle and nav items -->
					<!-- ============================================================== -->
					
				</div>
			</nav>
		</header>
		<aside class="left-sidebar" data-sidebarbg="skin6">
			<!-- Sidebar scroll-->
			<div class="scroll-sidebar">
				<!-- Sidebar navigation-->
				<nav class="sidebar-nav">
					<ul id="sidebarnav">
						<!-- User Profile-->
						<li class="sidebar-item"><a
							class="sidebar-link waves-effect waves-dark sidebar-link"
							href="<%=request.getContextPath()%>" aria-expanded="false"><i
								class="me-3 far fa-clock fa-fw" aria-hidden="true"></i><span
								class="hide-menu">Dashboard</span></a></li>
						<li class="sidebar-item"><a
							class="sidebar-link waves-effect waves-dark sidebar-link"
							href="<%=request.getContextPath()%>/student"
							aria-expanded="false"> <i class="me-3 fa fa-user"
								aria-hidden="true"></i><span class="hide-menu">Student</span></a></li>
						<li class="sidebar-item"><a
							class="sidebar-link waves-effect waves-dark sidebar-link"
							href="<%=request.getContextPath()%>/course" aria-expanded="false"><i
								class="me-3 fa fa-table" aria-hidden="true"></i><span
								class="hide-menu">Course</span></a></li>
						<li class="sidebar-item"><a
							class="sidebar-link waves-effect waves-dark sidebar-link"
							href="<%=request.getContextPath()%>/year" aria-expanded="false"><i
								class="me-3 fa fa-font" aria-hidden="true"></i><span
								class="hide-menu">Year</span></a></li>
						<li class="sidebar-item"><a
							class="sidebar-link waves-effect waves-dark sidebar-link"
							href="<%=request.getContextPath()%>/inscription" aria-expanded="false"><i
								class="me-3 fa fa-table" aria-hidden="true"></i><span
								class="hide-menu">Inscription</span></a></li>



					</ul>

				</nav>
				<!-- End Sidebar navigation -->
			</div>
			<!-- End Sidebar scroll-->
		</aside>
		<div class="page-wrapper">
			<div class="container-fluid">
				<c:if test="${bodycontent != null }">
					<div class="page-breadcrumb">
						<div class="row align-items-center">
							<div class="col-md-6 col-8 align-self-center">
								<h3 class="page-title mb-0 p-0">${myPath.toUpperCase()}</h3>
								<div class="d-flex align-items-center">
									<nav aria-label="breadcrumb">
										<ol class="breadcrumb">
											<li class="breadcrumb-item"><a
												href="<%=request.getContextPath()%>/${myPath}">Home</a></li>
											<li class="breadcrumb-item active" aria-current="page">${title}</li>
										</ol>
									</nav>
								</div>
							</div>

						</div>
					</div>
					<jsp:include page="${bodycontent}" />
				</c:if>
				<c:if test="${bodycontent == null }">
					<%@ include file="/content/dashboard.jsp"%>
				</c:if>
			</div>
		</div>

	</div>
</body>
<script src="${myroutes}assets/plugins/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap tether Core JavaScript -->
<script
	src="${myroutes}assets/plugins/bootstrap/dist/js/bootstrap.bundle.min.js"></script>
<script src="${myroutes}assets/js/app-style-switcher.js"></script>
<!--Wave Effects -->
<script src="${myroutes}assets/js/waves.js"></script>
<!--Menu sidebar -->
<script src="${myroutes}assets/js/sidebarmenu.js"></script>
<!--Custom JavaScript -->
<script src="${myroutes}assets/js/custom.js"></script>
</html>