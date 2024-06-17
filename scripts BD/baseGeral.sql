---criando database
create database  quiz;
go
use quiz;
go

---limitando tempo de requisi��o
exec sp_configure 'remote query timeout', 10;
go
RECONFIGURE;
go


---criando tabelas
CREATE TABLE usuario (
    id_usuario INT PRIMARY KEY IDENTITY(1,1),
    login VARCHAR(255) UNIQUE NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL
);
go
CREATE TABLE curso (
    id_curso INT PRIMARY KEY IDENTITY(1,1),
    curso VARCHAR(255) NOT NULL
);
go
CREATE TABLE disciplina (
    id_disciplina INT PRIMARY KEY IDENTITY(1,1),
    disciplina VARCHAR(255) NOT NULL,
    fk_curso INT,
    FOREIGN KEY (fk_curso) REFERENCES curso(id_curso)
);
go
CREATE TABLE questoes (
    id_questao INT PRIMARY KEY IDENTITY(1,1),
    enunciado TEXT NOT NULL,
    pontuacao INT NOT NULL,
    fk_disciplina INT,
    FOREIGN KEY (fk_disciplina) REFERENCES disciplina(id_disciplina)
);
go
CREATE TABLE alternativa (
    id_alternativa INT PRIMARY KEY IDENTITY(1,1),
    enunciado TEXT NOT NULL,
    correta BIT NOT NULL,
    fk_questao INT,
    FOREIGN KEY (fk_questao) REFERENCES questoes(id_questao)
);
go

CREATE TABLE quiz (
    id_quiz INT PRIMARY KEY IDENTITY(1,1),
    data_quiz DATE NOT NULL,
    fk_usuario INT,
    fk_disciplina INT,
    pontuacao INT,
	fk_questao1 INT,
	fk_questao2 INT,
	fk_questao3 INT,
	fk_questao4 INT,
	fk_questao5 INT,
    FOREIGN KEY (fk_usuario) REFERENCES usuario(id_usuario),
    FOREIGN KEY (fk_disciplina) REFERENCES disciplina(id_disciplina),
	FOREIGN KEY (fk_questao1) REFERENCES questoes (id_questao),
	FOREIGN KEY (fk_questao2) REFERENCES questoes (id_questao),
	FOREIGN KEY (fk_questao3) REFERENCES questoes (id_questao),
	FOREIGN KEY (fk_questao4) REFERENCES questoes (id_questao),
	FOREIGN KEY (fk_questao5) REFERENCES questoes (id_questao),
);
go
CREATE TABLE ranking (
    id_ranking INT PRIMARY KEY IDENTITY(1,1),
    fk_usuario INT,
    pontos INT,
    FOREIGN KEY (fk_usuario) REFERENCES usuario(id_usuario)
);
go
---adicionanando coluna de descri��o
ALTER TABLE disciplina
ADD descricaoDisciplina VARCHAR (200)
ALTER TABLE  disciplina
ADD modulo INT



select * from ranking;
select * from usuario;
select * from curso;
select * from disciplina;
select * from questoes;
select * from alternativa;
select * from quiz;
go
---inserindo dados
INSERT INTO curso(curso)
VALUES ('Desenvolvimento de Sistemas'),
('Administra��o'),
('Com�rcio Exterior'),
('Design de Interiores'),
('Eletr�nica'),
('Secretariado'),
('Servi�os Jur�dicos'),
('Ensino M�dio - Administra��o'),
('Ensino M�dio - Desenvolvimento de Sistemas'),
('Ensino M�dio - Design Gr�fico'),
('Ensino M�dio - Eletr�nica'),
('Ensino M�dio - Eventos'),
('Ensino M�dio - Inform�tica para internet'),
('Ensino M�dio - Servi�os Jur�dicos')
go
INSERT INTO disciplina(disciplina, fk_curso, descricaoDisciplina, modulo)
VALUES ('Ingl�s Instrumental', 1, 'Compreender e interpretar textos em ingl�s voltado para o mundo da tecnologia', 1),
('Programa��o e Algoritmos', 1, 'Estuda a implementa��o de algoritmos em linguagem de programa��o, utilizando ambientes de desenvolvimento', 1),
('Banco de Dados I', 1, 'Estudar modelagem banco de dados, cria��o de modelos conceituais e l�gicos',1),
('�tica e Cidadania Organizacional', 1, 'Foca na compreen��o da melhor maneira de atua��o profissional de acordo com princ�pios �ticos', 1),
('Design Digital', 1, 'Desenvolver elementos gr�ficos para aplicativos e sites.', 1),
 ('Programa��o Web I', 1, 'Desenvolver sites para Web, utilizando HTML5 e CSS3 e introdu��o ao JavaScript', 1),
