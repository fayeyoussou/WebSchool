<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>


<div class="container-fluid">
	<!-- ============================================================== -->
	<!-- Start Page Content -->
	<!-- ============================================================== -->
	<div class="row">
		<!-- column -->
		<div class="col-sm-12">
			<div class="card">
				<div class="card-body">
					<h4 class="card-title">Liste des ${myPath}</h4>
					<c:if test="${liste != null }">
						<h6 class="card-subtitle">
							Nombre de ${myPath}s disponible :
							<code>${fn:length(liste)}</code>
						</h6>
						<div class="table-responsive">
							<table class="table user-table no-wrap">
								<thead>
									<tr>
										<th class="border-top-0">#</th>
										<th class="border-top-0">details</th>
										<th class="border-top-0">student</th>
										<th class="border-top-0">year</th>
										<th class="border-top-0">course</th>
										<th class="border-top-0">action</th>

									</tr>
								</thead>
								<c:forEach items="${liste }" var="element">
									<tbody>
										<tr>
											<td>${element.id}</td>
											<td>${element.details}</td>
											<td>${element.student.firstName} ${element.student.lastName}</td>
											<td>${element.year.name}</td>
											<td>${element.course.name}</td>
											<td><a
												href="<%=request.getContextPath()%>/${myPath}/edit/${element.id}">
														
														<i class="fas fa-edit"></i>
													</a><a style="margin-left:5%"
												href="<%=request.getContextPath()%>/${myPath}/delete/${element.id}">
														
														<i class="fas fa-trash-alt"></i>
													</a></td>
										</tr>
									</tbody>
									
								</c:forEach>
								
							</table>
							<a style="margin-left:80%;width:10%" href="<%=request.getContextPath()%>/${myPath}/create"><button style="color:#FFB86F" class="btn mx-auto mx-md-0  al-right">add new ${myPath}</button></a>
						</div>
					</c:if>
				</div>
			</div>
		</div>
	</div>

</div>