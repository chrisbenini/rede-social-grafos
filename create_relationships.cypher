// ====== FOLLOW RELATIONSHIPS ======
MATCH (a:User {name: "Alice"}), (b:User {name: "Bob"})
CREATE (a)-[:FOLLOWS]->(b);

MATCH (b:User {name: "Bob"}), (c:User {name: "Carol"})
CREATE (b)-[:FOLLOWS]->(c);

MATCH (c:User {name: "Carol"}), (a:User {name: "Alice"})
CREATE (c)-[:FOLLOWS]->(a);

// ====== POSTED RELATIONSHIPS ======
MATCH (u:User {name: "Bob"}), (p:Post {content: "Meu novo PC gamer!"})
CREATE (u)-[:POSTED]->(p);

MATCH (u:User {name: "Carol"}), (p:Post {content: "Visitando o Japão!"})
CREATE (u)-[:POSTED]->(p);

MATCH (u:User {name: "Alice"}), (p:Post {content: "Robôs estão dominando tudo!"})
CREATE (u)-[:POSTED]->(p);

// ====== HASHTAGS ======
MATCH (p:Post {content: "Meu novo PC gamer!"}), (h:Hashtag {tag:"#games"})
CREATE (p)-[:HAS_HASHTAG]->(h);

MATCH (p:Post {content: "Visitando o Japão!"}), (h:Hashtag {tag:"#travel"})
CREATE (p)-[:HAS_HASHTAG]->(h);

MATCH (p:Post {content: "Robôs estão dominando tudo!"}), (h:Hashtag {tag:"#tech"})
CREATE (p)-[:HAS_HASHTAG]->(h);

// ====== LIKES ======
MATCH (u:User {name: "Alice"}), (p:Post {content: "Visitando o Japão!"})
CREATE (u)-[:LIKED]->(p);

MATCH (u:User {name: "Daniel"}), (p:Post {content: "Meu novo PC gamer!"})
CREATE (u)-[:LIKED]->(p);

// ====== COMMENTS ======
MATCH (c:Comment {text:"Muito legal!"}), (p:Post {content:"Visitando o Japão!"})
CREATE (c)-[:ON_POST]->(p);

MATCH (u:User {name:"Bob"}), (c:Comment {text:"Muito legal!"})
CREATE (u)-[:COMMENTED]->(c);

