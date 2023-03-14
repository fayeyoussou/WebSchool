package controller;

import java.io.IOException;
import java.text.ParseException;

import javax.ejb.EJB;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.school.dao.ITemplate;
import com.school.entities.Course;

import config.Config;
import config.Constante;


public abstract class ServletTemplate<T> extends HttpServlet {
	private static final long serialVersionUID = -2576784400260069043L;
	protected abstract ITemplate getDao();
	protected abstract String getRoute();
	protected abstract T setParamaters(T element,HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException, ParseException;
	protected void setRequired(HttpServletRequest request) {
		
	}
	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at: ").append(request.getContextPath());
//		Course course = new Course("DBA");
//		courseDao.save(course);
//		String action =  request.getPathInfo();
//		  if (action == null) {
//		  } else   {
//		    list(request, response);
//			  	request.setAttribute("title", "My dshboard");
//				request.setAttribute("bodycontent", "/content/dashboard.jsp");
//				request.getRequestDispatcher("index.jsp").forward(request, response);
//		  }
		
		String[] routes = Config.setPath(request, this.getRoute());
		String action = routes.length > 0 ? routes[0] : Constante.getPaths().get(2);
		Long id = -1L;
		if (routes.length > 1)
			try {
				id = Long.parseLong(routes[1]);
			} catch (Exception e) {
				action = "error";
				request.setAttribute("errorMessage", "l'id devrait etre un chiffre");
			}

		if (id > 0L)
			request.setAttribute("element", this.getDao().getById(id));
		if (!Constante.getPaths().get(0).equalsIgnoreCase(action) && !Constante.getPaths().get(1).equalsIgnoreCase(action) && !Constante.getPaths().get(3).equalsIgnoreCase(action)) {
			request.setAttribute(Constante.getPaths().get(4), getDao().list());
			action = Constante.getPaths().get(2);
		}
		
		request.setAttribute("title", Constante.getPaths().get(2).equals(action)?"liste":action +" " +this.getRoute());
		request.setAttribute("action", action);
		if ("create".equalsIgnoreCase(action) || "edit".equalsIgnoreCase(action) || "delete".equalsIgnoreCase(action)) {
			if (id == -1L && !Constante.getPaths().get(0).equals(action)) {
				action = "error";
				request.setAttribute("errorMessage", "Veuillez donner un id");
			} else action = "form";
			setRequired(request);
		}
		request.setAttribute("bodycontent", Config.getRoute(this.getRoute(), action));
		request.getRequestDispatcher("/index.jsp").forward(request, response);

	}
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String[] routes = Config.setPath(request, this.getRoute());
		String action = routes.length > 0 ? routes[0] : "index";
		Long id = -1L;
		if (routes.length > 1)
			try {
				id = Long.parseLong(routes[1]);
			} catch (Exception e) {
				action = "error";
				request.setAttribute("errorMessage", "l'id devrait etre un chiffre");
			}
		if (!Constante.getPaths().get(0).equalsIgnoreCase(action) && !Constante.getPaths().get(1).equalsIgnoreCase(action) && !Constante.getPaths().get(3).equalsIgnoreCase(action)) {
			request.setAttribute(Constante.getPaths().get(4), this.getDao().list());
			action = "error";
			request.setAttribute("errorMessage", "Erreur de route");
		}
		if ((Constante.getPaths().get(1).equalsIgnoreCase(action) || Constante.getPaths().get(3).equalsIgnoreCase(action)) &&  id < 1  ) {			
				action = "error";
				request.setAttribute("errorMessage", "Veuillez donner un id");
		}
		if("error".equalsIgnoreCase(action)) {
			request.setAttribute("bodycontent", Config.getRoute(this.getRoute(), action));
			request.getRequestDispatcher("/index.jsp").forward(request, response);
		}
		T element = null;
		try {
			element = setParamaters(null,null,null);
		} catch (ParseException e1) {
			e1.printStackTrace();
		}
		if (id > 0L) element = (T) this.getDao().getById(id);
		if(!Constante.getPaths().get(3).equalsIgnoreCase(action)) {
			request.setAttribute("title", action+" "+this.getRoute());
			request.setAttribute("action", action);
			try {
				element = setParamaters(element,request,response);
			} catch (ParseException e) {
				e.printStackTrace();
			}
		}
		if(element ==null) return;
		else if(Constante.getPaths().get(0).equals(action)) this.getDao().save(element);
		else if(Constante.getPaths().get(1).equals(action)) this.getDao().edit(element);
		else if(Constante.getPaths().get(3).equals(action)) this.getDao().delete(id);
		response.sendRedirect(request.getContextPath() +"/"+this.getRoute());
	}
}
