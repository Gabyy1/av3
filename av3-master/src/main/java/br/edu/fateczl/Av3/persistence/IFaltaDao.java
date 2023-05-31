package br.edu.fateczl.Av3.persistence;

import java.sql.SQLException;
import java.util.List;

import br.edu.fateczl.Av3.model.Aluno;
import br.edu.fateczl.Av3.model.Falta;


public interface IFaltaDao {
	public List<Aluno> listaAluno() throws SQLException, ClassNotFoundException;
	public List<Falta> listaFalta(String disciplina) throws SQLException, ClassNotFoundException;
	public Falta insereFaltas (Falta aluno) throws SQLException, ClassNotFoundException;

}
