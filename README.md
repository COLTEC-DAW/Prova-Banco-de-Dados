# Avaliação Banco de Dados

Desenvolvimento de Aplicações Web -- 2018

Professor: João Eduardo Montandon

Valor: 07 pontos

Duração: 60 minutos

## Iniciativa OpenScience

A iniciativa OpenScience é um movimento autônomo que tem como objetivo ampliar a divulgação da ciência ao redor do mundo. Uma de suas propostas consiste em disponibilizar um sistema de armazenamento de artigos científicos que esteja ao alcance de qualquer pessoa.

Os idealizadores da iniciativa OpenScience estão requisitando sua ajuda!! Foi pedido a você que estruture o modelo de dados do sistema de armazenamento de artigos. O modelo de dados deve obedecer às seguintes restrições:

1. Um artigo científico é composto por:
    * Título
    * Autores
    * Resumo
    * Área de Conhecimento
    * Número de páginas
    * Conferência onde foi publicado
1. Uma conferência é composta por:
    * Nome
    * Edição
    * Local
    * Ano de realização
1. Um autor é composto por:
    * Nome
    * e-mail
    * Local de trabalho
1. Um artigo científico pode ter um ou mais autores
1. Um autor pode estar presente em um ou mais artigos
1. Um artigo pode ser publicado em apenas uma conferência
1. Uma conferência pode ter vários artigos publicados

---

Com base nas informações descritas acima, você deverá:

1. Elaborar um diagrama Entidade-Relacionamento equivalente ao modelo proposto
2. Elaborar um Diagrama de Relacionamento a partir do DER gerado