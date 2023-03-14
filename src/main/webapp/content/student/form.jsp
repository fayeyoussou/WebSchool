<%@page import="com.school.entities.Student"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Date"%>
<%
// Retrieve the Student object from the request object
Student student = (Student) request.getAttribute("element");

// Get the birth date from the Student object
Date birthDate = null;
if(student !=null) birthDate = student.getBirthDate();
SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");

//Use the SimpleDateFormat object to format the birth date
String formattedDate = "";
if(birthDate !=null)formattedDate = sdf.format(birthDate);
%>

<div class="row">
	<div class="col-lg-4 col-xlg-3 col-md-5">
		<div class="card">
			<div class="card-body profile-card">
				<center class="mt-4">
					<img src="${myroutes}assets/images/${action}.jpeg"
						class="rounded-circle" width="150" />
					<h4 class="card-title mt-2">Hanna Gover</h4>
					<h6 class="card-subtitle">Accoubts Manager Amix corp</h6>
					<div class="row justify-content-center">
						<div class="col-4">
							<a href="javascript:void(0)" class="link"> <i
								class="icon-people" aria-hidden="true"></i> <span
								class="font-normal">254</span>
							</a>
						</div>
						<div class="col-4">
							<a href="javascript:void(0)" class="link"> <i
								class="icon-picture" aria-hidden="true"></i> <span
								class="font-normal">54</span>
							</a>
						</div>
					</div>
				</center>
			</div>
		</div>
	</div>
	<div class="col-lg-8 col-xlg-9 col-md-7">
		<div class="card">
			<div class="card-body">
				<form class="form-horizontal form-material mx-2" method="POST">
					<div class="form-group">
						<label class="col-md-12 mb-0">Prenom</label>
						<div class="col-md-12">
							<input type="text" placeholder="Youssoupha" name="firstName"
								value="${element !=null ?  element.firstName: ''}"
								<c:if test="${action == 'delete' }">disabled</c:if>
								class="form-control ps-0 form-control-line">
							<c:if test="${error['firstName'] != null }">
								<p style="color: red; font-size: 12px; font-style: italic">${error['firstName']}</p>
							</c:if>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-12 mb-0">Nom</label>
						<div class="col-md-12">
							<input type="text" placeholder="Faye" name="lastName"
								value="${element !=null ?  element.lastName: ''}"
								<c:if test="${action == 'delete' }">disabled</c:if>
								class="form-control ps-0 form-control-line">
							<c:if test="${error['lastName'] != null }">
								<p style="color: red; font-size: 12px; font-style: italic">${error['lastName']}</p>
							</c:if>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-12 mb-0">Telephone</label>
						<div class="col-md-12">
							<input type="tel" placeholder="221 7X XXX XX XX" name="phone"
								value="${element !=null ?  element.phone: ''}"
								<c:if test="${action == 'delete' }">disabled</c:if>
								class="form-control ps-0 form-control-line">
							<c:if test="${error['phone'] != null }">
								<p style="color: red; font-size: 12px; font-style: italic">${error['phone']}</p>
							</c:if>
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-12 mb-0">DateNaissance</label>
						<div class="col-md-12">
							<input type="date" name="birthDate"
								value="<%= formattedDate %>"
								<c:if test="${action == 'delete' }">disabled</c:if>
								class="form-control ps-0 form-control-line">
							<c:if test="${error['birthDate'] != null }">
								<p style="color: red; font-size: 12px; font-style: italic">${error['birthDate']}</p>
							</c:if>
						</div>
					</div>
					<div class="form-group">
						<div class="col-sm-12 d-flex">
							<button type="submit"
								class="btn btn-success mx-auto mx-md-0 text-white">${action}</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>