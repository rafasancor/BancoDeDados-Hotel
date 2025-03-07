# Banco de Dados para Gerenciamento de Hotel

Este projeto consiste no desenvolvimento de um banco de dados para gerenciamento de um hotel. O banco de dados permite armazenar informações sobre clientes, reservas, ocupações, serviços adicionais e a administração do hotel. A estrutura foi projetada para garantir integridade referencial e organização eficiente dos dados.

## Tecnologias Utilizadas
- **MySQL**
- **SQL para criação e manipulação de dados**

## Estrutura do Banco de Dados
O banco de dados contém as seguintes tabelas:

- **Cliente**: Cadastro de clientes, incluindo CPF ou passaporte.
- **ClienteBrasileiro** e **ClienteEstrangeiro**: Diferenciação dos clientes por nacionalidade.
- **Telefone**: Registros de contato dos clientes.
- **Quarto**: Cadastro dos quartos disponíveis no hotel.
- **Reserva**: Armazena as reservas de clientes nos quartos.
- **Gerente**: Cadastro de gerentes responsáveis pela aprovação de reservas.
- **Aprovação**: Registra a validação de reservas pelos gerentes.
- **Ocupação**: Controle da estadia dos clientes nos quartos.
- **Restaurante** e **OcupacaoRestaurante**: Controle de visitas dos clientes aos restaurantes do hotel.
- **Frigobar** e **OcupacaoFrigobar**: Registro de consumo de itens do frigobar.
- **Massagem** e **OcupacaoMassagem**: Registro de sessões de massagem dos clientes.

## Como Executar o Projeto
1. Execute o script SQL em um ambiente compatível com MySQL.
2. O banco de dados **Hotel** será criado automaticamente.
3. As tabelas serão geradas e populadas com dados iniciais.
4. Utilize comandos SQL para consultas e operações de gerenciamento do hotel.
