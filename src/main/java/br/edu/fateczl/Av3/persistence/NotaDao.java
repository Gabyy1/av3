package br.edu.fateczl.Av3.persistence;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import org.springframework.stereotype.Repository;

import br.edu.fateczl.Av3.model.Aluno;
import br.edu.fateczl.Av3.model.Nota;
import br.edu.fateczl.Av3.model.Notas;

@Repository
public class NotaDao{
	private Connection c;
	
	public NotaDao() throws ClassNotFoundException, SQLException {
		GenericDao gDao = new GenericDao();
		c = gDao.getConnection();		
	}

	public ArrayList<Aluno> listaAluno() throws ClassNotFoundException, SQLException {
		GenericDao gDao = new GenericDao();
		c = gDao.getConnection();	
		
		ArrayList<Aluno> Lista = new ArrayList<Aluno>();
		
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
		
	public ArrayList<Notas> listaNota(String disciplina) throws ClassNotFoundException, SQLException {
		GenericDao gDao = new GenericDao();
		c = gDao.getConnection();	
		
		ArrayList<Notas> ListaN = new ArrayList<Notas>();
		
		String selectStatement = "Select codigo, tipo From avaliacao Where codigi_disciolina = (?)";
		PreparedStatement ps = c.prepareStatement(selectStatement);
		ps.setString(1, disciplina);
		ResultSet rs = ps.executeQuery();
		
		while(rs.next()) {
			Notas notas = new Notas();
			notas.setCodigo(rs.getString("codigo"));
			notas.setTipo(rs.getString("tipo"));
			ListaN.add(notas);
		}
		
		rs.close();
		ps.close();
		
		return ListaN;
		
	}
		
	public void insereNotas (Nota aluno) throws ClassNotFoundException, SQLException {
	
        GenericDao gDao = new GenericDao();
        c = gDao.getConnection();

        String sql = "CALL sp_inserir_nota (?, ?, ?)";
        CallableStatement cs = c.prepareCall(sql);
        cs.setString(1, aluno.getRa());
        cs.setInt(2, Integer.parseInt(aluno.getAvaliacao()));
        cs.setDouble(3, Double.parseDouble(aluno.getNota()));
        cs.execute();
        cs.close();
		
		
	}
	}
