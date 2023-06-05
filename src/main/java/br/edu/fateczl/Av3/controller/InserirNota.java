package br.edu.fateczl.Av3.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import br.edu.fateczl.Av3.model.Nota;
import br.edu.fateczl.Av3.persistence.NotaDao;

@Controller
public class InserirNota 
{
	
	@RequestMapping(name = "nota", value = "/nota", method = RequestMethod.GET)
	public ModelAndView init(ModelMap model) 
	{
		return new ModelAndView("nota");
	}

	
	@RequestMapping(name = "nota", value = "/nota", method = RequestMethod.POST)
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{

		int tamanho = Integer.parseInt(request.getParameter("tamanho"));
		int jTamanho= Integer.parseInt(request.getParameter("jTamanho"));

		int k = 4000;
		int J = 2000;
		
		Nota n = new Nota();
		
		for(int i = 1; i< tamanho; i++)
		{
			String ra  = request.getParameter(Integer.toString(i));
			
			n.setRa(ra);
			
			for (int x = 1;  x<=jTamanho; x++) {
				String codigo = request.getParameter(Integer.toString(J));	
				String nota = request.getParameter(Integer.toString(k));
				
				if ((ra != "" && codigo != "" && nota != "")) 
				{

                    n.setAvaliacao(codigo);
                    n.setNota(nota);
 
                    
                    try 
                    {
                    	NotaDao cDao = new NotaDao();
                        cDao.insereNotas(n);
                    } 
                    catch (ClassNotFoundException | SQLException e)
                    {
                         e.getMessage();
                    }
                }
				
			J++;
			k++;
			}

		}
		
		RequestDispatcher r = request.getRequestDispatcher("nota.jsp"); 
		r.forward( request, response );

		
	}	
	
}