package controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.school.dao.ITemplate;
import com.school.dao.student.IStudentLocal;
import com.school.entities.Course;
import com.school.entities.Student;

import config.Config;
import config.Constante;


@WebServlet(value = "/student/*", name = "student")
public class StudentServlet extends ServletTemplate<Student>{
	private static String route = "student";
	@EJB
	private IStudentLocal dao;

	@Override
	protected ITemplate getDao() {
		return dao;
	}

	@Override
	protected String getRoute() {
		return StudentServlet.route;
	}

	@Override
	protected Student setParamaters(Student element, HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException,ParseException {
		if(element ==null) return new Student();
		boolean haveError = false;
		String firstName = request.getParameter("firstName");
		String lastName = request.getParameter("lastName");
		String phone = request.getParameter("phone");
		String birthDateString = request.getParameter("birthDate");
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Map<String ,String> error = new HashMap<>();
		Date birthDate = new Date();
		if(!Constante.isValidDate(birthDateString)) {
			haveError =true;
			error.put("birthDate", "format date prise en charge : yyyy-MM-dd");
		}
		else birthDate = format.parse(birthDateString);
		
		if(firstName.isBlank()) {
			haveError =true;
			error.put("firstName", "veuillez remplir le champs prenom");
			
		}else if(!Constante.isValidName(firstName)){
			haveError =true;
			error.put("firstName", "format prenom invalide");
		}
		if(lastName.isBlank()) {
			haveError =true;
			error.put("lastName", "veuillez remplir le champs nom");
			
		}else if(!Constante.isValidName(lastName)){
			haveError =true;
			error.put("lastName", "format nom invalide");
		}
		if(phone.isBlank()) {
			haveError =true;
			error.put("phone", "veuillez remplir le champs telephone");
			
		}else if(!Constante.isValidPhoneNumber(phone.trim())){
			haveError =true;
			error.put("phone", "format telephone invalide");
		}
		Date date = new Date();
		Calendar calendar = Calendar.getInstance(); // create a Calendar object
		calendar.setTime(date); // set the Calendar object's time to the Date object's time
		calendar.add(Calendar.YEAR, -14); // subtract 14 years from the Calendar object's year field
		date = calendar.getTime();
		if(birthDate.after(date)) {
			haveError =true;
			error.put("birthDate", birthDate.toString());
		}
		if(haveError) {
			element.setFirstName(firstName);
			element.setLastName(lastName);
			element.setPhone(phone);
			element.setBirthDate(birthDate);
			request.setAttribute("element", element);
			request.setAttribute("error", error);
			request.setAttribute("bodycontent", Config.getRoute(StudentServlet.route, "form"));
			request.getRequestDispatcher("/index.jsp").forward(request, response);
			return null;
		}
		element.setFirstName(firstName);
		element.setLastName(lastName);
		element.setPhone(phone);
		element.setBirthDate(birthDate);
		return element;
		
	}

}
