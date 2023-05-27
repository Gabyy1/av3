Create DataBase Av3
Go
Use Av3
Go

Create Table aluno (
ra		char(13)		not null,
nome	varchar(150)	not null
Primary Key (ra)
)
Go


Create Table disciplina (
codigo		char(8)		not null,
nome		varchar(50) not null,
sigla		varchar(10) not null,
turno		varchar(20) not null,
num_aulas	int			not null
Primary Key (codigo)
)
Go

Create  Table avaliacao (
codigo					int identity(1,1)	not null,
codigo_disciplina		char(8)				not null,
tipo					varchar(10)			not null,
peso					decimal(2,2)		not null
Primary Key (codigo),
Foreign Key (codigo_disciplina) references disciplina (codigo)
)
Go

Create Table faltas (
ra_aluno				char(13)	not null,
codigo_disciplina		char(8)		not null,
data					date		not null,
falta   				int			not null
Primary Key (ra_aluno, codigo_disciplina, data)
Foreign Key (ra_aluno) references aluno (ra),
Foreign Key (codigo_disciplina) references disciplina (codigo)
)

Create Table notas (
ra_aluno				char(13)	 not null,
codigo_disciplina		char(8)		 not null,
codigo_avaliacao		int			 not null,
nota					decimal(2,2) not null
Primary Key (ra_aluno, codigo_disciplina, codigo_avaliacao)
Foreign Key (ra_aluno) references aluno (ra),
Foreign Key (codigo_disciplina) references disciplina (codigo),
Foreign Key (codigo_avaliacao) references avaliacao (codigo)
)

INSERT INTO aluno VALUES
('1234567890123', 'Fulano'),
('2345678901234', 'Cicrano'),
('3456789012345', 'Beltrano'),
('5678901234567', 'Cicraninho')

INSERT INTO disciplina VALUES 
('4203-010', 'Arquitetura e Organização de Computadores', 'IAC001', 'Tarde', 80),
('4203-020', 'Arquitetura e Organização de Computadores', 'IAC001', 'Noite', 80),
('4208-010', 'Laboratório de Hardware', 'IHW100', 'Tarde', 40),
('4226-004', 'Banco de Dados', 'IBD002', 'Tarde', 80),
('4213-003', 'Sistemas Operacionais I', 'ISO100', 'Tarde', 80),
('4213-013', 'Sistemas Operacionais I', 'ISO100', 'Noite', 80),
('4233-005', 'Laboratório de Banco de Dados', 'IBD100', 'Tarde', 80),
('5005-220', 'Métodos Para a Produção do Conhecimento', 'IMC001', 'Tarde', 40),
('1111-111', 'Exame', 'EXE111', 'Todos', 0)

INSERT INTO avaliacao VALUES 
('4203-010','P1', 0.3),
('4203-010','P2', 0.5),
('4203-010','T', 0.2),
('4203-020','P1', 0.3),
('4203-020','P2', 0.5),
('4203-020','T', 0.2),
('4208-010','P1', 0.3),
('4208-010','P2', 0.5),
('4208-010','T', 0.2),
('4226-004','P1', 0.3),
('4226-004','P2', 0.5),
('4226-004','T', 0.2),
('4213-003','P1', 0.35),
('4213-003','P2', 0.35),
('4213-003','T', 0.3),
('4213-003','Pre Exame', 0.2),
('4213-013','P1', 0.35),
('4213-013','P2', 0.35),
('4213-013','T', 0.3),
('4213-013','Pre Exame', 0.2),
('4233-005','P1', 0.33),
('4233-005','P2', 0.33),
('4233-005','P3', 0.33),
('5005-220','MC', 0.8),
('5005-220','MR', 0.2),
('1111-111','Exame', 0.5)



--PROCEDURE INSERIR NOTAS

CREATE PROCEDURE sp_inserir_nota (@ra_aluno CHAR(13),  @codigo_avaliacao int, @nota DECIMAL(2,2))
AS

    IF ((@nota <= 10) AND (@nota >= 0))
    BEGIN 

        DECLARE @codigo_disciplina CHAR(8)
        SET @codigo_disciplina = (SELECT codigo_disciplina FROM avaliacao WHERE codigo = @codigo_avaliacao)

        DECLARE @cont int
        SET @cont = (SELECT count(ra_aluno) FROM notas 
            WHERE ra_aluno = @ra_aluno AND codigo_avaliacao = @codigo_avaliacao)

        IF @cont > 0
        BEGIN 
            UPDATE notas SET nota = @nota WHERE ra_aluno = @ra_aluno AND codigo_avaliacao = @codigo_avaliacao;
        END
        ELSE
        BEGIN
            INSERT INTO notas VALUES (@ra_aluno, @codigo_disciplina, @codigo_avaliacao, @nota)
        END
    END
    ELSE
    BEGIN
        RAISERROR ('A NOTA NÃO É VALIDA', 16,1)
    END

--PROCEDURE INSERIR FALTAS 

