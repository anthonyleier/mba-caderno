# MBA Fullcycle - DDD com Vaughn Vernon

## Definição
- DDD é uma maneira de pensar sobre o design de modelos de software
- Uma forma de triturar conhecimento para solucionar problemas empresariais complexos com software
- Contextual, focada na linagugem natural, com ferramentas estratégicas e táticas para modelagem

## Por que usar?
- Lei de Conway
- Domain Experts deve manter um contato direto e constante para manter a visão de software correta
- Monolitos ou Microsserviços podem se tornar uma grande bola de lama caso os desenvolvedores não tenham uma visão ampla (do todo)
- Equipes com pessoas com diferentes especializações tem vantagem em desenvolvimento

## Design Estratégico
- Contexto Delimitado
    - Um modelo e todos os elementos do modelo tem relevância
    - Linguagem ubíqua
    - Contexto de linguagem de equipe
    - Contexto de modelo de equipe

## Domínios e Sub-domínios
- 1. Enterprise Scope
- 3. Problem Space Scope

## Tipos de Sub-domínios
- Se é mais importante recebe mais investimentos
- Core Domain -> Complexo -> Gold
- Supporting Subdomain -> Oferece suporte para o Core -> Silver
- Generic Subdomain -> Complexo, mas não queremos desenvolver, baixar da internet -> Bronze

## Context Mapping (Mapeamento de Contexto)
- Ele é usado para lidar com os limites de contexto entre diferentes subsistemas ou bounded contexts em um sistema distribuído ou complexo
- Garante uma compreensão clara e uma comunicação eficaz entre as equipes de desenvolvimento trabalhando em diferentes contextos
- O Context Mapping geralmente é documentado em um mapa de contexto, que visualiza as relações e acordos entre os diferentes bounded contexts.
- O mapeamento de contexto não é estático. À medida que o sistema evolui, os mapas de contexto podem ser atualizados para refletir as mudanças nos limites de contexto e nas interações entre as partes do sistema.

### Bounded Context
- Antes de aplicar o Context Mapping, é necessário identificar e definir os Bounded Contexts, que são limites lógicos onde um modelo específico é válido.

### Tipos de Mapeamento
- Conformista (Conformist): Uma equipe aceita o modelo de outro contexto sem alterações
- Anticorrupção (Anticorruption Layer): Introduz uma camada que traduz as interações entre dois contextos, evitando a corrupção de modelos
- Compartilhado Kernel (Shared Kernel): As equipes concordam em compartilhar parte de seus modelos
- Partnership (Parceria): A parceria é estabelecida quando duas equipes concordam em colaborar de maneira mais profunda do que apenas compartilhar informações
- Customer-Supplier (Cliente-Fornecedor): uma relação entre dois bounded contexts em que um é o "cliente" que consome os serviços do outro, que é o "fornecedor"
- Open-Host Service (Serviço de host aberto): Em um relacionamento de serviço aberto (Open-Host service), um bounded context atua como um "host aberto" disponibilizando serviços específicos para outros bounded contexts
- Published Language (Linguagem Ubíqua): Prática de definir e compartilhar uma linguagem ubíqua (ubiquitous language) entre os bounded contexts

## Tatical Design
- O Tactical Design, ou Design Tático, é uma parte do Domain-Driven Design (DDD) que se concentra na modelagem e na organização interna de um bounded context para atender aos requisitos específicos do domínio
- O Tactical Design é aplicado dentro de um bounded context, que é uma fronteira lógica onde um modelo específico é válido e compartilhado entre os membros da equipe
- Aggregates são uma parte fundamental do Tactical Design. Eles são grupos de entidades e objetos de valor tratados como uma unidade coesa em relação à consistência
- Tactical Design envolve a identificação de entidades e objetos de valor que representam conceitos significativos dentro do domínio. Entidades têm identidade própria, enquanto objetos de valor são imutáveis e se baseiam apenas em seus atributos
- Repositórios são responsáveis por recuperar e armazenar aggregates. Eles fornecem uma interface para acessar os dados e são projetados de acordo com as necessidades do domínio
- Services são utilizados para ações ou lógicas que não se encaixam naturalmente em entidades ou objetos de valor. Eles encapsulam comportamentos específicos do domínio
- Factories são usadas para criar instâncias complexas de aggregates ou outros objetos, encapsulando a lógica de criação
- Tactical Design incorpora o conceito de Domain Events, eventos que capturam mudanças significativas no estado do domínio. Eles são usados para comunicar mudanças entre diferentes partes do sistema
- Em situações em que há interações entre bounded contexts, pode ser necessário implementar uma camada anticorrupção para garantir que as mudanças em um contexto não impactem negativamente outro
- O Tactical Design é um processo iterativo. À medida que o entendimento do domínio evolui, a modelagem é refatorada continuamente para melhor refletir as nuances e complexidades do domínio