('Fundamentos da Inform�tica', 1, 'Compreender o funcionamento computadores, bem como entender hardware e software', 1),
('Opera��o de Software Aplicativo', 1, 'Compreender o funcionamento de programas utilizados para aplica��es dentro do sistema operacional, como Word, Excel e PowerPoint', 1),
('An�lise e Projeto de Sistemas', 1, ' Compreender o planejamento e desenvolvimento de sistemas de informa��o para solu��o de problemas de neg�cios.', 2),
('Desenvolvimento de Sistemas ', 1, 'Analisar e projetar sistemas de informa��o, utilizando C# e ambientes
de desenvolvimento de acordo com as especificidades do projeto.', 2),
('Banco de Dados II', 1, 'Entender a constru��o banco de dados relacional utilizando
o Sistema Gerenciador de banco de dados, SQLServer', 2),
('Sistemas Embarcados', 1, 'Desenvolver aplica��es utilizando microcontroladores, ardu�no e ambiente de program��o', 2),
('Programa��o de Aplicativos Mobile I', 1, 'Projetar aplicativos mobile, utilizando IONIC Framework', 2),
('Programa��o Web II', 1, ' Desenvolver websites utilizando
Javascript para o Front e Back End',2),
('Planejamento do Trabalho de Conclus�o de Curso (TCC) em Desenvolvimento de Sistemas', 1, 'Planejar e desenvolver uma solu��o fazendo uso dos conhecimentos adquiridos ao longo do curso',2),
('Seguran�a de Sistemas de Informa��o', 1, 'Desenvolver solu��es de seguran�a dos
dados na elabora��o de sistemas e aplica��es.', 3),
('Banco de Dados III', 1, 'Otimizar a linguagem de consulta estruturada
como forma de informa��o relevante para a
tomada de decis�o.', 3),
('Internet e protocolos', 1, 'Configurar os principais servi�os de redes de
comunica��o de dados e internet para o
desenvolvimento de sistemas.',3),
('Programa��o de Aplicativos Mobile II', 1, 'Projetar aplicativos, selecionando linguagens de
programa��o e ambientes de desenvolvimento e, ainda, consumir dados de APIs',3),
('Programa��o Web III', 1, 'Desenvolver sistemas multicamadas
utilizando framework de desenvolvimento web e desenvolver servi�os de integra��o entre aplica��es',3),
('Linguagem, Trabalho e Tecnologia', 1, 'Foca no estudo da comunica��o em l�ngua portuguesa, utilizando o vocabul�rio t�cnico da �rea e elaborar registros
e planilhas de acompanhamento e controle de atividades.',3),
('Desenvolvimento de Sistemas II', 1, 'Analisar e projetar sistemas de informa��o, selecionando linguagens de programa��o e ambientes
de desenvolvimento de acordo com as especificidades do projeto.', 3),
('Desenvolvimento do Trabalho de Conclus�o de Curso (TCC) em Desenvolvimento de Sistemas', 1, 'Planejar as fases de execu��o de projetos
com base na natureza e na complexidade das
atividades.', 3)
go

INSERT INTO questoes(enunciado, pontuacao, fk_disciplina)
VALUES ('HTML � uma linguagem de programa��o?', '1', 1),
('O que � um framework?', '3', 1),
('O que � gestalt?', '4', 1),
('Qual a diferen�a entre �tica e moral?', '2', 1),
('O que s�o threads?', '4', 1),
('O que � algoritmo?','1',1),
('Qual � a complexidade de tempo de um algoritmo com uma complexidade O(n^2)?','4',1),
('Qual � a principal diferen�a entre um algoritmo de busca em largura (BFS) e um algoritmo de busca em profundidade (DFS)?','5',1),
('Qual � a estrutura de dados fundamental usada em uma fila?','5',1),
('O que � a t�cnica de "dividir para conquistar" em algoritmos?','5',1),
('Qual das alternativas abaixo apresenta uma caracter�stica essencial do ingl�s instrumental?','1',1),
('Ao ler um texto em ingl�s instrumental, qual estrat�gia � mais eficaz para uma compreens�o geral do conte�do?','2',1),
('Qual dos recursos abaixo � mais �til para o desenvolvimento da vocabul�rio t�cnico em ingl�s instrumental?','2',1),
('Ao escrever um email formal em ingl�s instrumental, qual aspecto deve receber mais aten��o?','3',1),
('O que � um computador?','1',1),
('Qual das alternativas a seguir n�o � um tipo de software?','2',1),
('Qual dos recursos abaixo � mais �til para o desenvolvimento da vocabul�rio t�cnico em ingl�s instrumental?','2',1),
('Ao escrever um email formal em ingl�s instrumental, qual aspecto deve receber mais aten��o?','2',1),
('Qual das alternativas abaixo apresenta um exemplo de material �til para o aprendizado de ingl�s instrumental?','1',1),
('Qual dos tipos de ataque visa explorar falhas em softwares para obter acesso n�o autorizado a sistemas e dados?','4',3),
('Qual das medidas a seguir � mais eficaz para proteger senhas contra acesso n�o autorizado?','4',3),
('Qual das ferramentas a seguir � utilizada para criptografar dados e proteg�-los contra acesso n�o autorizado?','3',3),
('Qual das pr�ticas a seguir � crucial para garantir a seguran�a de redes de computadores?','3',3),
('Qual dos tipos de malware tem como objetivo danificar ou corromper sistemas e dados?','2',3),
('Qual linguagem de marca��o � utilizada para definir a estrutura e o conte�do de p�ginas da web?','1',1),
('Qual tecnologia � utilizada para estilizar a apar�ncia de p�ginas da web?','1',1),
('Qual linguagem de script � utilizada para adicionar interatividade e comportamento din�mico a p�ginas da web?','1',1),
('Qual ferramenta � utilizada para gerenciar e visualizar o c�digo-fonte de p�ginas da web?','3',1),
('Qual tecnologia � utilizada para criar p�ginas da web din�micas e interativas com acesso a dados em um servidor?','3',1),
('Qual componente do sistema de gerenciamento de banco de dados (SGBD) � respons�vel por armazenar os dados?','1',2),
('Qual linguagem � utilizada para interagir com o banco de dados e manipular os dados armazenados?','1',2),
('Qual estrutura de dados � utilizada para organizar os dados em um banco de dados relacional?','3',2),
('Qual tipo de dado � utilizado para armazenar texto em um banco de dados?','2',2),
('Qual chave � utilizada para identificar de forma �nica cada registro em uma tabela de banco de dados?','2',2),
('Qual estrutura de dados � utilizada para armazenar uma sequ�ncia ordenada de elementos?','1',1),
('Qual das alternativas abaixo � um exemplo de tecnologia front-end utilizada para construir interfaces web?','1',1),
('Qual estrutura de dados � utilizada para armazenar elementos em uma ordem de "�ltimo a entrar, primeiro a sair"?','4',1),
('Qual estrutura de dados � utilizada para armazenar elementos em uma ordem de "primeiro a entrar, primeiro a sair"?','5',1),
('Qual tipo de algoritmo � utilizado para encontrar o menor caminho entre dois pontos em um grafo?','5',1),
('Na metodologia de desenvolvimento de software conhecida como "Modelagem Orientada a Objetos", qual � o objetivo principal do diagrama de sequ�ncia?','4',2),
('No contexto de An�lise e Projeto de Sistemas, qual � a principal diferen�a entre "acoplamento" e "coes�o"?','3',2),
('Qual � a principal fun��o do diagrama de atividades em An�lise e Projeto de Sistemas?','1',2),
('No contexto de An�lise e Projeto de Sistemas, o que � um "padr�o de projeto"?','2',2),
('Qual � a principal diferen�a entre a abordagem de desenvolvimento "top-down" e "bottom-up"?','3',2),
('O que � um ataque de nega��o de servi�o distribu�do (DDoS)?','2',3),
('O que � criptografia de chave p�blica?','2',3),
('O que � engenharia social em termos de seguran�a de sistemas de informa��o?','3',3),
('Qual � a principal diferen�a entre autentica��o e autoriza��o em um sistema de informa��o?','',3),
('O que � um ataque de inje��o SQL e como ele pode ser mitigado?','4',3),
('Qual dos seguintes n�o � um framework de desenvolvimento web front-end? ','3',1),
('Qual dos seguintes n�o � um m�todo HTTP utilizado em aplica��es web?','3',1),
('O que significa a sigla "URL" em uma aplica��o web? ','2',1),
('Qual � a forma correta do verbo no passado simples para o pronome pessoal "I" (eu) na frase "I (go) to the store yesterday"?','2',1),
('Qual � o significado da express�o idiom�tica "to hit the nail on the head" em ingl�s?','3',1),
('Qual � o ant�nimo da palavra "happy" em ingl�s?','2',1),
('Qual � o termo em ingl�s para "inc�ndio florestal"?','1',1),
('Qual � a forma no partic�pio passado do verbo "to eat" em ingl�s?','2',1),
('Qual � o princ�pio �tico que defende agir sempre de forma a promover o maior bem-estar para o maior n�mero de pessoas?','3',1),
('Qual � o conceito �tico que preconiza que devemos tratar os outros como gostar�amos de ser tratados?','2',1),
('O que significa "confidencialidade" do ponto de vista �tico?','2',1),
('Qual � o conceito �tico que se baseia na ideia de que algumas a��es s�o intrinsecamente erradas, independentemente de suas consequ�ncias?','3',1),
('O que � um conflito de interesses do ponto de vista �tico?','3',1),
('Qual dos seguintes n�o � um sistema operacional?','2',1),
('O que significa a sigla "CPU"?','1',1),
('Qual � a unidade b�sica de armazenamento de dados em um computador?','2',1),
('O que � um URL?','2',1),
('Qual � a fun��o do software antiv�rus?','2',1),
('Enunciado: Qual dos seguintes n�o � um software de design gr�fico?','2',1),
('O que � UI design?','2',1),
('Qual � o objetivo principal do design responsivo?','3',1),
('O que � tipografia?','2',1),
('Qual � o principal objetivo do wireframe em design de interface do usu�rio (UI)?','3',1),
('Qual dos seguintes n�o � um framework de desenvolvimento web front-end?','2',1),
('Qual dos seguintes � um m�todo HTTP usado para enviar dados de um formul�rio HTML para o servidor?','2',1),
('O que significa "CSS" em programa��o web?','1',1),
('Qual � a fun��o do JavaScript em uma p�gina web?','2',1),
('Qual linguagem � usada para estilizar o layout de uma p�gina web?','2',2),
('Qual � a fun��o do protocolo HTTP em uma aplica��o web?','3',2),
('Qual dos seguintes n�o � um framework de desenvolvimento web em JavaScript?','2',2),
('O que significa "DOM" em programa��o web?','3',2),
('Qual � o m�todo HTTP padr�o usado quando um formul�rio HTML � enviado?','2',2),
('Qual aplicativo do Pacote Office � usado principalmente para criar apresenta��es de slides?','2',1),
('Qual ferramenta do Microsoft Excel � usada para realizar c�lculos complexos e an�lise de dados?','3',1),
('Qual recurso do Microsoft Word permite que voc� crie documentos com formata��o profissional, como curr�culos e cartas?','2',1),
('Qual recurso do Microsoft Outlook permite que voc� agende compromissos, organize tarefas e gerencie seu calend�rio?','2',1),
('Qual � a fun��o principal do Microsoft Access no Pacote Office?','3',1),
('O que � um ataque de phishing?','2',3),
('O que � criptografia?','2',3),
('Qual das seguintes op��es � uma pr�tica recomendada para proteger senhas?','2',3),
('O que � um firewall?','2',3),
('O que � engenharia social em seguran�a da informa��o?','3',3),
('Qual � o principal objetivo da normaliza��o em um banco de dados relacional?','2',2),
('O que � um �ndice em banco de dados?','2',2),
('Qual � a principal caracter�stica de um banco de dados NOSQL','2',2),
('O que significa a sigla ACID em rela��o a transa��es em banco de dados?','2',2),
('Qual � a fun��o do SGBD (Sistema de Gerenciamento de Banco de Dados)?','1',2),
('Qual � a fun��o principal da mem�ria RAM?','2',1),
('O que � a nuvem e como ela funciona?','2',1),
('O que � um �ndice em banco de dados?','2',1),
('O que � design digital?','2',1),
('Qual dos princ�pios a seguir n�o � considerado um dos princ�pios b�sicos do design digital?','3',1),
('Qual a import�ncia da tipografia no design digital?','2',1),
('Quais s�o as principais diferen�as entre design gr�fico e design digital?','3',1),
('Como o design digital pode contribuir para a acessibilidade de um produto digital?','2',1),
('O que � seguran�a da informa��o?','1',3),
('Qual das alternativas a seguir n�o � um tipo comum de ataque cibern�tico?','2',3),
('Qual a import�ncia de manter o software antiv�rus atualizado?','2',3),
('Quais s�o as melhores pr�ticas para criar senhas fortes?','3',3),
('Como a criptografia pode ser utilizada para proteger dados confidenciais?','4',3),
('O que � desenvolvimento de software?','2',2),
('Qual das alternativas a seguir n�o � um tipo de metodologia de desenvolvimento de software?','2',2),
('Qual a import�ncia de utilizar um controle de vers�o no desenvolvimento de software?','3',2),
('Quais s�o as principais caracter�sticas de um bom software?','3',2),
('Como os testes de software podem contribuir para a qualidade do software?','4',2)


go
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Sim, porque permite a cria��o de aplicativos complexos.',0,1),
('b) Sim, porque pode ser compilada em c�digo de m�quina.',0,1),
('c) N�o, porque � usada para estilizar p�ginas web.',0,1),
('d) N�o, porque � uma linguagem de marca��o usada para estruturar conte�do na web.',1,1),
('e) N�o, porque � uma linguagem de script para manipula��o de dados.',0,1)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Uma biblioteca de fun��es para realizar opera��es matem�ticas.',0,2),
('b) Um ambiente de desenvolvimento integrado (IDE).',0,2),
('c) Um conjunto de ferramentas que fornece suporte gen�rico para o desenvolvimento de software.',1,2),
('d) Uma linguagem de programa��o espec�fica para criar interfaces de usu�rio.',0,2),
('e) Um sistema operacional projetado para servidores web.',0,2)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Um estilo de arquitetura moderna.',0,3),
('b) Um m�todo de an�lise de dados em estat�sticas.',0,3),
('c) Um tipo de framework de desenvolvimento de software.',0,3),
('d) Uma teoria psicol�gica que prop�e que os seres humanos percebem padr�es e configura��es completas.',1,3),
('e) Um processo de fabrica��o de materiais compostos.',0,3)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) �tica � subjetiva, enquanto moral � objetiva.',0,4),
('b) Moral � um conjunto de princ�pios universais, enquanto �tica � um conjunto de normas pessoais.',0,4),
('c) �tica � inata, enquanto moral � aprendida.',0,4),
('d) �tica refere-se a princ�pios filos�ficos e morais referem-se a pr�ticas culturais e sociais.',1,4),
('e) N�o h� diferen�a entre �tica e moral, s�o sin�nimos.',0,4)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Pequenos programas que s�o executados de forma independente dentro de um sistema operacional.',0,5),
('b) Blocos de mem�ria utilizados para armazenamento tempor�rio de dados.',0,5),
('c) Conex�es de rede estabelecidas entre computadores para comunica��o.',0,5),
('d) Unidades b�sicas de execu��o de um processo, permitindo a execu��o simult�nea de m�ltiplas tarefas.',1,5),
('e) Sequ�ncias de comandos utilizados na programa��o de microcontroladores.',0,5)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Um programa de computador.',0,6),
('b) Uma sequ�ncia finita de passos para resolver um problema.',1,6),
('c) Uma linguagem de programa��o.',0,6),
('d) Um tipo de vari�vel.',0,6)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Linear',0,7),
('b) Quadr�tica',1,7),
('c) Exponencial',0,7),
('d) Logar�tmica',0,7)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) O BFS usa uma pilha enquanto o DFS usa uma fila.',0,8),
('b) O BFS � recursivo enquanto o DFS � iterativo.',0,8),
('c) O BFS explora todos os v�rtices em um n�vel antes de passar para o pr�ximo n�vel, enquanto o DFS explora o m�ximo poss�vel em uma dire��o antes de retroceder.',1,8),
('d) O BFS � mais eficiente em termos de espa�o do que o DFS.',0,8)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Pilha.',0,9),
('b) �rvore.',0,9),
('c) Lista.',1,9),
('d) Vetor.',0,9)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Um m�todo para realizar itera��es repetitivas sobre uma lista de elementos.',0,10),
('b) Um algoritmo que usa recurs�o para resolver problemas menores.',0,10),
('c) Um m�todo que divide um problema em subproblemas menores, resolve cada subproblema independentemente e combina as solu��es para obter a solu��o final.',1,10),
('d) Uma t�cnica que envolve a ordena��o de elementos em uma estrutura de dados.',0,10)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) �nfase na fluidez e na conversa��o.',0,11),
('b) Foco no desenvolvimento da escrita formal e da gram�tica complexa.',0,11),
('c) Aprendizagem voltada para a leitura e compreens�o de textos acad�micos e profissionais.',1,11),
('d) Prioriza��o da tradu��o literal entre o portugu�s e o ingl�s',0,11)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Traduzir palavra por palavra para o portugu�s.',0,12),
('b) Identificar palavras-chave e express�es relevantes.',1,12),
('c) Buscar a defini��o de todas as palavras desconhecidas no dicion�rio.',0,12),
('d) Ler o texto em voz alta para melhorar a pron�ncia.',0,12)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Assistir a filmes e s�ries em ingl�s sem legendas.',0,13),
('b) Ler artigos e livros em portugu�s sobre o seu campo de atua��o.',0,13),
('c) Utilizar dicion�rios bil�ngues online ou impressos.',1,13),
('d) Praticar conversa��o em ingl�s com amigos nativos.',0,13)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Utiliza��o de g�rias e express�es informais.',0,14),
('b) Clareza, concis�o e organiza��o das ideias.',1,14),
('c) Uso de vocabul�rio complexo e frases rebuscadas.',0,14),
('d) Regras gramaticais avan�adas, como tempos verbais irregulares.',0,14)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Uma m�quina de escrever eletr�nica.',0,15),
('b) Um dispositivo eletr�nico que manipula informa��es e dados.',1,15),
('c) Uma calculadora avan�ada.',0,15),
('d) Um aparelho de som com recursos de armazenamento.',0,15)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Sistema operacional.',0,16),
('b) Hardware.',1,16),
('c) Aplicativo.',0,16),
('d) Linguagem de programa��o.',0,16)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Assistir a filmes e s�ries em ingl�s sem legendas.',0,17),
('b) Ler artigos e livros em portugu�s sobre o seu campo de atua��o.',0,17),
('c) Utilizar dicion�rios bil�ngues online ou impressos.',1,17),
('d) Praticar conversa��o em ingl�s com amigos nativos.',0,17)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Utiliza��o de g�rias e express�es informais.',0,18),
('b) Clareza, concis�o e organiza��o das ideias.',1,18),
('c) Uso de vocabul�rio complexo e frases rebuscadas.',0,18),
('d) Regras gramaticais avan�adas, como tempos verbais irregulares.',0,18)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Sites de entretenimento com jogos e atividades em ingl�s.',0,19),
('b) Livros did�ticos de gram�tica inglesa para iniciantes.',0,19),
('c) Artigos cient�ficos e not�cias especializadas na sua �rea de atua��o.',1,19),
('d) V�deos de humoristas e canais de entretenimento no YouTube.',0,19)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Engenharia social.',0,20),
('b) Ataque de for�a bruta.',0,20),
('c) Inje��o de SQL.',1,20),
('d) Phishing.',0,20)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a)  Usar a mesma senha para todos os sistemas e aplicativos.',0,21),
('b) Criar senhas f�ceis de lembrar, como datas de nascimento ou nomes de animais de estima��o.',0,21),
('c) Utilizar senhas fortes com combina��es de letras mai�sculas, min�sculas, n�meros e s�mbolos.',1,21),
('d) Anotar senhas em um papel ou armazen�-las em um arquivo de texto no computador.',0,21)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Antiv�rus.',0,22),
('b) Firewall.',0,22),
('c) VPN.',0,22),
('d) Ferramenta de criptografia.',1,22)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Instalar softwares antiv�rus e mant�-los atualizados.',0,23),
('b) Configurar firewalls para bloquear acessos n�o autorizados.',0,23),
('c) Aplicar atualiza��es de seguran�a em sistemas operacionais e softwares.',0,23),
('d) Todas as alternativas acima.',1,23)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Spyware.',0,24),
('b) Ransomware.',0,24),
('c) Malware destrutivo.',0,24),
('d) Todas as alternativas acima.',1,24)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) CSS.',0,25),
('b) JavaScript.',0,25),
('c) HTML.',1,25),
('d) PHP.',0,25)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a)  HTML.',0,26),
('b) JavaScript.',0,26),
('c) CSS.',1,26),
('d) PHP.',0,26)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) HTML.',0,27),
('b) CSS.',0,27),
('c) JavaScript.',1,27),
('d) PHP.',0,27)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Navegador web.',0,28),
('b) Editor de texto.',0,28),
('c) Servidor web.',0,28),
('d) Todas as alternativas acima.',1,28)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) HTML.',0,29),
('b) CSS.',0,29),
('c) JavaScript.',0,29),
('d) Linguagem de programa��o back-end (ex: PHP, Python, Java).',1,29)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Interface do usu�rio.',0,30),
('b) Metadados.',0,30),
('c) Linguagem de consulta (SQL).',0,30),
('d) Banco de dados.',1,30)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a)  HTML.',0,31),
('b) CSS.',0,31),
('c) JavaScript.',0,31),
('d) Linguagem de consulta (SQL).',1,31)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Arrays.',0,32),
('b) Listas.',0,32),
('c) Tabelas.',1,32),
('d) �rvores.',0,32)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Inteiro.',0,33),
('b) Decimal.',0,33),
('c) Data.',0,33),
('d) Texto (varchar, char).',1,33)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Chave prim�ria.',1,34),
('b) Chave estrangeira.',0,34),
('c) �ndice.',0,34),
('d) Todas as alternativas acima.',0,34)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Arrays.',1,35),
('b) Listas.',0,35),
('c) Pilhas.',0,35),
('d) Filas.',0,35)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) PHP.',0,36),
('b) JavaScript.',0,36),
('c) HTML.',1,36),
('d) MySQL.',0,36)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Arrays.',0,37),
('b) Listas.',0,37),
('c) Pilhas.',1,37),
('d) Filas.',0,37)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Arrays.',0,38),
('b) Listas.',0,38),
('c) Pilhas.',0,38),
('d) Filas.',1,38)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Algoritmo de busca em largura.',0,39),
('b) Algoritmo de busca em profundidade.',0,39),
('c) Algoritmo de Dijkstra.',1,39),
('d) Algoritmo de A*.',0,39)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Mostrar a estrutura est�tica de um sistema.',0,40),
('b) Representar a intera��o entre objetos ao longo do tempo.',1,40),
('c) Descrever a estrutura de uma base de dados.',0,40),
('d) Ilustrar a distribui��o de componentes de software em uma arquitetura de sistema.',0,40)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Acoplamento refere-se � for�a relativa de interconex�o entre m�dulos, enquanto coes�o refere-se � consist�ncia interna de um �nico m�dulo.',1,41),
('b) Acoplamento refere-se � consist�ncia interna de um �nico m�dulo, enquanto coes�o refere-se � for�a relativa de interconex�o entre m�dulos.',0,41),
('c) Acoplamento refere-se � rela��o entre classes em um diagrama de classe, enquanto coes�o refere-se � rela��o entre objetos em um diagrama de sequ�ncia.',0,41),
('d) Acoplamento refere-se � rela��o entre objetos em um diagrama de sequ�ncia, enquanto coes�o refere-se � rela��o entre classes em um diagrama de classe.',0,41)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Mostrar a estrutura de classes em um sistema.',0,42),
('b) Descrever a intera��o entre objetos em um sistema.',0,42),
('c) Representar a sequ�ncia de atividades em um processo de neg�cio.',1,42),
('d) Ilustrar a estrutura de uma base de dados.',0,42)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Um modelo matem�tico usado para prever o desempenho de um sistema.',0,43),
('b) Um conjunto de diretrizes para escrever c�digo leg�vel e eficiente.',0,43),
('c) Uma solu��o reutiliz�vel para um problema comum de design de software.',1,43),
('d) Um m�todo para verificar a consist�ncia e a integridade de uma base de dados.',0,43)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Na abordagem "top-down", o sistema � desenvolvido come�ando pelos componentes mais detalhados, enquanto na abordagem "bottom-up", o sistema � desenvolvido come�ando pelos componentes de mais alto n�vel.',1,44),
('b) Na abordagem "top-down", o sistema � desenvolvido iterativamente, enquanto na abordagem "bottom-up", o sistema � desenvolvido em uma �nica itera��o.',0,44),
('c) Na abordagem "top-down", o sistema � desenvolvido em uma �nica itera��o, enquanto na abordagem "bottom-up", o sistema � desenvolvido iterativamente.',0,44),
('d) Na abordagem "top-down", o sistema � desenvolvido sem considerar os requisitos do usu?rio, enquanto na abordagem "bottom-up", os requisitos do usu�rio s�o a principal considera��o durante o desenvolvimento.',0,44)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Um ataque que impede o acesso de usu�rios autorizados a um sistema, inundando-o com tr�fego malicioso.',1,45),
('b) Um ataque que fornece acesso n�o autorizado a informa��es confidenciais.',0,45),
('c) Um ataque que explora vulnerabilidades de software para obter controle sobre um sistema.',0,45),
('d) Um ataque que modifica dados armazenados em um banco de dados.',0,45)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Um m�todo de criptografia onde a mesma chave � usada para criptografar e descriptografar dados.',0,46),
('b) Um m�todo de criptografia onde chaves separadas s�o usadas para criptografar e descriptografar dados.',1,46),
('c) Um algoritmo de criptografia que n�o requer chaves.',0,46),
('d) Um m�todo de criptografia obsoleto, substitu�do por t�cnicas mais avan�adas.',0,46)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Um m�todo de criptografia baseado em algoritmos gen�ticos.',0,47),
('b) Uma abordagem para proteger sistemas de ataques cibern�ticos.',0,47),
('c) Uma t�cnica utilizada para manipular pessoas e obter informa��es confidenciais.',1,47),
('d) Um protocolo de comunica��o seguro usado em redes privadas.',0,47)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Autentica��o verifica a identidade do usu�rio, enquanto autoriza��o controla o acesso a recursos espec�ficos.',1,48),
('b) Autentica��o controla o acesso a recursos espec�ficos, enquanto autoriza��o verifica a identidade do usu�rio.',0,48),
('c) Autentica��o e autoriza��o s�o termos intercambi�veis e significam a mesma coisa.',0,48),
('d) Autentica��o e autoriza��o s�o conceitos obsoletos em seguran�a de sistemas de informa��o.',0,48)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Um ataque que injeta c�digo malicioso em consultas SQL para obter acesso n�o autorizado a um banco de dados.',1,49),
('b) Um ataque que modifica a linguagem de programa��o de um site para exibir conte�do malicioso.',0,49),
('c) Um ataque que envia um grande volume de solicita��es para um servidor web, sobrecarregando-o.',0,49),
('d) Um ataque que intercepta e modifica dados transmitidos entre um cliente e um servidor.',0,49)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) React.',0,50),
('b) Django.',1,50),
('c) Angular.',0,50),
('d) Vue.js.',0,50)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) GET.',0,51),
('b) FETCH.',1,51),
('c) POST.',0,51),
('d) DELETE.',0,51)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Universal Resource Locator.',0,52),
('b) Uniform Resource Locator.',1,52),
('c) Unique Resource Locator.',0,52),
('d) Unified Resource Locator.',0,52)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Goes.',0,53),
('b) Going.',0,53),
('c) Gone.',0,53),
('d) Went.',1,53)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Bater um prego na cabe�a.',0,54),
('b) Atingir o alvo.',0,54),
('c) Cometer um erro grave.',0,54),
('d) Acertar em cheio.',1,54)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Sad.',1,55),
('b) Excited.',0,55),
('c) Joyful.',0,55),
('d) Content.',0,55)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Forest fire.',1,56),
('b) Wood fire.',0,56),
('c) Jungle blaze.',0,56),
('d) Tree burn.',0,56)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Ate.',0,57),
('b) Eating.',0,57),
('c) Eaten.',1,57),
('d) Eats.',0,57)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Utilitarismo.',1,58),
('b) Ego�smo.',0,58),
('c) Altru�smo.',0,58),
('d) Individualismo.',0,58)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Deontologia.',0,59),
('b) Relativismo �tico.',0,59),
('c) Utilitarismo.',0,59),
('d) Princ�pio da reciprocidade.',1,59)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Divulgar informa��es pessoais sem autoriza��o.',0,60),
('b) Manter em sigilo informa��es confiadas a n�s.',1,60),
('c) Fazer promessas que n�o pretendemos cumprir.',0,60),
('d) Ignorar as opini�es dos outros.',0,60)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Deontologia.',1,61),
('b) Utilitarismo.',0,61),
('c) Ego�smo.',0,61),
('d) Relativismo �tico.',0,61)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Uma situa��o em que os interesses de uma pessoa est�o alinhados com os interesses da empresa.',0,62),
('b) Uma situa��o em que h� um choque entre os interesses pessoais e os deveres profissionais de uma pessoa.',1,62),
('c) Uma situa��o em que n�o h� interesses em jogo.',0,62),
('d) Uma situa��o em que os interesses pessoais sempre prevalecem sobre os interesses da empresa.',0,62)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Windows.',0,63),
('b) Microsoft Office.',1,63),
('c) Linux.',0,63),
('d) macOS.',0,63)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Central Processing Unit.',1,64),
('b) Computer Processing Unit.',0,64),
('c) Central Personal Unit.',0,64),
('d) Control Processing Unit.',0,64)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Byte.',1,65),
('b) Gigabyte.',0,65),
('c) Terabyte.',0,65),
('d) Megabyte.',0,65)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Um tipo de arquivo de computador.',0,66),
('b) Uma linguagem de programa��o.',0,66),
('c) Um endere�o da web.',1,66),
('d) Um tipo de software.',0,66)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Criar novos v�rus.',0,67),
('b) Proteger o computador contra v�rus e malware.',1,67),
('c) Otimizar o desempenho do sistema operacional.',0,67),
('d) Acelerar a conex�o com a internet.',0,67)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Phostoshop.',0,68),
('b) Illustrator.',0,68),
('c) Premiere Pro.',1,68),
('d) Sketch.',0,68)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Design de interface do usu�rio.',1,69),
('b) Design de intera��o do usu�rio.',0,69),
('c) Design de �cones.',0,69),
('d) Design de anima��es.',0,69)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Criar sites com muitos recursos interativos.',0,70),
('b) Garantir que os sites sejam visualmente atraentes.',0,70),
('c) Adaptar o layout de um site para diferentes dispositivos e tamanhos de tela.',1,70),
('d) Otimizar a velocidade de carregamento do site.',0,70)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) O estudo das cores em design.',0,71),
('b) O estudo das formas em design.',0,71),
('c) O estudo dos padr�es em design.',0,71),
('d) O estudo das fontes em design.',1,71)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Criar um prot�tipo funcional do produto final.',0,72),
('b) Definir a estrutura e o layout de uma p�gina ou aplicativo.',1,72),
('c) Aplicar cores e estilos visuais ao design.',0,72),
('d) Desenvolver anima��es interativas para o usu�rio.',0,72)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) React.',0,73),
('b) Angular.',0,73),
('c) Django.',1,73),
('d) Vue.js.',0,73)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) POST.',1,74),
('b) GET.',0,74),
('c) PUT.',0,74),
('d) DELETE.',0,74)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Computer Style Sheets.',0,75),
('b) Creative Style Sheets.',0,75),
('c) Cascading Style Sheets.',1,75),
('d) Centralized Style Sheets.',0,75)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Definir estilos e layout da p�gina.',0,76),
('b) Controlar a interatividade e din�mica da p�gina.',1,76),
('c) Gerenciar o servidor de banco de dados.',0,76),
('d) Estruturar o conte�do da p�gina.',0,76)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) HTML.',0,77),
('b) JavaScript.',0,77),
('c) Python.',0,77),
('d) CSS.',1,77)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Definir a estrutura da p�gina.',0,78),
('b) Controlar a interatividade do usu�rio.',0,78),
('c) Transferir dados entre o cliente e o servidor.',1,78),
('d) Estabelecer conex�es de banco de dados.',0,78)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Angular.',0,79),
('b) Raect.',0,79),
('c) Vue.js.',0,79),
('d) Django.',1,79)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Document Object Model.',1,80),
('b) Data Object Model.',0,80),
('c) Design Object Model.',0,80),
('d) Display Object Model.',0,80)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) GET.',0,81),
('b) POST.',1,81),
('c) PUT.',0,81),
('d) DELETE.',0,81)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Word.',0,82),
('b) Excel.',0,82),
('c) PowerPoint.',1,82),
('d) Outlook.',0,82)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) WordArt.',0,83),
('b) PivotTable.',1,83),
('c) SmartArt.',0,83),
('d) Word Wrap.',0,83)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Excel.',0,84),
('b) PowerPoint.',0,84),
('c) Publisher.',0,84),
('d) Templetes.',1,84)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Contatos.',0,85),
('b) Calend�rio.',1,85),
('c) Tarefas.',0,85),
('d) Correio.',0,85)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Criar e editar documentos de texto.',0,86),
('b) Criar e gerenciar bancos de dados.',1,86),
('c) Criar apresenta��es de slides.',0,86),
('d) Criar planilhas e realizar c�lculos.',0,86)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Um ataque que usa for�a bruta para quebrar senhas.',0,87),
('b) Um ataque que explora vulnerabilidades em software desatualizado.',0,87),
('c) Um ataque que visa enganar os usu�rios para que revelem informa��es pessoais ou confidenciais.',1,87),
('d) Um ataque que visa derrubar um sistema ou rede sobrecarregando-o com tr�fego malicioso.',0,87)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Um tipo de v�rus que se espalha por redes sem ser detectado.',0,88),
('b) Um m�todo usado para alterar o c�digo fonte de um programa malicioso.',0,88),
('c) O processo de transformar informa��es leg�veis em um c�digo ileg�vel para proteg�-las.',1,88),
('d) Uma t�cnica usada para identificar e corrigir vulnerabilidades de seguran�a.',0,88)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Usar a mesma senha para v�rias contas online.',0,89),
('b) Armazenar as senhas em um arquivo de texto simples no computador.',0,89),
('c) Criar senhas longas e complexas com uma combina��o de letras, n�meros e caracteres especiais.',1,89),
('d) Compartilhar as senhas com colegas de trabalho para facilitar o acesso a sistemas compartilhados.',0,89)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Um dispositivo que protege contra ataques f�sicos a servidores.',0,90),
('b) Um software que detecta e remove malware de computadores.',0,90),
('c) Uma barreira de seguran�a que monitora e controla o tr�fego de rede.',1,90),
('d) Uma t�cnica usada para ofuscar o c�digo fonte de um programa.',0,90)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Um m�todo para descriptografar dados protegidos.',0,91),
('b) Uma t�cnica para explorar vulnerabilidades de software.',0,91),
('c) Uma pr�tica que usa manipula��o psicol�gica para obter informa��es confidenciais.',1,91),
('d) Uma estrat�gia para identificar e corrigir falhas de seguran�a em sistemas de informa��o.',0,91)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Maximizar a redundancia de dados.',0,92),
('b) Minimizar a consistencia dos dados.',0,92),
('c) Aumentar a complexidade das consultas.',0,92),
('d) Garantir a eficiencia na recupera��o e atualiza��o dos dados.',1,92)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Um conjunto de dados n�o organizados.',0,93),
('b) Uma restri��o que impede a inser��o de dados duplicados.',0,93),
('c) Uma estrutura que melhora o desempenho das consultas ao facilitar a busca por registros.',1,93),
('d) Uma forma de armanezar dados de forma hier�rquica.',0,93)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Estrutura de dados altamente normalizada .',0,94),
('b) Uso exclusivo de linguagens de consulta SQL.',0,94),
('c) Flexibilidade no esquema de dados.',1,94),
('d) �nfase na consistencia forte em detrimento da disponibilidade.',0,94)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Adi��o, Cria��o, Integra��o, Dele��o.',0,95),
('b) Acesso, Controle, Identifica��o, Durabilidade.',0,95),
('c) Atomicidade, Consist�ncia, Isolamento, Durabilidade.',1,95),
('d) Agrega��o, Compress�o, Interpola��o, Depura��o.',0,95)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Gerar relat�rios financeiros.',0,96),
('b) Controlar o acesso f�sico aos servidores de banco de dados.',0,96),
('c) Oferecer uma interface para gerenciar e manipular o banco de dados. ',1,96),
('d) Codificar os dados para garantir a seguran�a.',0,96)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Armazenar dados de forma permanente.',0,97),
('b) Processar instru��es e realizar c�lculos.',0,97),
('c) Exibir informa��es na tela do computador.',0,97),
('d) Armazenar o sistema operacional e outros programas em uso.',1,97)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) O HD � mais r�pido e silencioso que o SSD.',0,98),
('b) O SSD � mais r�pido e dur�vel que o HD.',1,98),
('c) O HD armazena mais dados que o SSD.',0,98),
('d) O SSD � mais barato que o HD.',0,98)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) � um tipo de computador que fica na internet.',0,99),
('b) � um servi�o que permite armazenar dados e arquivos online.',1,99),
('c) � uma rede de computadores interligados.',0,99),
('d) � um programa que permite acessar arquivos de outros computadores.',0,99)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) A arte de criar objetos f�sicos, como m�veis e utens�lios.',0,100),
('b) A cria��o de interfaces visuais para websites, aplicativos e outros produtos digitais.',1,100),
('c) A concep��o e desenvolvimento de estrat�gias de marketing online.',0,100),
('d) A produ��o de conte�do para redes sociais e m�dias digitais.',0,100)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Hierarquia visual.',0,101),
('b) Clareza e objetividade.',0,101),
('c) Consist�ncia.',0,101),
('d) Tecnologia de ponta.',1,101)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Tornar o texto mais bonito e atraente.',0,102),
('b) Facilitar a leitura do texto na tela.',0,102),
('c) Transmitir a mensagem da marca de forma eficaz.',0,102),
('d) Todas as alternativas est�o corretas.',1,102)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) O design gr�fico � focado em produtos f�sicos, enquanto o design digital � focado em produtos digitais.',1,103),
('b) O design gr�fico utiliza apenas t�cnicas tradicionais, enquanto o design digital utiliza ferramentas digitais.',0,103),
('c) O design gr�fico n�o precisa se preocupar com a usabilidade, enquanto o design digital precisa.',1,103),
('d) Todas as alternativas est�o corretas.',0,103)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Utilizando cores vibrantes e contrastantes.',0,104),
('b) Criando interfaces complexas com muitas funcionalidades.',0,104),
('c) Utilizando imagens e v�deos de alta qualidade.',0,104),
('d) Considerando as necessidades de pessoas com diferentes tipos de defici�ncia.',1,104)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) A prote��o de dados contra acessos n�o autorizados, uso indevido ou divulga��o.',1,105),
('b) A utiliza��o de softwares antiv�rus e firewalls para proteger computadores.',0,105),
('c) A cria��o de senhas fortes e complexas para todas as contas online.',0,105),
('d) A implementa��o de pol�ticas de seguran�a para empresas e organiza��es.',0,105)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Malware.',0,106),
('b) Phishing.',0,106),
('c) Engenharia social. ',0,106),
('d) Backup.',1,106)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Para proteger o computador contra v�rus e outros softwares maliciosos.',1,107),
('b) Para melhorar o desempenho do computador.',0,107),
('c) Para garantir a compatibilidade com outros softwares.',0,107),
('d) Para proteger o computador contra-ataques cibern�ticos.',0,107)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Utilizar senhas curtas e f�ceis de lembrar.',0,108),
('b) Usar a mesma senha para todas as contas.',0,108),
('c) Incluir informa��es pessoais nas senhas, como data de nascimento ou nome completo.',0,108),
('d) Utilizar senhas longas e complexas, com letras mai�sculas, min�sculas, n�meros e s�mbolos.',1,108)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Atrav�s da utiliza��o de softwares antiv�rus e firewalls.',0,109),
('b) Atrav�s da cria��o de senhas fortes e complexas.',0,109),
('c) Atrav�s da realiza��o de backups regulares dos dados.',0,109),
('d) Atrav�s da convers�o dos dados em um formato ileg�vel para pessoas n�o autorizadas.',1,109)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) A cria��o de websites e p�ginas da web.',0,110),
('b) A utiliza��o de softwares para realizar tarefas especificas.',0,110),
('c) O processo de criar e implementar programas de computador.',1,110),
('d) A compra e instala��o de softwares prontos para uso.',0,110)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Cascata.',0,111),
('b) �gil.',0,111),
('c) Prototipagem.',0,111),
('d) Hardware.',1,111)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Para acelerar o processo de desenvolvimento.',0,112),
('b) Para facilitar a comunica��o entre os membros da equipe.',0,112),
('c) Para rastrear as altera��es feitas no c�digo do software.',1,112),
('d) Para garantir a seguran�a do c�digo do software.',0,112)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Ser f�cil de usar e intuitivo.',0,113),
('b) Ser livre de erros e bugs.',0,113),
('c) Atender as necessidades dos usu�rios.',0,113),
('d) Todas as alternativas est�o corretas.',1,113)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Aumentando a velocidade do desenvolvimento do software.',0,114),
('b) Diminuindo o custo do desenvolvimento do software.',0,114),
('c) Identificando e corrigindo erros no software.',1,114)

