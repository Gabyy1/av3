package br.edu.fateczl.Av3.model;

public class Disicplina {
	private String codigo;
	private String nome;
	private String turno ;
	public String getCodigo() {
		return codigo;
	}
	public void setCodigo(String codigo) {
		this.codigo = codigo;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getTurno() {
		return turno;
	}
	public void setTurno(String turno) {
		this.turno = turno;
	}
	@Override
	public String toString() {
		return "Disicplina [codigo=" + codigo + ", nome=" + nome + ", turno=" + turno + "]";
	}

}
