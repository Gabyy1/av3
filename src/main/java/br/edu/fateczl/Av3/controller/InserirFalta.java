package br.edu.fateczl.Av3.controller;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import br.edu.fateczl.Av3.model.Falta;
import br.edu.fateczl.Av3.persistence.FaltaDao;

@Controller
public class InserirFalta {

	

		@RequestMapping(name = "falta", value = "/falta", method = RequestMethod.GET)
		public ModelAndView init(ModelMap model) 
		{
			return new ModelAndView("falta");
		}
		
	    @RequestMapping(name = "falta", value = "falta", method = RequestMethod.POST)
		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	    {
		
			int tamanho  = Integer.parseInt(request.getParameter("tamanho"));
			String data  = request.getParameter("data");
			String disciplina  = request.getParameter("disciplina");
			
			Falta f = new Falta();
			f.setData(data);
			f.setDisciplina(disciplina);
			
			for (int i= 1; i< tamanho; i++) 
			{
		
				String ra = request.getParameter(Integer.toString(i));	
				String falta = request.getParameter(ra);
				
				f.setRa(ra);
				f.setFalta(falta);
				
	            try 
	            {
	                FaltaDao cDao = new FaltaDao();
	                cDao.falta(f);
	            } 
	            catch (ClassNotFoundException | SQLException e) 
	            {
	                 e.getMessage();
	            }
		
		
			}
			
			RequestDispatcher r = request.getRequestDispatcher("falta.jsp" ); 
			r.forward( request, response );
			
		}	
		
	}

