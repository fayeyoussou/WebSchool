package controller;

import java.io.IOException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.school.dao.ITemplate;
import com.school.dao.course.ICourseLocal;
import com.school.dao.inscription.IInscriptionLocal;
import com.school.dao.student.IStudentLocal;
import com.school.dao.year.IYearLocal;
import com.school.entities.Course;
import com.school.entities.Inscription;
import com.school.entities.Student;
import com.school.entities.Year;

import config.Config;
import config.Constante;

@WebServlet(value = "/inscription/*", name = "inscription")
public class InscriptionServlet extends ServletTemplate<Inscription> {
	private static String route = "inscription";
	@EJB
	private IInscriptionLocal dao;
	@EJB
	private IStudentLocal stdao;
	@EJB
	private IYearLocal yedao;
	@EJB
	private ICourseLocal codao;

	@Override
	protected ITemplate getDao() {
		return dao;
	}

	@Override
	protected void setRequired(HttpServletRequest request) {
		request.setAttribute("students", stdao.list());
		request.setAttribute("years", yedao.list());
		request.setAttribute("courses", codao.list());
	}

	@Override
	protected String getRoute() {
		return InscriptionServlet.route;
	}

	@Override
	protected Inscription setParamaters(Inscription element, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		if (element == null)
			return new Inscription();
		String details = request.getParameter("details");
		String studentStr = request.getParameter("student");
		String courseStr = request.getParameter("course");
		String yearStr = request.getParameter("year");
		Map<String, String> error = new HashMap<>();
		boolean haveError = false;
		if (details == null || details.isBlank()) {
			error.put("details", "veuillez remplir ce champs");

		}
		
		Student student = null;
		if (studentStr == null || !Constante.isNumber(studentStr) || Long.parseLong(studentStr) <= 0) {
			haveError = true;
			error.put("student", "veuillez choisir un etudiant");
		} else {
			student = stdao.getById(Long.parseLong(studentStr));
		}
		Course course = null;
		if (courseStr == null || !Constante.isNumber(courseStr) || Long.parseLong(courseStr) <= 0) {
			haveError = true;
			error.put("course", "veuillez choisir un cours");
		} else {
			course = codao.getById(Long.parseLong(courseStr));
		}
		Year year = null;
		if (yearStr == null || !Constante.isNumber(yearStr) || Long.parseLong(yearStr) <= 0) {
			haveError = true;
			error.put("year", "veuillez choisir une annee");
		} else {
			year = yedao.getById(Long.parseLong(yearStr));
		}
		boolean exist = false;
		List<Inscription> inscriptions = new ArrayList<>();
		if(student !=null && student.getInscriptions() != null) {
			inscriptions = student.getInscriptions();
		}
		for (Inscription inscription : inscriptions) {
			if(year != null && Objects.equals( inscription.getYear().getId(), year.getId()) && course!=null && Objects.equals(inscription.getCourse().getId(), course.getId())) exist = true;
		}
		if(exist) {
			haveError = true;
			error.put("student", "l'etudiant s'est deja inscrit pour cette annee et pour ce cour");
		}
		if(student == null) {
			haveError = true;
			error.put("student", "cet etudiant n'existe pas");
		}
		if(year == null) {
			haveError = true;
			error.put("year", "cett annee scolaire n'existe pas");
		}
		if(course == null) {
			haveError = true;
			error.put("course", "ce cours n'existe pas");
		}
		
//	if(!Constante.isValidYear(name)) {
//		haveError =true;
//		error.put("details", request.getParameter("student"));
//	}
		element.setDetails(details);
		element.setCourse(course);
		element.setYear(year);
		element.setStudent(student);
		if (haveError) {
			setRequired(request);
			request.setAttribute("element", element);
			request.setAttribute("error", error);
			request.setAttribute("bodycontent", Config.getRoute(InscriptionServlet.route, "form"));
			request.getRequestDispatcher("/index.jsp").forward(request, response);
			return null;
		} else
			return element;
	}
}
