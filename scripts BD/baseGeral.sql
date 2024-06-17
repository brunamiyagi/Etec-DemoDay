---criando database
create database  quiz;
go
use quiz;
go

---limitando tempo de requisição
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
---adicionanando coluna de descrição
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
('Administração'),
('Comércio Exterior'),
('Design de Interiores'),
('Eletrônica'),
('Secretariado'),
('Serviços Jurídicos'),
('Ensino Médio - Administração'),
('Ensino Médio - Desenvolvimento de Sistemas'),
('Ensino Médio - Design Gráfico'),
('Ensino Médio - Eletrônica'),
('Ensino Médio - Eventos'),
('Ensino Médio - Informática para internet'),
('Ensino Médio - Serviços Jurídicos')
go
INSERT INTO disciplina(disciplina, fk_curso, descricaoDisciplina, modulo)
VALUES ('Inglês Instrumental', 1, 'Compreender e interpretar textos em inglês voltado para o mundo da tecnologia', 1),
('Programação e Algoritmos', 1, 'Estuda a implementação de algoritmos em linguagem de programação, utilizando ambientes de desenvolvimento', 1),
('Banco de Dados I', 1, 'Estudar modelagem banco de dados, criação de modelos conceituais e lógicos',1),
('Ética e Cidadania Organizacional', 1, 'Foca na compreenção da melhor maneira de atuação profissional de acordo com princípios éticos', 1),
('Design Digital', 1, 'Desenvolver elementos gráficos para aplicativos e sites.', 1),
 ('Programação Web I', 1, 'Desenvolver sites para Web, utilizando HTML5 e CSS3 e introdução ao JavaScript', 1),
