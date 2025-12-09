# 📊 Rede Social – Banco de Dados em Grafos com Neo4j

Este projeto implementa um protótipo funcional de uma rede social utilizando o banco de dados Neo4j.  
O objetivo é demonstrar como grafos podem ser usados para analisar:

- conexões entre usuários  
- engajamento (curtidas, comentários)  
- popularidade de posts  
- hashtags e temas mais discutidos  
- formação de comunidades e interesses em comum  
- recomendações inteligentes

---

## 🧩 Modelagem do Grafo

### 🧑‍🤝‍🧑 **Nós criados:**

- **User** – representa um usuário da rede social  
- **Post** – conteúdo publicado  
- **Comment** – comentários feitos em posts  
- **Hashtag** – assuntos marcados em posts  
- **Group** – grupos e comunidades da plataforma  

---

### 🔗 **Relacionamentos utilizados:**

- `(:User)-[:FOLLOWS]->(:User)` – um usuário segue outro  
- `(:User)-[:POSTED]->(:Post)` – publicação de um post  
- `(:User)-[:LIKED]->(:Post)` – curtida  
- `(:User)-[:COMMENTED]->(:Comment)` – comentário feito  
- `(:Comment)-[:ON_POST]->(:Post)` – comentário pertence ao post  
- `(:Post)-[:HAS_HASHTAG]->(:Hashtag)` – post contém uma hashtag  
- `(:User)-[:MEMBER_OF]->(:Group)` – usuário participa de um grupo  
- `(:Group)-[:HAS_POST]->(:Post)` – grupo contém posts  

---

## 🏗 Scripts do Projeto

### 📄 `create_nodes.cypher`
Cria todos os usuários, posts, comentários, hashtags e grupos.

### 📄 `create_relationships.cypher`
Cria todas as relações de curtidas, comentários, postagens e seguidores.

### 📄 `queries.cypher`
Contém consultas para:

- usuários mais influentes  
- posts mais populares  
- hashtags mais usadas  
- recomendações de usuários  
- engajamento por tema  
- comportamento de comunidades  

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
MATCH (p:Post)<-[:LIKED]-(u:User)
RETURN p.content AS post, COUNT(u) AS likes
ORDER BY likes DESC;
```

### ⭐ Recomendar pessoas para seguir
```cypher
MATCH (me:User {name:"Alice"})-[:FOLLOWS]->(mid:User)-[:FOLLOWS]->(rec:User)
WHERE rec <> me
RETURN DISTINCT rec.name AS recomendacao;
```

✔ Tecnologias Utilizadas

Neo4j AuraDB Free
Cypher Query Language
GitHub para versionamento

📌 Objetivo do Projeto

Responder perguntas complexas sobre engajamento, influência e comunidades dentro de uma rede social utilizando grafos.

---

# ✅ **2. Conteúdo final dos arquivos `.cypher`**

## 📄 **create_nodes.cypher**
(garanta que está assim)

```cypher
CREATE (:User {name: "Alice"});
CREATE (:User {name: "Bob"});
CREATE (:User {name: "Carol"});
CREATE (:User {name: "Daniel"});

CREATE (:Hashtag {tag: "#tech"});
CREATE (:Hashtag {tag: "#games"});
CREATE (:Hashtag {tag: "#travel"});

CREATE (:Group {name: "Gamers"});
CREATE (:Group {name: "Viajantes"});

CREATE (:Post {content: "Meu novo PC gamer!", likes: 0});
CREATE (:Post {content: "Visitando o Japão!", likes: 0});
CREATE (:Post {content: "Robôs estão dominando tudo!", likes: 0});

CREATE (:Comment {text: "Muito legal!"});
