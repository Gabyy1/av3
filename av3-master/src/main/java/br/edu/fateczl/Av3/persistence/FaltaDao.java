package br.edu.fateczl.Av3.persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import br.edu.fateczl.Av3.model.Aluno;
import br.edu.fateczl.Av3.model.Falta;

public class FaltaDao implements IFaltaDao {
private Connection c;
	
	public FaltaDao() throws ClassNotFoundException, SQLException {
		GenericDao gDao = new GenericDao();
		c = gDao.getConnection();		
	}
	@Autowired
	GenericDao gDao;

	@Override
	public List<Aluno> listaAluno() throws SQLException, ClassNotFoundException {
		List<Aluno> Lista = new ArrayList<> ();
		Connection c = gDao.getConnection();
		
		String selectStatement = "Select ra, nome From aluno";
		PreparedStatement ps = c.prepareStatement(selectStatement);
		ResultSet rs = ps.executeQuery();
		
		while(rs.next()) {
			Aluno aluno = new Aluno();
			aluno.setRa(rs.getString("ra"));
			aluno.setNome(rs.getString("nome"));
			Lista.add(aluno);
		}
		
		rs.close();
		ps.close();
		
		return Lista;
	}
	
	@Override
	public List<Falta> listaFalta(String disciplina) throws SQLException, ClassNotFoundException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Falta insereFaltas(Falta aluno) throws SQLException, ClassNotFoundException {
		// TODO Auto-generated method stub
		return null;
	}
}
