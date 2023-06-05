package br.edu.fateczl.Av3.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import br.edu.fateczl.Av3.model.Aluno;
import br.edu.fateczl.Av3.persistence.FaltaDao;

@Controller
public class MostrarFalta 
{
	@RequestMapping(name = "mostrarFalta", value = "/mostrarFalta", method = RequestMethod.GET)
	public ModelAndView init(ModelMap model) 
	{
		return new ModelAndView("mostraFalta");
	}

	@RequestMapping(name = "mostraFalta", value = "/mostraFalta", method = RequestMethod.POST)
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
	
		String disciplina  = request.getParameter("disciplina");
		String data  = request.getParameter("data");
		ArrayList<Aluno> listaAlunos = new ArrayList<>();
		int aula = 0;
		
		try 
		{
			FaltaDao fDao = new FaltaDao();
			aula = fDao.qntAulas(disciplina);
		} 
		catch (ClassNotFoundException | SQLException e1) 
		{
			e1.printStackTrace();
		}
		
		try 
		{
			FaltaDao fDao = new FaltaDao();
			listaAlunos= fDao.listaAlunos();	
		}
		catch (ClassNotFoundException | SQLException e)
		{
			 e.getMessage();
		} 
		finally 
		{
			request.setAttribute("aluno", listaAlunos);
			request.setAttribute("data", data);
			request.setAttribute("materia", disciplina);
			request.setAttribute("aulas", (aula/20));
			request.getRequestDispatcher("/falta.jsp").forward(request, response);
		}
		
	}	
	
}