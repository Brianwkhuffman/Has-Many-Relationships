DROP TABLE IF EXISTS users;
DROP TABLE IF EXISTS posts;
DROP TABLE IF EXISTS comments;

CREATE TABLE users
(
    userID SERIAL NOT NULL,
    username VARCHAR(90) NOT NULL,
    first_name VARCHAR(90) DEFAULT NULL,
    last_name VARCHAR(90) DEFAULT NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    PRIMARY KEY (userID)
);

CREATE TABLE posts
(
    postID SERIAL NOT NULL,
    title VARCHAR(180) DEFAULT NULL,
    url VARCHAR(510) DEFAULT NULL,
    content TEXT DEFAULT NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    userID int REFERENCES users(userID),
    PRIMARY KEY (postID)
);

CREATE TABLE comments
(
    commentID SERIAL NOT NULL,
    body VARCHAR(510) DEFAULT NULL,
    created_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    updated_at TIMESTAMPTZ NOT NULL DEFAULT now(),
    userID int REFERENCES users(userID),
    postID int REFERENCES posts(postID),
    PRIMARY KEY (commentID)
);