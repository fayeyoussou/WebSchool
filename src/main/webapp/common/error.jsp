<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div class="preloader">
	<div class="lds-ripple">
		<div class="lds-pos"></div>
		<div class="lds-pos"></div>
	</div>
</div>
<div class="error-box">
	<div class="error-body text-center">
		<h1 class="error-title">404</h1>
		<h3 class="text-uppercase error-subtitle">Erreur !</h3>
		<p class="text-muted mb-4 mt-4">${errorMessage}</p>
		<a href="index.html"
			class="btn btn-info btn-rounded waves-effect waves-light mb-4 text-white">Back
			to home</a>
	</div>

</div>
<script>
	$(".preloader").fadeOut();
</script>