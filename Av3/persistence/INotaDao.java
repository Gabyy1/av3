package br.edu.fateczl.Av3.persistence;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import br.edu.fateczl.Av3.model.Aluno;
import br.edu.fateczl.Av3.model.Nota;
import br.edu.fateczl.Av3.model.Notas;

public interface INotaDao {
	public List<Aluno> listaAluno() throws SQLException, ClassNotFoundException;
	public List<Notas> listaNota(String disciplina) throws SQLException, ClassNotFoundException;
	public Nota insereNotas (Nota aluno) throws SQLException, ClassNotFoundException;
}