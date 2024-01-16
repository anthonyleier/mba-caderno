# MBA Fullcycle - Arquitetura Hexagonal

A Arquitetura Hexagonal, também conhecida como Ports and Adapters, é um estilo arquitetônico que visa promover a separação de preocupações em sistemas de software. Essa arquitetura é caracterizada pela disposição dos componentes em camadas concêntricas, sendo a camada de domínio (lógica de negócios) o núcleo central. Utilizando Ports, Adapters e Drivers para se conectar e se comunicar entre estruturas.

![Arquitetura Hexagonal](imagens/hexagonal.png)

## Principais termos
- Driver Actor / Primary Actors - Todos que dirigem ou utilizam os casos de uso.
- Adapters - São responsáveis por implementar as interfaces definidas pelas portas, traduzem as operações do núcleo para os formatos específicos do ambiente externo e vice-versa.
- Ports - Representam as interfaces que permitem a comunicação do núcleo com o exterior.
- Driven Actors / Secondary Actors - Todos aqueles que os casos de uso pilotam e utilizam.

## Principais conceitos
- Use Cases First! - Primeiro definir os casos de usos e as regras de negócio, o resto é adaptável.
- Dependency Inversion Principle
- Portas são de entrada ou de saída do hexágono
- Adapters se localizam entre a porta e o ator
- Portas são agrupadas por contexto
