# Videolocadora - Trabalho Final Progress OpenEdge

Sistema de controle para uma videolocadora, desenvolvido em Progress OpenEdge/ABL como trabalho final do Bootcamp de Progress OpenEdge da Católica SC em parceria com a TOTVS SC.

O projeto foi criado como um desafio prático para testar os conhecimentos adquiridos durante o bootcamp, envolvendo construção de telas no AppBuilder, manipulação de banco OpenEdge, criação de cadastros, validações entre tabelas, exportação de dados e geração de relatórios.

## Demonstração

Assista ao vídeo demonstrativo do projeto:

[https://youtu.be/qvCVLVRvGFM](https://youtu.be/qvCVLVRvGFM)

## Escopo

O sistema tem como objetivo controlar os principais processos de uma videolocadora:

- cadastro de cidades;
- cadastro de clientes;
- cadastro de filmes;
- cadastro de aluguéis;
- vínculo de filmes aos aluguéis;
- validações para evitar registros inconsistentes;
- exportação de dados em JSON e CSV;
- relatórios em TXT de clientes e aluguéis.

## Estrutura de Pastas

```text
.
├── db/
├── documents/
├── images/
├── includes/
├── prg/
│   └── procedures/
├── tmp/
├── main.p
└── README.md
```

`db/`
Contém os arquivos do banco de dados OpenEdge usado pelo sistema, incluindo o banco `videloc`.

`documents/`
Contém a documentação do trabalho final, com o enunciado e os requisitos do projeto.

`images/`
Armazena imagens utilizadas pelas telas, como o logo exibido no menu principal.

`includes/`
Pasta reservada para arquivos de include Progress, caso sejam necessários para reaproveitamento de código.

`prg/`
Contém os fontes principais do sistema, incluindo as telas `.w` criadas no AppBuilder, como menu, cidades, clientes, filmes e aluguéis.

`prg/procedures/`
Contém procedures auxiliares chamadas pelas telas, como exportações JSON/CSV, relatórios TXT e scripts de população do banco.

`tmp/`
Pasta de apoio para arquivos temporários durante o desenvolvimento.

`main.p`
Arquivo de entrada do sistema. Ele executa o menu principal.

## Como Rodar

Para executar o projeto, é necessário ter o Progress OpenEdge instalado na máquina.

1. Abra o ambiente do Progress OpenEdge.
2. Conecte o banco localizado em `db/videloc`.
3. Execute o arquivo `main.p`.

Também é possível abrir pelo AppBuilder carregando a tela principal:

```progress
RUN prg/menu.w.
```

## Observações

Os relatórios e arquivos exportados são gerados em `c:\tmp`.

As telas `.w` devem ser executadas ou compiladas em ambiente GUI do Progress/OpenEdge. Evite gerar `.r` de telas usando compilação batch, pois isso pode causar erro de ambiente de display incompatível.
