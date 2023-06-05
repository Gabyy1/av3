package br.edu.fateczl.Av3.persistence;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import br.edu.fateczl.Av3.model.Aluno;
import br.edu.fateczl.Av3.model.Falta;

@Repository
public class FaltaDao 
{
	private Connection c;
	
	public FaltaDao() throws ClassNotFoundException, SQLException 
	{
		GenericDao gDao = new GenericDao();
		c = gDao.getConnection();
	}
	

	public ArrayList<Aluno> listaAlunos() throws SQLException, ClassNotFoundException 
	{
		GenericDao gDao = new GenericDao();
		c = gDao.getConnection();
		
		ArrayList<Aluno> Lista = new ArrayList<Aluno>();
		
		String selectStatement = "Select ra, nome from aluno";
		PreparedStatement prepStmt = c.prepareStatement(selectStatement);
	    ResultSet rs = prepStmt.executeQuery();
	
	    while (rs.next()) 
	    {	
	    	Aluno aluno = new Aluno();
	    	aluno.setRa(rs.getString("ra"));
	    	aluno.setNome(rs.getString("nome"));
	    	Lista.add(aluno);
	     }
	   
	     rs.close();
	     prepStmt.close();
		
		return Lista;
	}
	
	public int qntAulas(String materia)throws SQLException, ClassNotFoundException
	{
		GenericDao gDao = new GenericDao();
		c = gDao.getConnection();
		int resultado = 0;
		
		String selectStatement = "select num_aula from disciplina where codigo=(?)";
		PreparedStatement prepStmt = c.prepareStatement(selectStatement);
		prepStmt.setString(1, materia);
	    ResultSet rs = prepStmt.executeQuery();
	    
	    while (rs.next())
	    {	
	    	resultado = rs.getInt("num_aula");
	    }

		return resultado;
	}
	
	public void falta (Falta aluno) throws ClassNotFoundException, SQLException 
	{
        GenericDao gDao = new GenericDao();
        c = gDao.getConnection();

        String sql = "CALL SP_Faltas_INS (?, ?, ?, ?)";
        CallableStatement cs = c.prepareCall(sql);
        cs.setString(1, aluno.getRa());
        cs.setString(2, aluno.getDisciplina());
        cs.setString(3,aluno.getData());
        cs.setInt(4,Integer.parseInt(aluno.getFalta()));
        cs.execute();
        cs.close();
	}
}