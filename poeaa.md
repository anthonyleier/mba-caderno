# MBA Fullcycle - SOLID e Design Patterns

## Patterns of Enterprise Application Architecture

-   Domain Logic
-   Data Source Architecture Patterns
-   Object-Relational Behavioral
-   OO Structural Patterns
-   OO Metadata Mapping Patterns
-   Web Presentation
-   Distribution Patterns
-   Offline Concurrency Patterns
-   Session State Patterns
-   Base Patterns

## Layering

-   Separação de responsabilidades
-   Abstração
-   Layer vs Tier
-   Layer -> Camada -> Separação Lógica (Application)
-   Tier -> Lugar -> Separação Física (Client, App, DB)

## 3 Layers Architecture

-   Presentation (Não possui lógica, apenas formata e mostra dados)
    -   Display Information
    -   CLI
    -   HTTP Requests
-   Domain (Muita gente chama de Application)
    -   Coração da aplicação (Resolução do problema)
    -   Regra de negócio
-   Data Source
    -   Banco de Dados
    -   Mensageria

## 3 Layers Architecture - Regra de Ouro

-   Deve ser uma regra inviolável
-   Domínio e Data Source nunca podem depender da apresentação
-   Arquitetura Hexagonal aplica alguns conceitos de 3 Layers Architecture

## Domain Logic

-   Transaction Script
-   Domain Model

## Transaction Script

-   Regras de negócio em torno de transações
-   Segue formato mais procedural
-   Simples e direto

### Exemplo: Processar pedido

-   Verifica Estoque
-   Aplica promoções
-   Fidelidade
-   Cria pedido no Banco
-   ...

### Vantagens

-   Orientado a transações
-   Totalmente direto ao ponto
-   Adequado para requisitos Simples

### Desvantagens

-   Alta complexidade quando o sistema cresce
-   Trabalha normalmente de forma síncrona
-   É comum ter duplicação de código

## Domain Model

-   Domínio de uma aplicação em "objetos de domínio"
-   Encapsula a lógica de negócios
-   Regras de negócio em primeiro lugar
-   Validações

### Vantagens

-   Clareza e expressividade
-   Flexibilidade
-   Foco na evolução
-   Alta testabilidade

### Desvantagens

-   Complexidade inicial
-   Curva de apendizado
-   Escalabilidade e Performance

## Table Module

-   Organização de tabelas do banco de dados
-   Regras de negócio segregadas por tabela
-   Alta coesão
-   Acoplamento forte com o banco de dados

### Vantagens

-   Simples
-   Fácil mapeamento
-   Simples manutenção em diversas situações
-   CRUD

### Desvantagens

-   Duplicação de código
-   Baixa reutilização
-   Baixa regra de domínio

## Service Layer

-   Camada intermediária entre a camada de aplicação e o acesso a dados
-   Expõe funcionalidades de alto nível para os "clients"
-   Encapsula a lógica de negócios
-   Orquestra a ordem das operações
-   Gerencia transações

### Vantagens

-   Separação de responsabilidades
-   Reutilização
-   Melhor estabilidade do que transaction scripts

### Desvantagens

-   Complexidade ao longo do tempo
-   Maior acoplamento
-   Complexidade no trabalho em equipe
-   Tende a trabalhar com modelos de domínio anêmicos

## Service Layer vs Transaction Script

-   Apesar de terem ideias semelhantes, possuem estruturas diferentes
-   Transactions Scripts normalmente trabalham no formato de funções para cada operação, tente a gerar muita duplicação de código
-   Service Layer tende a ser mais flexível e reutilizável

## Gateway

-   Objeto que encapsula e acessa sistemas ou recursos externos

### 2 Formas

-   Uma instância para cada linha retornada por uma consulta (Row Data Gateway)
-   Estrutura genérica de tabelas e linhas que imitam a natureza tabular de um banco (Record Set). Uma classe por tabela (In Memory Table) -> Table Data Gateway