('Fundamentos da Informática', 1, 'Compreender o funcionamento computadores, bem como entender hardware e software', 1),
('Operação de Software Aplicativo', 1, 'Compreender o funcionamento de programas utilizados para aplicações dentro do sistema operacional, como Word, Excel e PowerPoint', 1),
('Análise e Projeto de Sistemas', 1, ' Compreender o planejamento e desenvolvimento de sistemas de informação para solução de problemas de negócios.', 2),
('Desenvolvimento de Sistemas ', 1, 'Analisar e projetar sistemas de informação, utilizando C# e ambientes
de desenvolvimento de acordo com as especificidades do projeto.', 2),
('Banco de Dados II', 1, 'Entender a construção banco de dados relacional utilizando
o Sistema Gerenciador de banco de dados, SQLServer', 2),
('Sistemas Embarcados', 1, 'Desenvolver aplicações utilizando microcontroladores, arduíno e ambiente de programção', 2),
('Programação de Aplicativos Mobile I', 1, 'Projetar aplicativos mobile, utilizando IONIC Framework', 2),
('Programação Web II', 1, ' Desenvolver websites utilizando
Javascript para o Front e Back End',2),
('Planejamento do Trabalho de Conclusão de Curso (TCC) em Desenvolvimento de Sistemas', 1, 'Planejar e desenvolver uma solução fazendo uso dos conhecimentos adquiridos ao longo do curso',2),
('Segurança de Sistemas de Informação', 1, 'Desenvolver soluções de segurança dos
dados na elaboração de sistemas e aplicações.', 3),
('Banco de Dados III', 1, 'Otimizar a linguagem de consulta estruturada
como forma de informação relevante para a
tomada de decisão.', 3),
('Internet e protocolos', 1, 'Configurar os principais serviços de redes de
comunicação de dados e internet para o
desenvolvimento de sistemas.',3),
('Programação de Aplicativos Mobile II', 1, 'Projetar aplicativos, selecionando linguagens de
programação e ambientes de desenvolvimento e, ainda, consumir dados de APIs',3),
('Programação Web III', 1, 'Desenvolver sistemas multicamadas
utilizando framework de desenvolvimento web e desenvolver serviços de integração entre aplicações',3),
('Linguagem, Trabalho e Tecnologia', 1, 'Foca no estudo da comunicação em língua portuguesa, utilizando o vocabulário técnico da área e elaborar registros
e planilhas de acompanhamento e controle de atividades.',3),
('Desenvolvimento de Sistemas II', 1, 'Analisar e projetar sistemas de informação, selecionando linguagens de programação e ambientes
de desenvolvimento de acordo com as especificidades do projeto.', 3),
('Desenvolvimento do Trabalho de Conclusão de Curso (TCC) em Desenvolvimento de Sistemas', 1, 'Planejar as fases de execução de projetos
com base na natureza e na complexidade das
atividades.', 3)
go

INSERT INTO questoes(enunciado, pontuacao, fk_disciplina)
VALUES ('HTML é uma linguagem de programação?', '1', 1),
('O que é um framework?', '3', 1),
('O que é gestalt?', '4', 1),
('Qual a diferença entre ética e moral?', '2', 1),
('O que são threads?', '4', 1),
('O que é algoritmo?','1',1),
('Qual é a complexidade de tempo de um algoritmo com uma complexidade O(n^2)?','4',1),
('Qual é a principal diferença entre um algoritmo de busca em largura (BFS) e um algoritmo de busca em profundidade (DFS)?','5',1),
('Qual é a estrutura de dados fundamental usada em uma fila?','5',1),
('O que é a técnica de "dividir para conquistar" em algoritmos?','5',1),
('Qual das alternativas abaixo apresenta uma característica essencial do inglês instrumental?','1',1),
('Ao ler um texto em inglês instrumental, qual estratégia é mais eficaz para uma compreensão geral do conteúdo?','2',1),
('Qual dos recursos abaixo é mais útil para o desenvolvimento da vocabulário técnico em inglês instrumental?','2',1),
('Ao escrever um email formal em inglês instrumental, qual aspecto deve receber mais atenção?','3',1),
('O que é um computador?','1',1),
('Qual das alternativas a seguir não é um tipo de software?','2',1),
('Qual dos recursos abaixo é mais útil para o desenvolvimento da vocabulário técnico em inglês instrumental?','2',1),
('Ao escrever um email formal em inglês instrumental, qual aspecto deve receber mais atenção?','2',1),
('Qual das alternativas abaixo apresenta um exemplo de material útil para o aprendizado de inglês instrumental?','1',1),
('Qual dos tipos de ataque visa explorar falhas em softwares para obter acesso não autorizado a sistemas e dados?','4',3),
('Qual das medidas a seguir é mais eficaz para proteger senhas contra acesso não autorizado?','4',3),
('Qual das ferramentas a seguir é utilizada para criptografar dados e protegê-los contra acesso não autorizado?','3',3),
('Qual das práticas a seguir é crucial para garantir a segurança de redes de computadores?','3',3),
('Qual dos tipos de malware tem como objetivo danificar ou corromper sistemas e dados?','2',3),
('Qual linguagem de marcação é utilizada para definir a estrutura e o conteúdo de páginas da web?','1',1),
('Qual tecnologia é utilizada para estilizar a aparência de páginas da web?','1',1),
('Qual linguagem de script é utilizada para adicionar interatividade e comportamento dinâmico a páginas da web?','1',1),
('Qual ferramenta é utilizada para gerenciar e visualizar o código-fonte de páginas da web?','3',1),
('Qual tecnologia é utilizada para criar páginas da web dinâmicas e interativas com acesso a dados em um servidor?','3',1),
('Qual componente do sistema de gerenciamento de banco de dados (SGBD) é responsável por armazenar os dados?','1',2),
('Qual linguagem é utilizada para interagir com o banco de dados e manipular os dados armazenados?','1',2),
('Qual estrutura de dados é utilizada para organizar os dados em um banco de dados relacional?','3',2),
('Qual tipo de dado é utilizado para armazenar texto em um banco de dados?','2',2),
('Qual chave é utilizada para identificar de forma única cada registro em uma tabela de banco de dados?','2',2),
('Qual estrutura de dados é utilizada para armazenar uma sequência ordenada de elementos?','1',1),
('Qual das alternativas abaixo é um exemplo de tecnologia front-end utilizada para construir interfaces web?','1',1),
('Qual estrutura de dados é utilizada para armazenar elementos em uma ordem de "último a entrar, primeiro a sair"?','4',1),
('Qual estrutura de dados é utilizada para armazenar elementos em uma ordem de "primeiro a entrar, primeiro a sair"?','5',1),
('Qual tipo de algoritmo é utilizado para encontrar o menor caminho entre dois pontos em um grafo?','5',1),
('Na metodologia de desenvolvimento de software conhecida como "Modelagem Orientada a Objetos", qual é o objetivo principal do diagrama de sequência?','4',2),
('No contexto de Análise e Projeto de Sistemas, qual é a principal diferença entre "acoplamento" e "coesão"?','3',2),
('Qual é a principal função do diagrama de atividades em Análise e Projeto de Sistemas?','1',2),
('No contexto de Análise e Projeto de Sistemas, o que é um "padrão de projeto"?','2',2),
('Qual é a principal diferença entre a abordagem de desenvolvimento "top-down" e "bottom-up"?','3',2),
('O que é um ataque de negação de serviço distribuído (DDoS)?','2',3),
('O que é criptografia de chave pública?','2',3),
('O que é engenharia social em termos de segurança de sistemas de informação?','3',3),
('Qual é a principal diferença entre autenticação e autorização em um sistema de informação?','',3),
('O que é um ataque de injeção SQL e como ele pode ser mitigado?','4',3),
('Qual dos seguintes não é um framework de desenvolvimento web front-end? ','3',1),
('Qual dos seguintes não é um mètodo HTTP utilizado em aplicações web?','3',1),
('O que significa a sigla "URL" em uma aplicação web? ','2',1),
('Qual é a forma correta do verbo no passado simples para o pronome pessoal "I" (eu) na frase "I (go) to the store yesterday"?','2',1),
('Qual é o significado da expressão idiomática "to hit the nail on the head" em inglês?','3',1),
('Qual é o antônimo da palavra "happy" em inglês?','2',1),
('Qual é o termo em inglês para "incêndio florestal"?','1',1),
('Qual é a forma no particípio passado do verbo "to eat" em inglês?','2',1),
('Qual é o princípio ético que defende agir sempre de forma a promover o maior bem-estar para o maior número de pessoas?','3',1),
('Qual é o conceito ético que preconiza que devemos tratar os outros como gostaríamos de ser tratados?','2',1),
('O que significa "confidencialidade" do ponto de vista ético?','2',1),
('Qual é o conceito ético que se baseia na ideia de que algumas ações são intrinsecamente erradas, independentemente de suas consequências?','3',1),
('O que é um conflito de interesses do ponto de vista ético?','3',1),
('Qual dos seguintes não é um sistema operacional?','2',1),
('O que significa a sigla "CPU"?','1',1),
('Qual é a unidade básica de armazenamento de dados em um computador?','2',1),
('O que é um URL?','2',1),
('Qual é a função do software antivírus?','2',1),
('Enunciado: Qual dos seguintes não é um software de design gráfico?','2',1),
('O que é UI design?','2',1),
('Qual é o objetivo principal do design responsivo?','3',1),
('O que é tipografia?','2',1),
('Qual é o principal objetivo do wireframe em design de interface do usuário (UI)?','3',1),
('Qual dos seguintes não é um framework de desenvolvimento web front-end?','2',1),
('Qual dos seguintes é um método HTTP usado para enviar dados de um formulário HTML para o servidor?','2',1),
('O que significa "CSS" em programação web?','1',1),
('Qual é a função do JavaScript em uma página web?','2',1),
('Qual linguagem é usada para estilizar o layout de uma página web?','2',2),
('Qual é a função do protocolo HTTP em uma aplicação web?','3',2),
('Qual dos seguintes não é um framework de desenvolvimento web em JavaScript?','2',2),
('O que significa "DOM" em programação web?','3',2),
('Qual é o método HTTP padrão usado quando um formulário HTML é enviado?','2',2),
('Qual aplicativo do Pacote Office é usado principalmente para criar apresentações de slides?','2',1),
('Qual ferramenta do Microsoft Excel é usada para realizar cálculos complexos e análise de dados?','3',1),
('Qual recurso do Microsoft Word permite que você crie documentos com formatação profissional, como currículos e cartas?','2',1),
('Qual recurso do Microsoft Outlook permite que você agende compromissos, organize tarefas e gerencie seu calendário?','2',1),
('Qual é a função principal do Microsoft Access no Pacote Office?','3',1),
('O que é um ataque de phishing?','2',3),
('O que é criptografia?','2',3),
('Qual das seguintes opções é uma prática recomendada para proteger senhas?','2',3),
('O que é um firewall?','2',3),
('O que é engenharia social em segurança da informação?','3',3),
('Qual é o principal objetivo da normalização em um banco de dados relacional?','2',2),
('O que é um índice em banco de dados?','2',2),
('Qual é a principal característica de um banco de dados NOSQL','2',2),
('O que significa a sigla ACID em relação a transações em banco de dados?','2',2),
('Qual é a função do SGBD (Sistema de Gerenciamento de Banco de Dados)?','1',2),
('Qual é a função principal da meméria RAM?','2',1),
('O que é a nuvem e como ela funciona?','2',1),
('O que é um índice em banco de dados?','2',1),
('O que é design digital?','2',1),
('Qual dos princépios a seguir não é considerado um dos princépios básicos do design digital?','3',1),
('Qual a importância da tipografia no design digital?','2',1),
('Quais são as principais diferenças entre design gráfico e design digital?','3',1),
('Como o design digital pode contribuir para a acessibilidade de um produto digital?','2',1),
('O que é segurança da informação?','1',3),
('Qual das alternativas a seguir não é um tipo comum de ataque cibernético?','2',3),
('Qual a importância de manter o software antivírus atualizado?','2',3),
('Quais são as melhores práticas para criar senhas fortes?','3',3),
('Como a criptografia pode ser utilizada para proteger dados confidenciais?','4',3),
('O que é desenvolvimento de software?','2',2),
('Qual das alternativas a seguir não é um tipo de metodologia de desenvolvimento de software?','2',2),
('Qual a importância de utilizar um controle de versão no desenvolvimento de software?','3',2),
('Quais são as principais características de um bom software?','3',2),
('Como os testes de software podem contribuir para a qualidade do software?','4',2)


go
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Sim, porque permite a criação de aplicativos complexos.',0,1),
('b) Sim, porque pode ser compilada em código de máquina.',0,1),
('c) Não, porque é usada para estilizar páginas web.',0,1),
('d) Não, porque é uma linguagem de marcação usada para estruturar conteúdo na web.',1,1),
('e) Não, porque é uma linguagem de script para manipulação de dados.',0,1)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Uma biblioteca de funções para realizar operações matemáticas.',0,2),
('b) Um ambiente de desenvolvimento integrado (IDE).',0,2),
('c) Um conjunto de ferramentas que fornece suporte genérico para o desenvolvimento de software.',1,2),
('d) Uma linguagem de programação especéfica para criar interfaces de usuário.',0,2),
('e) Um sistema operacional projetado para servidores web.',0,2)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Um estilo de arquitetura moderna.',0,3),
('b) Um método de análise de dados em estatísticas.',0,3),
('c) Um tipo de framework de desenvolvimento de software.',0,3),
('d) Uma teoria psicológica que propôe que os seres humanos percebem padrões e configurações completas.',1,3),
('e) Um processo de fabricação de materiais compostos.',0,3)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Ética é subjetiva, enquanto moral é objetiva.',0,4),
('b) Moral é um conjunto de princípios universais, enquanto ética é um conjunto de normas pessoais.',0,4),
('c) Ética é inata, enquanto moral é aprendida.',0,4),
('d) Ética refere-se a princípios filosóficos e morais referem-se a práticas culturais e sociais.',1,4),
('e) Não há diferença entre ética e moral, são sinônimos.',0,4)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Pequenos programas que são executados de forma independente dentro de um sistema operacional.',0,5),
('b) Blocos de memória utilizados para armazenamento temporário de dados.',0,5),
('c) Conexões de rede estabelecidas entre computadores para comunicação.',0,5),
('d) Unidades básicas de execução de um processo, permitindo a execução simultânea de múltiplas tarefas.',1,5),
('e) Sequências de comandos utilizados na programação de microcontroladores.',0,5)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Um programa de computador.',0,6),
('b) Uma sequência finita de passos para resolver um problema.',1,6),
('c) Uma linguagem de programação.',0,6),
('d) Um tipo de variável.',0,6)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Linear',0,7),
('b) Quadrática',1,7),
('c) Exponencial',0,7),
('d) Logarétmica',0,7)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) O BFS usa uma pilha enquanto o DFS usa uma fila.',0,8),
('b) O BFS é recursivo enquanto o DFS é iterativo.',0,8),
('c) O BFS explora todos os vêrtices em um nível antes de passar para o próximo nível, enquanto o DFS explora o máximo possível em uma direção antes de retroceder.',1,8),
('d) O BFS é mais eficiente em termos de espaço do que o DFS.',0,8)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Pilha.',0,9),
('b) Àrvore.',0,9),
('c) Lista.',1,9),
('d) Vetor.',0,9)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Um mêtodo para realizar iterações repetitivas sobre uma lista de elementos.',0,10),
('b) Um algoritmo que usa recursão para resolver problemas menores.',0,10),
('c) Um mètodo que divide um problema em subproblemas menores, resolve cada subproblema independentemente e combina as soluções para obter a solução final.',1,10),
('d) Uma tècnica que envolve a ordenação de elementos em uma estrutura de dados.',0,10)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Ênfase na fluidez e na conversação.',0,11),
('b) Foco no desenvolvimento da escrita formal e da gramática complexa.',0,11),
('c) Aprendizagem voltada para a leitura e compreensão de textos acadêmicos e profissionais.',1,11),
('d) Priorização da tradução literal entre o português e o inglês',0,11)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Traduzir palavra por palavra para o português.',0,12),
('b) Identificar palavras-chave e expressões relevantes.',1,12),
('c) Buscar a definição de todas as palavras desconhecidas no dicionário.',0,12),
('d) Ler o texto em voz alta para melhorar a pronúncia.',0,12)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Assistir a filmes e séries em inglês sem legendas.',0,13),
('b) Ler artigos e livros em português sobre o seu campo de atuação.',0,13),
('c) Utilizar dicionários bilíngues online ou impressos.',1,13),
('d) Praticar conversação em inglês com amigos nativos.',0,13)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Utilização de gérias e expressões informais.',0,14),
('b) Clareza, concisão e organização das ideias.',1,14),
('c) Uso de vocabulário complexo e frases rebuscadas.',0,14),
('d) Regras gramaticais avançadas, como tempos verbais irregulares.',0,14)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Uma máquina de escrever eletrônica.',0,15),
('b) Um dispositivo eletrônico que manipula informações e dados.',1,15),
('c) Uma calculadora avançada.',0,15),
('d) Um aparelho de som com recursos de armazenamento.',0,15)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Sistema operacional.',0,16),
('b) Hardware.',1,16),
('c) Aplicativo.',0,16),
('d) Linguagem de programação.',0,16)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Assistir a filmes e séries em inglês sem legendas.',0,17),
('b) Ler artigos e livros em português sobre o seu campo de atuação.',0,17),
('c) Utilizar dicionários bilíngues online ou impressos.',1,17),
('d) Praticar conversação em inglês com amigos nativos.',0,17)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Utilização de gírias e expressões informais.',0,18),
('b) Clareza, concisão e organização das ideias.',1,18),
('c) Uso de vocabulário complexo e frases rebuscadas.',0,18),
('d) Regras gramaticais avançadas, como tempos verbais irregulares.',0,18)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Sites de entretenimento com jogos e atividades em inglês.',0,19),
('b) Livros didáticos de gramática inglesa para iniciantes.',0,19),
('c) Artigos científicos e notícias especializadas na sua área de atuação.',1,19),
('d) Vídeos de humoristas e canais de entretenimento no YouTube.',0,19)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Engenharia social.',0,20),
('b) Ataque de força bruta.',0,20),
('c) Injeção de SQL.',1,20),
('d) Phishing.',0,20)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a)  Usar a mesma senha para todos os sistemas e aplicativos.',0,21),
('b) Criar senhas fáceis de lembrar, como datas de nascimento ou nomes de animais de estimação.',0,21),
('c) Utilizar senhas fortes com combinações de letras maiúsculas, minúsculas, números e símbolos.',1,21),
('d) Anotar senhas em um papel ou armazená-las em um arquivo de texto no computador.',0,21)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Antivírus.',0,22),
('b) Firewall.',0,22),
('c) VPN.',0,22),
('d) Ferramenta de criptografia.',1,22)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Instalar softwares antivírus e mantê-los atualizados.',0,23),
('b) Configurar firewalls para bloquear acessos não autorizados.',0,23),
('c) Aplicar atualizações de segurança em sistemas operacionais e softwares.',0,23),
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
('d) Linguagem de programação back-end (ex: PHP, Python, Java).',1,29)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Interface do usuário.',0,30),
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
('d) Àrvores.',0,32)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Inteiro.',0,33),
('b) Decimal.',0,33),
('c) Data.',0,33),
('d) Texto (varchar, char).',1,33)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Chave primária.',1,34),
('b) Chave estrangeira.',0,34),
('c) Índice.',0,34),
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
Values('a) Mostrar a estrutura estètica de um sistema.',0,40),
('b) Representar a interação entre objetos ao longo do tempo.',1,40),
('c) Descrever a estrutura de uma base de dados.',0,40),
('d) Ilustrar a distribuição de componentes de software em uma arquitetura de sistema.',0,40)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Acoplamento refere-se à força relativa de interconexão entre módulos, enquanto coesão refere-se à consistência interna de um único módulo.',1,41),
('b) Acoplamento refere-se à consistência interna de um único módulo, enquanto coesão refere-se à força relativa de interconexão entre módulos.',0,41),
('c) Acoplamento refere-se à relação entre classes em um diagrama de classe, enquanto coesão refere-se à relação entre objetos em um diagrama de sequência.',0,41),
('d) Acoplamento refere-se à relação entre objetos em um diagrama de sequência, enquanto coesão refere-se à relação entre classes em um diagrama de classe.',0,41)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Mostrar a estrutura de classes em um sistema.',0,42),
('b) Descrever a interação entre objetos em um sistema.',0,42),
('c) Representar a sequência de atividades em um processo de negócio.',1,42),
('d) Ilustrar a estrutura de uma base de dados.',0,42)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Um modelo matemático usado para prever o desempenho de um sistema.',0,43),
('b) Um conjunto de diretrizes para escrever código legível e eficiente.',0,43),
('c) Uma solução reutilizável para um problema comum de design de software.',1,43),
('d) Um método para verificar a consistência e a integridade de uma base de dados.',0,43)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Na abordagem "top-down", o sistema é desenvolvido começando pelos componentes mais detalhados, enquanto na abordagem "bottom-up", o sistema é desenvolvido começando pelos componentes de mais alto nível.',1,44),
('b) Na abordagem "top-down", o sistema é desenvolvido iterativamente, enquanto na abordagem "bottom-up", o sistema é desenvolvido em uma única iteração.',0,44),
('c) Na abordagem "top-down", o sistema é desenvolvido em uma única iteração, enquanto na abordagem "bottom-up", o sistema é desenvolvido iterativamente.',0,44),
('d) Na abordagem "top-down", o sistema é desenvolvido sem considerar os requisitos do usu?rio, enquanto na abordagem "bottom-up", os requisitos do usuário são a principal consideração durante o desenvolvimento.',0,44)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Um ataque que impede o acesso de usuários autorizados a um sistema, inundando-o com tráfego malicioso.',1,45),
('b) Um ataque que fornece acesso não autorizado a informações confidenciais.',0,45),
('c) Um ataque que explora vulnerabilidades de software para obter controle sobre um sistema.',0,45),
('d) Um ataque que modifica dados armazenados em um banco de dados.',0,45)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Um método de criptografia onde a mesma chave é usada para criptografar e descriptografar dados.',0,46),
('b) Um método de criptografia onde chaves separadas são usadas para criptografar e descriptografar dados.',1,46),
('c) Um algoritmo de criptografia que não requer chaves.',0,46),
('d) Um método de criptografia obsoleto, substituédo por técnicas mais avançadas.',0,46)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Um método de criptografia baseado em algoritmos genéticos.',0,47),
('b) Uma abordagem para proteger sistemas de ataques cibernéticos.',0,47),
('c) Uma técnica utilizada para manipular pessoas e obter informações confidenciais.',1,47),
('d) Um protocolo de comunicação seguro usado em redes privadas.',0,47)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Autenticação verifica a identidade do usuário, enquanto autorização controla o acesso a recursos específicos.',1,48),
('b) Autenticação controla o acesso a recursos específicos, enquanto autorização verifica a identidade do usuário.',0,48),
('c) Autenticação e autorização são termos intercambiáveis e significam a mesma coisa.',0,48),
('d) Autenticação e autorização são conceitos obsoletos em segurança de sistemas de informação.',0,48)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Um ataque que injeta código malicioso em consultas SQL para obter acesso não autorizado a um banco de dados.',1,49),
('b) Um ataque que modifica a linguagem de programação de um site para exibir conteúdo malicioso.',0,49),
('c) Um ataque que envia um grande volume de solicitações para um servidor web, sobrecarregando-o.',0,49),
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
Values('a) Bater um prego na cabeça.',0,54),
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
('b) Egoísmo.',0,58),
('c) Altruísmo.',0,58),
('d) Individualismo.',0,58)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Deontologia.',0,59),
('b) Relativismo ético.',0,59),
('c) Utilitarismo.',0,59),
('d) Princípio da reciprocidade.',1,59)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Divulgar informações pessoais sem autorização.',0,60),
('b) Manter em sigilo informações confiadas a nós.',1,60),
('c) Fazer promessas que não pretendemos cumprir.',0,60),
('d) Ignorar as opiniões dos outros.',0,60)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Deontologia.',1,61),
('b) Utilitarismo.',0,61),
('c) Egoísmo.',0,61),
('d) Relativismo ético.',0,61)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Uma situação em que os interesses de uma pessoa estão alinhados com os interesses da empresa.',0,62),
('b) Uma situação em que há um choque entre os interesses pessoais e os deveres profissionais de uma pessoa.',1,62),
('c) Uma situação em que não há interesses em jogo.',0,62),
('d) Uma situação em que os interesses pessoais sempre prevalecem sobre os interesses da empresa.',0,62)
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
('b) Uma linguagem de programação.',0,66),
('c) Um endereço da web.',1,66),
('d) Um tipo de software.',0,66)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Criar novos vírus.',0,67),
('b) Proteger o computador contra vírus e malware.',1,67),
('c) Otimizar o desempenho do sistema operacional.',0,67),
('d) Acelerar a conexão com a internet.',0,67)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Phostoshop.',0,68),
('b) Illustrator.',0,68),
('c) Premiere Pro.',1,68),
('d) Sketch.',0,68)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Design de interface do usuário.',1,69),
('b) Design de interação do usuário.',0,69),
('c) Design de ícones.',0,69),
('d) Design de animações.',0,69)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Criar sites com muitos recursos interativos.',0,70),
('b) Garantir que os sites sejam visualmente atraentes.',0,70),
('c) Adaptar o layout de um site para diferentes dispositivos e tamanhos de tela.',1,70),
('d) Otimizar a velocidade de carregamento do site.',0,70)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) O estudo das cores em design.',0,71),
('b) O estudo das formas em design.',0,71),
('c) O estudo dos padrões em design.',0,71),
('d) O estudo das fontes em design.',1,71)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Criar um protótipo funcional do produto final.',0,72),
('b) Definir a estrutura e o layout de uma página ou aplicativo.',1,72),
('c) Aplicar cores e estilos visuais ao design.',0,72),
('d) Desenvolver animações interativas para o usuário.',0,72)
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
Values('a) Definir estilos e layout da página.',0,76),
('b) Controlar a interatividade e dinámica da página.',1,76),
('c) Gerenciar o servidor de banco de dados.',0,76),
('d) Estruturar o conteúdo da página.',0,76)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) HTML.',0,77),
('b) JavaScript.',0,77),
('c) Python.',0,77),
('d) CSS.',1,77)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Definir a estrutura da página.',0,78),
('b) Controlar a interatividade do usuário.',0,78),
('c) Transferir dados entre o cliente e o servidor.',1,78),
('d) Estabelecer conexões de banco de dados.',0,78)
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
('b) Calendário.',1,85),
('c) Tarefas.',0,85),
('d) Correio.',0,85)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Criar e editar documentos de texto.',0,86),
('b) Criar e gerenciar bancos de dados.',1,86),
('c) Criar apresentações de slides.',0,86),
('d) Criar planilhas e realizar cálculos.',0,86)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Um ataque que usa força bruta para quebrar senhas.',0,87),
('b) Um ataque que explora vulnerabilidades em software desatualizado.',0,87),
('c) Um ataque que visa enganar os usuários para que revelem informações pessoais ou confidenciais.',1,87),
('d) Um ataque que visa derrubar um sistema ou rede sobrecarregando-o com tráfego malicioso.',0,87)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Um tipo de vírus que se espalha por redes sem ser detectado.',0,88),
('b) Um método usado para alterar o código fonte de um programa malicioso.',0,88),
('c) O processo de transformar informações legíveis em um código ilegível para protegê-las.',1,88),
('d) Uma técnica usada para identificar e corrigir vulnerabilidades de segurança.',0,88)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Usar a mesma senha para várias contas online.',0,89),
('b) Armazenar as senhas em um arquivo de texto simples no computador.',0,89),
('c) Criar senhas longas e complexas com uma combinação de letras, números e caracteres especiais.',1,89),
('d) Compartilhar as senhas com colegas de trabalho para facilitar o acesso a sistemas compartilhados.',0,89)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Um dispositivo que protege contra ataques físicos a servidores.',0,90),
('b) Um software que detecta e remove malware de computadores.',0,90),
('c) Uma barreira de seguranéa que monitora e controla o tráfego de rede.',1,90),
('d) Uma técnica usada para ofuscar o código fonte de um programa.',0,90)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Um método para descriptografar dados protegidos.',0,91),
('b) Uma técnica para explorar vulnerabilidades de software.',0,91),
('c) Uma prática que usa manipulação psicológica para obter informações confidenciais.',1,91),
('d) Uma estratégia para identificar e corrigir falhas de segurança em sistemas de informação.',0,91)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Maximizar a redundancia de dados.',0,92),
('b) Minimizar a consistencia dos dados.',0,92),
('c) Aumentar a complexidade das consultas.',0,92),
('d) Garantir a eficiencia na recuperação e atualização dos dados.',1,92)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Um conjunto de dados não organizados.',0,93),
('b) Uma restrição que impede a inserção de dados duplicados.',0,93),
('c) Uma estrutura que melhora o desempenho das consultas ao facilitar a busca por registros.',1,93),
('d) Uma forma de armanezar dados de forma hierárquica.',0,93)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Estrutura de dados altamente normalizada .',0,94),
('b) Uso exclusivo de linguagens de consulta SQL.',0,94),
('c) Flexibilidade no esquema de dados.',1,94),
('d) Ênfase na consistencia forte em detrimento da disponibilidade.',0,94)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Adição, Criação, Integração, Deleção.',0,95),
('b) Acesso, Controle, Identificação, Durabilidade.',0,95),
('c) Atomicidade, Consistência, Isolamento, Durabilidade.',1,95),
('d) Agregação, Compressão, Interpolação, Depuração.',0,95)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Gerar relatários financeiros.',0,96),
('b) Controlar o acesso físico aos servidores de banco de dados.',0,96),
('c) Oferecer uma interface para gerenciar e manipular o banco de dados. ',1,96),
('d) Codificar os dados para garantir a segurança.',0,96)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Armazenar dados de forma permanente.',0,97),
('b) Processar instruções e realizar cálculos.',0,97),
('c) Exibir informações na tela do computador.',0,97),
('d) Armazenar o sistema operacional e outros programas em uso.',1,97)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) O HD é mais rápido e silencioso que o SSD.',0,98),
('b) O SSD é mais rápido e durável que o HD.',1,98),
('c) O HD armazena mais dados que o SSD.',0,98),
('d) O SSD é mais barato que o HD.',0,98)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) É um tipo de computador que fica na internet.',0,99),
('b) É um serviço que permite armazenar dados e arquivos online.',1,99),
('c) É uma rede de computadores interligados.',0,99),
('d) É um programa que permite acessar arquivos de outros computadores.',0,99)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) A arte de criar objetos físicos, como móveis e utensílios.',0,100),
('b) A criação de interfaces visuais para websites, aplicativos e outros produtos digitais.',1,100),
('c) A concepção e desenvolvimento de estratégias de marketing online.',0,100),
('d) A produção de conteúdo para redes sociais e mídias digitais.',0,100)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Hierarquia visual.',0,101),
('b) Clareza e objetividade.',0,101),
('c) Consistência.',0,101),
('d) Tecnologia de ponta.',1,101)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Tornar o texto mais bonito e atraente.',0,102),
('b) Facilitar a leitura do texto na tela.',0,102),
('c) Transmitir a mensagem da marca de forma eficaz.',0,102),
('d) Todas as alternativas estão corretas.',1,102)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) O design gráfico é focado em produtos físicos, enquanto o design digital é focado em produtos digitais.',1,103),
('b) O design gráfico utiliza apenas técnicas tradicionais, enquanto o design digital utiliza ferramentas digitais.',0,103),
('c) O design gráfico não precisa se preocupar com a usabilidade, enquanto o design digital precisa.',1,103),
('d) Todas as alternativas estão corretas.',0,103)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Utilizando cores vibrantes e contrastantes.',0,104),
('b) Criando interfaces complexas com muitas funcionalidades.',0,104),
('c) Utilizando imagens e vídeos de alta qualidade.',0,104),
('d) Considerando as necessidades de pessoas com diferentes tipos de deficiência.',1,104)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) A proteção de dados contra acessos não autorizados, uso indevido ou divulgação.',1,105),
('b) A utilização de softwares antivírus e firewalls para proteger computadores.',0,105),
('c) A criação de senhas fortes e complexas para todas as contas online.',0,105),
('d) A implementação de políticas de segurança para empresas e organizações.',0,105)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Malware.',0,106),
('b) Phishing.',0,106),
('c) Engenharia social. ',0,106),
('d) Backup.',1,106)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Para proteger o computador contra vírus e outros softwares maliciosos.',1,107),
('b) Para melhorar o desempenho do computador.',0,107),
('c) Para garantir a compatibilidade com outros softwares.',0,107),
('d) Para proteger o computador contra-ataques cibernéticos.',0,107)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Utilizar senhas curtas e fáceis de lembrar.',0,108),
('b) Usar a mesma senha para todas as contas.',0,108),
('c) Incluir informações pessoais nas senhas, como data de nascimento ou nome completo.',0,108),
('d) Utilizar senhas longas e complexas, com letras maiúsculas, minúsculas, números e símbolos.',1,108)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Através da utilização de softwares antivírus e firewalls.',0,109),
('b) Através da criação de senhas fortes e complexas.',0,109),
('c) Através da realização de backups regulares dos dados.',0,109),
('d) Através da conversão dos dados em um formato ilegível para pessoas não autorizadas.',1,109)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) A criação de websites e páginas da web.',0,110),
('b) A utilização de softwares para realizar tarefas especificas.',0,110),
('c) O processo de criar e implementar programas de computador.',1,110),
('d) A compra e instalação de softwares prontos para uso.',0,110)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Cascata.',0,111),
('b) Ágil.',0,111),
('c) Prototipagem.',0,111),
('d) Hardware.',1,111)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Para acelerar o processo de desenvolvimento.',0,112),
('b) Para facilitar a comunicação entre os membros da equipe.',0,112),
('c) Para rastrear as alterações feitas no código do software.',1,112),
('d) Para garantir a segurança do código do software.',0,112)
Insert into alternativa(enunciado, correta, fk_questao)
Values('a) Ser fácil de usar e intuitivo.',0,113),
('b) Ser livre de erros e bugs.',0,113),
('c) Atender as necessidades dos usuários.',0,113),
('d) Todas as alternativas estão corretas.',1,113)
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
				SET @mensagem = 'Login não encontrado. Você será direecionado para página de cadastro. ';
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
			SET @mensagem = 'Usuário cadastrado';
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
    SET @senhaEnviada = 'Olá!! Esqueceu sua senha? Recebemos uma solicitação de alteração de senha para sua conta. Para confirmar a alteração de senha, acesse esse link e use a sua senha abaixo para continuar: ' + CAST(@senhaProvisoria AS VARCHAR(8));
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

---buscar questões
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
