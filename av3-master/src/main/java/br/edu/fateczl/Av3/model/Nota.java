package br.edu.fateczl.Av3.model;

public class Nota {
	private String ra;
	private String disciplina;
	private String avaliacao;
	private String nota;
	
	public String getRa() {
		return ra;
	}
	public void setRa(String ra) {
		this.ra = ra;
	}
	public String getDisciplina() {
		return disciplina;
	}
	public void setDisciplina(String disciplina) {
		this.disciplina = disciplina;
	}
	public String getAvaliacao() {
		return avaliacao;
	}
	public void setAvaliacao(String avaliacao) {
		this.avaliacao = avaliacao;
	}
	public String getNota() {
		return nota;
	}
	public void setNota(String nota) {
		this.nota = nota;
	}
	
	@Override
	public String toString() {
		return "Nota [ra=" + ra + ", disciplina=" + disciplina + ", avaliacao=" + avaliacao + ", nota=" + nota + "]";
	}
	

}
