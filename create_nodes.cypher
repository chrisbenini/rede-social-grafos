// ====== USERS ======
CREATE (:User {name: "Alice"});
CREATE (:User {name: "Bob"});
CREATE (:User {name: "Carol"});
CREATE (:User {name: "Daniel"});

// ====== HASHTAGS ======
CREATE (:Hashtag {tag: "#tech"});
CREATE (:Hashtag {tag: "#games"});
CREATE (:Hashtag {tag: "#travel"});

// ====== GROUPS ======
CREATE (:Group {name: "Gamers"});
CREATE (:Group {name: "Viajantes"});

// ====== POSTS ======
CREATE (:Post {content: "Meu novo PC gamer!", likes: 0});
CREATE (:Post {content: "Visitando o Japão!", likes: 0});
CREATE (:Post {content: "Robôs estão dominando tudo!", likes: 0});

// ====== COMMENTS ======
CREATE (:Comment {text: "Muito legal!"});

