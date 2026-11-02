# 🍕 Cardápio Digital Inteligente (iOS + API de Tradução)

Este é um aplicativo iOS nativo construído com SwiftUI que funciona como um cardápio digital dinâmico para restaurantes. Ele consome dados de um servidor local (Node-RED), agrupa os itens automaticamente por categoria e conta com um recurso integrado de **tradução nativa** para auxiliar turistas e clientes estrangeiros a entenderem os pratos.

## 📱 Telas e Funcionalidades

O aplicativo foi desenhado para ser prático e visualmente agradável:

### 1. Lista do Cardápio Agrupada (`ContentView.swift`)
A tela principal exibe o menu do restaurante de forma organizada.
* **Agrupamento Inteligente:** Utiliza o método `Dictionary(grouping:by:)` do Swift para pegar uma lista plana de comidas e agrupá-las automaticamente por `categoria` (ex: Pizzas, Bebidas, Sobremesas).
* **Seções Visuais:** Cada categoria vira uma `Section` no `ScrollView`, com um cabeçalho em destaque para facilitar a navegação do usuário.
* **Lógica no `.task`:** Além de buscar os dados assincronamente quando a tela abre, o código inclui um pequeno algoritmo para contar e printar no console quantos itens pertencem à categoria "Pizzas" (útil para auditoria ou debug).

### 2. Componente de Item (`ComponentView.swift`)
Um card customizado (`ZStack` + fundo `.teal.opacity(0.3)`) para exibir cada prato individualmente.
* **Imagem Assíncrona:** Baixa a foto do prato (`hdurl`) via `AsyncImage` com um fallback divertido de um "cachorro shitpost" caso a URL seja inválida.
* **Preço Formatado:** Exibe o valor do prato formatado perfeitamente para duas casas decimais (`specifier: "%.2f"`).
* **🌐 Tradução Nativa (Apple Translation):** O grande destaque do app! Um botão com o ícone `translate` abre uma *sheet* nativa do iOS traduzindo o nome do prato. Isso é feito importando o framework `Translation` e utilizando o modificador `.translationPresentation(isPresented:text:)`.

## ⚙️ Arquitetura e Comunicação de Dados

O projeto segue o rigoroso padrão **MVVM** com foco em reatividade e chamadas de rede seguras:

* **Modelo (`Comida`):** Preparado para bancos NoSQL (como CouchDB) através das propriedades `_id` e `_rev`.
* **Gerenciamento de Estado (`ViewModel`):** Utiliza `@Observable` para atualizar a UI automaticamente. Possui métodos para buscar (`fetch`) e criar (`addComida`) pratos.
* **Camada de Rede (`Service`):** Implementa chamadas REST utilizando `async/await`. 
  * Faz `GET` na rota `/pegar` para popular o cardápio.
  * Possui a estrutura pronta para fazer `POST` na rota `/criar` quando uma tela de cadastro for adicionada.

## 🛠️ Tecnologias Utilizadas

* **Linguagem:** Swift
* **Interface UI:** SwiftUI
* **Frameworks Nativos:** `Foundation`, `Translation` (Novo no iOS 17.4/18)
* **Backend Esperado:** Node-RED rodando localmente na porta 1880.

## 🚀 Como Executar e Testar

1. **Backend (Node-RED):**
   * Certifique-se de ter um fluxo no Node-RED respondendo na porta `1880`.
   * A rota `GET http://127.0.0.1:1880/pegar` deve retornar um Array JSON contendo os pratos.
2. **Executando o App iOS:**
   * Abra o projeto no **Xcode**.
   * O código atual usa a URL `127.0.0.1` (localhost). Isso funcionará perfeitamente no **Simulador do Xcode**.
   * Se for rodar em um **iPhone Físico**, lembre-se de trocar `127.0.0.1` pelo Endereço IP local do seu computador (ex: `192.168.1.15`) no arquivo `ViewModel.swift`.
3. **Testando a Tradução:**
   * No Simulador ou aparelho, toque no ícone de tradução azul (`translate`) ao lado do preço de um item. A interface nativa da Apple solicitará permissão para baixar pacotes de idioma (se necessário) e traduzirá o nome do prato na hora!
