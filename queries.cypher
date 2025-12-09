// ====== USUÁRIOS MAIS INFLUENTES ======
MATCH (u:User)<-[:FOLLOWS]-(followers)
RETURN u.name AS usuario, COUNT(followers) AS seguidores
ORDER BY seguidores DESC;

// ====== POSTS MAIS POPULARES ======
MATCH (p:Post)<-[:LIKED]-(u:User)
RETURN p.content AS post, COUNT(u) AS likes
ORDER BY likes DESC;

// ====== HASHTAGS MAIS USADAS ======
MATCH (p:Post)-[:HAS_HASHTAG]->(h:Hashtag)
RETURN h.tag AS hashtag, COUNT(p) AS total_posts
ORDER BY total_posts DESC;

// ====== RECOMENDAR PESSOAS PARA SEGUIR ======
MATCH (me:User {name:"Alice"})-[:FOLLOWS]->(mid:User)-[:FOLLOWS]->(rec:User)
WHERE rec <> me
RETURN DISTINCT rec.name AS recomendacao;

// ====== POSTS POR GRUPO ======
MATCH (g:Group {name:"Gamers"})<-[:MEMBER_OF]-(u:User)-[:POSTED]->(p:Post)
RETURN g.name AS grupo, u.name AS autor, p.content AS post;

// ====== ENGAJAMENTO DE USUÁRIOS ======
MATCH (u:User)-[:LIKED]->(p:Post)
RETURN u.name AS usuario, COUNT(p) AS total_likes_dados
ORDER BY total_likes_dados DESC;

