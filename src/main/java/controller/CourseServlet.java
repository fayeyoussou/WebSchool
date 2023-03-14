package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.school.dao.ITemplate;
import com.school.dao.course.ICourseLocal;
import com.school.entities.Course;

import config.Config;
import config.Constante;


/**
 * Servlet implementation class CourseServlet
 */
@WebServlet(value = "/course/*", name = "course")
public class CourseServlet extends ServletTemplate<Course> {
	private static final long serialVersionUID = 1L;
	private static final String route = "course";
	
	@EJB
	private ICourseLocal newDao;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CourseServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	

	/**
	 * @throws IOException 
	 * @throws ServletException 
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	

	

	


	@Override
	protected ITemplate getDao() {
		return this.newDao;
	}



	@Override
	protected String getRoute() {
		return CourseServlet.route;
	}



	@Override
	protected Course setParamaters(Course element, HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
		if(element ==null) return new Course();
		String name = request.getParameter("name");
		Map<String ,String> error = new HashMap<>();
		if(name.isBlank()) {
			error.put("name", "veuillez remplir le champs nom");
			request.setAttribute("error", error);
			request.setAttribute("bodycontent", Config.getRoute(CourseServlet.route, "form"));
			request.getRequestDispatcher("/index.jsp").forward(request, response);
			return null;
		}
		element.setName(name);
		return element;
	}



	

}