CREATE PROCEDURE sp_inserir_falta (@ra CHAR(13), @codigo_disciplina CHAR(8), @data DATE, @qnt_falta int, @falta int)
AS

	--confere se o numero de faltas marcadas é maior que o número de aulas do dia

	DECLARE @qnt_aulas int
	SET @qnt_aulas = (SELECT num_aulas FROM disciplina WHERE codigo = @codigo_disciplina) / 20

	print @qnt_aulas

	--Se o numero for maior que o permitido retorna um aviso

	IF @qnt_aulas < @qnt_falta
	BEGIN
		Select 'Quantidade de faltas ultrapassa o limite diário' as Mensagem
	END
	ELSE
	BEGIN
		-- Se o professor não inserir a data pega a atual
		IF (@data is null)
		BEGIN
			SET @data = GETDATE()
		END 

		-- Confere se o aluno nessa data já tem alguma falta marcada

		DECLARE @cont int

		SET @cont = (SELECT count(ra_aluno) FROM faltas WHERE ra_aluno = @ra AND codigo_disciplina = @codigo_disciplina AND data = @data)

		IF (@cont > 0)
		BEGIN
			UPDATE faltas SET falta = @qnt_falta WHERE ra_aluno = @ra AND codigo_disciplina = @codigo_disciplina AND data = @data;
		END
		ELSE
		BEGIN
			INSERT INTO faltas VALUES (@ra, @codigo_disciplina, @data, @falta)
		END
	END



--FUNCTION MOSTRAR NOTAS

Create Function fn_media (@codigo_disciplina Char(8))
Returns @table Table 
(
ra	Char(13),
nome Varchar(100),
n1 Decimal(2,1),
n2 Decimal(2,1),
n3 Decimal(2,1),
n4 Decimal(2,1),
exame Decimal(2,1),
media Decimal(2,1),
situacao Varchar(9),
disciplina Varchar(40)
)
As
Begin

	Declare
	@ra Char(13),
	@codigo_avaliacao int,
	@nota Decimal(2,1),
	@tipo Varchar(10),
	@peso Decimal(2,1),
	@media Decimal(2,1),
	@media_final Decimal(2,1),
	@exame Decimal(2,1)

	Insert Into @table (ra, nome, media, disciplina)
	Select aluno.ra, aluno.nome, 0, disciplina.nome From aluno, disciplina 
	Where disciplina.codigo = @codigo_disciplina

	Declare c_notas Cursor For Select ra_aluno, codigo_avaliacao, nota From notas
	Where @codigo_disciplina = codigo_disciplina Or @codigo_disciplina = '1111-111' 
	Order By ra_aluno, codigo_avaliacao Asc

	Open c_notas
	Fetch Next From c_notas Into @ra, @codigo_avaliacao, @nota

	While @@FETCH_STATUS = 0
	Begin

		Set @peso = (Select peso From avaliacao Where codigo = @codigo_avaliacao)
		Set @tipo = (Select tipo From avaliacao Where codigo = @codigo_avaliacao)
		Set @media = (@nota*@peso)

		--CALCULAR MEDIA 

		If (@tipo = 'P1' OR @tipo = 'MC')
		BEGIN 
			UPDATE @table SET n1 = @nota, media = media + @media WHERE ra = @ra
		END 

		IF (@tipo = 'P2' OR @tipo = 'MR')
		BEGIN 
			UPDATE @table SET n2 = @nota, media = media + @media WHERE ra = @ra
		END 

		IF (@tipo = 'P3' OR @tipo = 'T')
		BEGIN 
			UPDATE @table SET n3 = @nota, media = media + @media WHERE ra = @ra
		END

		SET @media_final = (SELECT media FROM @table WHERE ra = @ra)
		
		IF(@media_final > 3 AND @media_final < 6)
		BEGIN 
			IF (@tipo = 'Pre Exame')
			BEGIN 
				UPDATE @table SET n4 = @nota, media = media + @media WHERE ra = @ra
			END

			IF (@tipo = 'Exame')
			BEGIN 
				UPDATE @table SET exame = @nota, media = (media*0.5) + @media WHERE ra = @ra
			END
		END 

		Set @media_final = (Select media From @table Where ra = @ra)
		Set @exame = (Select exame From @table Where ra = @ra)

		--CALCULAR SITUAÇÃO

		Update @table Set situacao = (Select dbo.fn_situacao(@ra, @media_final, @codigo_disciplina, @exame)) 
		Where ra = @ra

		Fetch Next From c_notas Into @ra, @codigo_avaliacao, @nota
	End

	Close c_notas
	Deallocate c_notas

	Return

End
Go

--FUNCTION MOSTRAR FALTAS

Create function fn_falta(@disciplina Char(11))
Returns @tablef Table


--FUNCTION CALCULAR TOTAL FALTA

Create Function fn_calcula_faltas(@ra Char(13), @codigo_disciplina Char(8))
returns Int
As
Begin
	Declare @faltas Int

	Set @faltas = (Select Sum(falta) From faltas Where ra_aluno = @ra And codigo_disciplina = @codigo_disciplina)

	Return (@faltas)
End

--FUNCTION CALCULAR SITUAÇÃO

Create Function fn_situacao(@ra Char(13), @media Decimal(2,2), @codigo_disciplina Char(8), @exame Decimal(2,2))
Returns Varchar(9)
As
Begin
	Declare @situacao Varchar(9),
			@limite int,
			@faltas int

	Set @faltas = (Select dbo.fn_faltas(@ra, @codigo_disciplina))	
	Set @limite = (Select num_aulas From disciplina Where @codigo_disciplina = codigo) * 0.25

	If (@faltas > @limite)
	Begin
		Set @situacao = 'Reprovado Por Falta'
	End
	Else
	Begin
		If (@media < 6)
		Begin
			Set @situacao = 'Reprovado'
			If ((@exame Is Null) And (@media > 3))
			Begin
				Set @situacao = 'Exame'
			End 
		End
		Else
		Begin
			Set @situacao = 'Aprovado'
		End
	End
	Return (@situacao)
End