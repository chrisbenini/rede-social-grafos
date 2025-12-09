<h1 align="center">📊 Rede Social – Banco de Dados em Grafos com Neo4j</h1>

<p align="center">
  <strong>Projeto de análise de interações sociais utilizando modelo de grafos</strong><br>
  Usuários • Posts • Comentários • Hashtags • Grupos • Engajamento • Comunidades
</p>

---

## 🧠 Sobre o Projeto

Uma startup de análise de mídias sociais deseja entender padrões de conexão, engajamento e comunidades formadas dentro da plataforma.  
Este projeto apresenta um protótipo funcional utilizando **Neo4j**, explorando a modelagem de relacionamentos e consultas avançadas para responder perguntas como:

- Quem são os usuários mais influentes?
- Quais posts são mais populares?
- Como hashtags agrupam comunidades?
- Como recomendar pessoas com interesses semelhantes?
- Quais grupos possuem maior atividade?

Este repositório contém toda a estrutura do grafo, scripts Cypher e consultas prontas para análise.

---

## 🧩 Modelagem do Grafo

### 🧑‍🤝‍🧑 **Nós Criados**

- **User** – representa uma pessoa na rede social  
- **Post** – conteúdo publicado  
- **Comment** – comentários em posts  
- **Hashtag** – assuntos discutidos  
- **Group** – comunidades e interesses  

### 🔗 **Relacionamentos Utilizados**

- `(:User)-[:FOLLOWS]->(:User)` – usuário segue outro usuário  
- `(:User)-[:POSTED]->(:Post)` – criação de uma postagem  
- `(:User)-[:LIKED]->(:Post)` – curtida em um post  
- `(:User)-[:COMMENTED]->(:Comment)` – fez um comentário  
- `(:Comment)-[:ON_POST]->(:Post)` – comentário pertence ao post  
- `(:Post)-[:HAS_HASHTAG]->(:Hashtag)` – marcação de hashtags  
- `(:User)-[:MEMBER_OF]->(:Group)` – usuário pertence a um grupo  
- `(:Group)-[:HAS_POST]->(:Post)` – posts dentro de grupos  

---

## 🏗 Estrutura do Projeto

### 📄 `create_nodes.cypher`
Criação de todos os nós iniciais do grafo:

- Usuários  
- Posts  
- Comentários  
- Hashtags  
- Grupos  

### 📄 `create_relationships.cypher`
Estabelece os relacionamentos entre usuários, posts, hashtags e grupos.

### 📄 `queries.cypher`
Consultas exploratórias e avançadas para análise de interação e engajamento.

---

## 🔍 Consultas de Análise

### ⭐ Usuários mais influentes
```cypher
MATCH (u:User)<-[:FOLLOWS]-(followers)
RETURN u.name AS usuario, COUNT(followers) AS seguidores
ORDER BY seguidores DESC;
```
### ⭐ Posts mais populares
```cypher
Copiar código
MATCH (p:Post)<-[:LIKED]-(u:User)
RETURN p.content AS post, COUNT(u) AS likes
ORDER BY likes DESC;]
```

### ⭐ Hashtags mais usadas
```cypher
Copiar código
MATCH (p:Post)-[:HAS_HASHTAG]->(h:Hashtag)
RETURN h.tag AS hashtag, COUNT(p) AS total_posts
ORDER BY total_posts DESC;
```

### ⭐ Recomendar pessoas para seguir (seguidores em comum)
```cypher
Copiar código
MATCH (me:User {name:"Alice"})-[:FOLLOWS]->(mid:User)-[:FOLLOWS]->(rec:User)
WHERE rec <> me
RETURN DISTINCT rec.name AS recomendacao;
```

### ⭐ Engajamento por usuário
```cypher
Copiar código
MATCH (u:User)-[:LIKED]->(p:Post)
RETURN u.name AS usuario, COUNT(p) AS total_likes_dados;
###🚀 Como Executar
Acesse o Neo4j AuraDB Free
```

### Abra o editor Cypher
```cypher
Execute create_nodes.cypher
Depois execute create_relationships.cypher
Use o arquivo queries.cypher para explorar o grafo
```

### 🛠 Tecnologias Utilizadas
```cypher
Neo4j AuraDB Free
Cypher Query Language
GitHub para versionamento
```

### 📌 Objetivo do Projeto
```cypher
Demonstrar como grafos são extremamente eficientes para entender interações sociais, identificar influenciadores, analisar comportamento de usuários e descobrir comunidades de interesse.

<h3 align="center">✨ Projeto finalizado com sucesso! ✨</h3>
```
