package controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.school.dao.ITemplate;
import com.school.dao.year.IYearLocal;
import com.school.entities.Year;

import config.Config;
import config.Constante;

@WebServlet(value = "/year/*", name = "year")
public class YearServlet extends ServletTemplate<Year> {
	private static String route = "year";
	@EJB
	private IYearLocal dao;

	@Override
	protected ITemplate getDao() {
		return dao;
	}

	@Override
	protected String getRoute() {
		return YearServlet.route;
	}

	@Override
	protected Year setParamaters(Year element, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	if(element ==null) return new Year();
	String name = request.getParameter("name");
	Map<String ,String> error = new HashMap<>();
	boolean haveError = false;
	if(name.isBlank()) {
		error.put("name", "veuillez remplir le champs year");
		haveError=true;
	}
	if(!Constante.isValidYear(name)) {
		haveError =true;
		error.put("name", "format annee scolaire : XXXX/XXXX");
	}
	element.setName(name);
	if(haveError) {
		request.setAttribute("element", element);
		request.setAttribute("error", error);
		request.setAttribute("bodycontent", Config.getRoute(YearServlet.route, "form"));
		request.getRequestDispatcher("/index.jsp").forward(request, response);
		return null;
	} else return element;
	}
}
