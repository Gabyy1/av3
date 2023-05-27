package br.edu.fateczl.Av3.model;

public class Falta {
	private String ra;
	private String falta;
	private String data;
	private String disciplina;
	
	public String getRa() {
		return ra;
	}
	public void setRa(String ra) {
		this.ra = ra;
	}
	public String getFalta() {
		return falta;
	}
	public void setFalta(String falta) {
		this.falta = falta;
	}
	public String getData() {
		return data;
	}
	public void setData(String data) {
		this.data = data;
	}
	public String getDisciplina() {
		return disciplina;
	}
	public void setDisciplina(String disciplina) {
		this.disciplina = disciplina;
	}
	
	@Override
	public String toString() {
		return "Falta [ra=" + ra + ", falta=" + falta + ", data=" + data + ", disciplina=" + disciplina + "]";
	}

}
