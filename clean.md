# MBA Fullcycle - Clean Architecture

A Clean Architecture é um conjunto de princípios e práticas de design de software que busca criar sistemas modularizados, independentes e de fácil manutenção. Proposta por Robert C. Martin, a Clean Architecture visa separar as preocupações do negócio das implementações técnicas, organizando o código em camadas concêntricas.

![Clean Architecture](imagens/clean.jpg)

## Camadas
As camadas, como Entidades, Casos de Uso, Interfaces de Usuário e Frameworks Externos, são estruturadas hierarquicamente, com a direção de dependência apontando sempre para o centro, onde residem as entidades de domínio. Essa abordagem facilita a adaptação a mudanças nos requisitos de negócio, promove a testabilidade e possibilita a substituição de componentes sem afetar a lógica central do sistema.

## Flow of Controle
Na arquitetura limpa, o controle de fluxo é estruturado de maneira que as camadas mais internas, como as Entidades e os Casos de Uso, detêm o controle, enquanto as camadas mais externas, como as Interfaces de Usuário e os Frameworks Externos, dependem dessas camadas centrais

## Principais termos
- Entities: Entidades de domínio (Regras de negócio)
- Use Case Interactors: Defini o Input e o Output e como esse processo ocorre (Regras de aplicação)
- Interface Adapters, Gateways e Presenters: Portas de entrada e saída da aplicação, mas não devem ter acoplamento com a layer acima
- Frameworks e Drivers: Acomplamento com o mundo externo

## Principais conceitos
- Data Mappers: Entidade implementadora de Gatway, envolvendo conceitos de dependências
- Humble Object Pattern: Padrão para implementar testes em dependências difícies
- Screaming Architecture: A arquitetura de plantes grita sobre os cômodos, a arquitetura de software deve fazer o mesmo
- The Dependency Rule: Acoplamento deve vir sempre da camada de fora para dentro, nunca o contrário (Inversão de Dependência)
- Application Business Rules: Regras de aplicação
- Enterprise Business Rules: Regras de negócio

![Diagrama de Classes](imagens/diagrama_classes.png)

## Clean Architecture vs Hexagonal Architecture
"Toda aplicação Clean Arch é Hexagonal, mas nem toda Hexagonal é Clean Arch. O Clean Arch define mais coisas, separa frameworks and drivers de interface adapters, separa use cases de entities, prega screaming architecture." - BRANAS, Rodrigo (2023)

- Clean Architecture impõe mais conceitos
- Screaming Architeture
- Não utilizar frameworks e bibliotecas em casos de uso, entidades de domínio e, se possível, interface adapters
- Gateway ao invés de Repository
- Presenter
- Separa "Entities" de "Usecases"
- Separa "Frameworks and Drivers" de "Interface Adapters"

## Entidades e sua relativização
- Modelo anêmico: Estruturas de dados sem profundidade, sem regras de negócio
- Relacionamento entre entidades: Entre agregados, deveria ser por ID. Entre entidades distintas, pode ser por instância
- Posso utilizar bibliotecas externas no Domain? Depende, tomar cuidado, nada muito complexo
- Entidades de domínio vs Entidades JPA: Manter extremamente isolados
- Até onde utilizar DTOs / Data Structures? Em todos os lugares que não sejam regras de negócio ou usecases

## Usecases e suas controvérsias
- Quem deve ser responsável pela criação do caso de uso?
- Qual deve ser o ciclo de vida do caso de uso?
- O caso de uso deve interagir com outros?
- Como o caso de uso deve trabalhar com múltiplos repositórios?
- Posso utilizar bibliotecas externas nos meus casos de uso?
- Casos de uso e interactores são a mesma coisa?

## DDD Patterns
- Value Objects
- Entities
- Aggregate
- Aggregate Root
- Domain Events

## Tratamento de eventos
- Domain events
    - Publish right away: Já é disparado imediatamente, não muito utilizado
    - Publish after persistence: Disparar depois de persistir
    - Publish through persistence (Job ou CDC): Disparar através de uma classe de persistência
- Domain Event Publish
- Queue Gateways
