<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
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
						<label class="col-md-12 mb-0">Nom course</label>
						<div class="col-md-12">
							<input type="text" placeholder="Java EE" name="name" value="${element !=null ?  element.name: ''}"
							<c:if test="${action == 'delete' }">disabled</c:if>
								class="form-control ps-0 form-control-line">
							<c:if test="${error['name'] != null }"><p style="color:red;font-size:12px;font-style:italic">${error['name']}</p></c:if>
						</div>
					</div>
					
					<div class="form-group">
						<div class="col-sm-12 d-flex">
							<button type="submit" class="btn btn-success mx-auto mx-md-0 text-white">${action}</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>