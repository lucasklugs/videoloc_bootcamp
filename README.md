# Videolocadora - Trabalho Final Progress OpenEdge

Este projeto é o trabalho final do Bootcamp de Progress OpenEdge da Católica SC junto com a TOTVS SC.

A proposta é desenvolver um sistema de Video Locadora utilizando Progress OpenEdge, servindo como um desafio para testar os conhecimentos adquiridos quanto à linguagem Progress/ABL, banco de dados OpenEdge, criação de telas, cadastros, validações e regras de negócio.

## Sobre o Projeto

O sistema tem como objetivo controlar uma videolocadora, incluindo cadastros básicos e operações relacionadas a clientes, cidades, filmes e aluguéis.

O escopo geral envolve:

- cadastro de cidades;
- cadastro de clientes;
- cadastro de filmes;
- cadastro de aluguéis;
- vínculo de filmes aos aluguéis;
- validações entre cadastros;
- exportações e relatórios conforme solicitado no desafio.

## Como Rodar

Para executar o projeto, é necessário ter o Progress OpenEdge instalado na máquina.

1. Abra o ambiente do Progress OpenEdge.
2. Conecte o banco localizado em `db/videloc`.
3. Abra o AppBuilder.
4. Carregue a tela principal `menu.w`.
5. Execute a tela pelo AppBuilder.

Também é possível executar pelo Procedure Editor, desde que o banco `videloc` esteja conectado:

```progress
RUN menu.w.
```

## Observação

O projeto ainda está em desenvolvimento. As telas, regras de negócio, relatórios e exportações serão implementados conforme o escopo do trabalho final.