---criando procedures
---consultar disciplinas
CREATE OR ALTER PROCEDURE spConsultarDisciplina
AS
BEGIN
    SELECT 
        d.id_disciplina,
        d.disciplina,
        c.curso
    FROM 
        disciplina d
    JOIN 
        curso c ON d.fk_curso = c.id_curso;
END;
go
---inserir usuario
CREATE OR ALTER PROCEDURE spInserirUsuario(
		@email VARCHAR (100), 
		@senha VARCHAR (50),
		@login VARCHAR(255),
		@status BIT OUTPUT,
		@mensagem VARCHAR(255) OUTPUT)
		AS
		BEGIN
			DECLARE @usuarioExistente VARCHAR(255);
		
			SELECT @usuarioExistente = @login FROM usuario WHERE login = @login ;
	
			IF @login != @usuarioExistente or @usuarioexistente IS NULL
			BEGIN
				SET @mensagem = 'Login n�o encontrado. Voc� ser� direecionado para p�gina de cadastro. ';
				SET @status = 0;
			BEGIN
				INSERT INTO usuario(login, email, senha)
				VALUES (@login, @email, @senha)
				SET @mensagem = 'Usuario cadastrado com sucesso!';
			END			
		END
		ELSE
		BEGIN
			IF @login = @usuarioExistente
			BEGIN
				select * from usuario;
			SET @mensagem = 'Usu�rio cadastrado';
			SET @status = 1;
		END			
	END