## Table Module (Domain Logic)

-   Talvez faça sentido utilizar Row Data Gateway ou Table Data Gateway

## E sobre Domain Model?

-   Modelar o seu domínio onde o comportamento é baseado na relação entre objetos
-   Afasta a lógica do banco de dados
-   Em sistemas simples talvez, pois o domínio pode ser 1:1 com o banco

## Active Record

-   Um objeto que encapsula uma linha, tabela ou view e ainda adiciona lógica de domínio em seus dados
-   Carrega dados e comportamento
-   Lógica de domínio tende a "vazar" para o comportamento do banco de dados
-   Extremamente simples de usar
-   Frameworks que utilizam
    -   Rails
    -   Laravel
    -   Django
-   Recomendação do Wesley
    -   Separe o modelo de domínio do modelo do Active Record
    -   Cuidado: enquanto Data Table ou Row Table é acoplado no banco, o Active Record tende a ficar acoplado no domínio

## Quando não usar o Active Record

-   Domínios complexos
-   Active Record precisa de um match exato com as tabelas do banco
-   Conforme a complexidade do domínio aumenta, os objetos de domínio deixam de ser 1:1 com o banco

## Data Mapper

-   Uma camada de mapeamento move dados entre os objetos e banco de dados enquanto os mantém independentes um do outro
-   Ideal para domínios complexos
-   Domínio não fica refém da estrutura do banco de dados
-   Separe as entidades (objetos de mapeamento) do modelo de domínio
-   Dica: Nunca misturar a entidade de domínio com a entidade de Data Mapper

## Resumo

-   Domínios simples: Active Record
-   Domínios complexo: Data Mapper
-   Não há verdade absoluta

## Atomicidade

-   Como trabalhar com diversos objetos?
-   Como garantir a persistência?
-   Como realizar compensações?

## Unit of Work

-   Mantém uma lista de objetos afetados por uma transação de negócios e coordena as mudanças e os problemas de concorrência
-   Register New: Um novo objeto que foi criado durante a execução (INSERT)
-   Register Dirty: Objeto já existente que foi carregado e modificado (Memória) (UPDATE)
-   Register Clean: Objeto recuperado e não modificado
-   Register Deleted: Objeto recuperado e marcado para remoção (DELETE)
-   Commit: Persiste a transação toda no banco de dados (COMMIT)

## Identity Map

-   Garante que cada objeto é carregado apenas uma vez e o mantém em um mapa de controle. Quando há busca pelo objeto, primeiramente ela é realizada no mapa.
-   Estrutura de dados
-   Carregamento das entidades em memória
-   Garante o carregamento apenas uma vez
-   Melhora a performance e remove inconsistências
-   Mantém o controle dos objetos que foram criados, modificados ou marcados para remoção para ser utilizado em conjunto com o Unit of Work

## Lazy Load

-   Objeto "fake" enquanto os dados não são utilizados realmente, exemplo: Pedidos de um Usuário
-   Objeto que não possui todos os dados que você talvez precise, mas sabe onde buscá-lo
-   Carrega os objetos somente quando necessário
-   No carregamento inicial ao invés de ter dados reais, esses dados são substituídos por proxies (apenas representações do objeto real, sem dados)
-   Quando os dados relacionados são acessados, o proxy carrega os dados do banco
-   Cuidado enorme com N+1 (Cuidado para não consultar um de cada vez)

## Repository

-   Mediação entre a camada de domínio e a camada de dados usando uma interface para acessar os objetos de domínio.
-   É de domínio, não de aplicação
-   Mediação entre os objetos de domínio e o data mapper
-   Recebe objetos de domínio atendendo uma especificação
-   Retorna objetos de domínio (Cliente, Usuário)
-   Normalmente faz diferentes combinação de especificações gerando o SQL desejado para atender um critério
-   Promove o padrão Specification
