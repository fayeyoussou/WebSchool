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
										<th class="border-top-0">prenom</th>
										<th class="border-top-0">nom</th>
										<th class="border-top-0">Date Naiss</th>
										<th class="border-top-0">Telephone</th>
										<th class="border-top-0">action</th>

									</tr>
								</thead>
								<c:forEach items="${liste }" var="element">
									<tbody>
										<tr>
											<td>${element.id}</td>
											<td>${element.firstName}</td>
											<td>${element.lastName}</td>
											<td>${element.birthDate}</td>
											<td>${element.phone}</td>
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