END


go
---consultar senha
CREATE OR ALTER PROCEDURE spConsultarSenha(
    @login VARCHAR(100),
    @senhaInformada VARCHAR(100),
    @status BIT OUTPUT,
    @mensagem VARCHAR(255) OUTPUT
)
AS
BEGIN
    DECLARE 
		@senhaArmazenada VARCHAR(100);
    SELECT @senhaArmazenada = senha FROM usuario WHERE login = @login;
    IF @senhaInformada = @senhaArmazenada
    BEGIN
       SET @status = 1;
       SET @mensagem = 'Senha correta';
    END
	ELSE
    BEGIN
        SET @status = 0;
        SET @mensagem = 'Senha incorreta';
    END
END;
go
---gerar senha provisoria
CREATE OR ALTER PROCEDURE spGerarSenhaProvisoria(
    @login VARCHAR(250),
    @senhaEnviada VARCHAR(250) OUTPUT
)
AS
BEGIN
    DECLARE @senhaProvisoria INT;
    SET @senhaProvisoria = ABS(CHECKSUM(NEWID())) % 100000000 + 1; ----newid gera um codigo randomico incluindo letras e numeros; checksum
    UPDATE usuario
    SET senha = CAST(@senhaProvisoria AS VARCHAR(8))
    WHERE login = @login;
    SET @senhaEnviada = 'Ol�!! Esqueceu sua senha? Recebemos uma solicita��o de altera��o de senha para sua conta. Para confirmar a altera��o de senha, acesse esse link e use a sua senha abaixo para continuar: ' + CAST(@senhaProvisoria AS VARCHAR(8));
    SELECT @senhaEnviada;
END;
EXEC spGerarSenhaProvisoria 
    @login = 'caio', 
    @senhaEnviada = @senhaEnviada OUTPUT;
SELECT @senhaEnviada;
go


---atualizar senha
CREATE OR ALTER PROCEDURE spAtualizarSenha(
	@senha VARCHAR (100),
	@usuario VARCHAR (100))
AS 
BEGIN
	UPDATE usuario
	SET senha = @senha
	WHERE login = @usuario
END;
go
EXEC spAtualizarSenha @senha = '3789', @usuario = 'caio'
go

---buscar quest�es
CREATE OR ALTER PROCEDURE spBuscarQuestoes(
@disciplina INT
)
AS
BEGIN
	SELECT TOP 5 enunciado, pontuacao, disciplina
	FROM questoes
	INNER JOIN disciplina ON id_disciplina = fk_disciplina
	WHERE fk_disciplina = @disciplina
	ORDER BY NEWID(); 
END
go
----buscar alternativas
CREATE OR ALTER PROCEDURE spBuscarAlternativas(
@questao INT
)
AS
BEGIN
	SELECT *
	FROM alternativa
	WHERE fk_questao = @questao 
END
go
---consultar ranking
CREATE OR ALTER PROCEDURE spConsultarRanking(
	@login VARCHAR (250),
	@pontuacao INT
)
AS 
BEGIN
	SELECT TOP 1 
		r.*,
		u.login,
		u.email
	FROM ranking r
	INNER JOIN usuario u ON fk_usuario = id_usuario

	UNION 

	SELECT
		r.*,
		u.login,
		u.email
	FROM ranking r
	INNER JOIN usuario u ON fk_usuario = id_usuario

	UNION

	SELECT TOP 9 
		r.*,
		u.login,
		u.email
	FROM ranking r
	INNER JOIN usuario u ON fk_usuario = id_usuario 
	WHERE pontos < @pontuacao
	ORDER BY pontos DESC
END
go
---testes
select * from usuario
INSERT INTO usuario(login, email, senha)
VALUES ('andrey', 'andey@gmail.com', '67890'),
('geovana', 'geovanna@gmail.com', '78900'),
('gustavo', 'gustavo@gmail.com', '891011'),
('jhow', 'jhow@gmail.com', '9101112'),
('gabriel', 'gabriel@gmail.com', '101112'),
('alex', 'alex@gmail.com', '111213')
