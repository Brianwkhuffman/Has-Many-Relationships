-- SELECT *
-- FROM users;

-- SELECT *
-- FROM users
-- WHERE userID = 100;

-- SELECT posts.*, users.first_name, users.last_name
-- FROM posts
--     INNER JOIN users on posts.userID = users.userID
-- WHERE posts.userID = 200;

-- SELECT posts.*, users.username
-- FROM posts
--     INNER JOIN users ON posts.userID = users.userID
-- WHERE users.first_name = 'Norene' AND users.last_name = 'Schmitt';

-- SELECT username
-- FROM users
-- WHERE created_at > '2015-01-01';

-- SELECT posts.title, posts.content, users.username
-- FROM posts
--     INNER JOIN users on posts.userID = users.userID
-- WHERE users.created_at < '2015-01-01';

-- SELECT comments.*, posts.title AS "Post Title"
-- FROM comments
--     INNER JOIN posts on comments.postID = posts.postID;

-- SELECT posts.title AS post_title, posts.url AS post_url, comments.body AS comment_body
-- FROM comments
--     INNER JOIN posts on comments.postID = posts.postID
-- WHERE posts.created_at < '2015-01-01';

-- SELECT posts.title AS post_title, posts.url AS post_url, comments.body AS comment_body
-- FROM comments
--     INNER JOIN posts on comments.postID = posts.postID
-- WHERE posts.created_at > '2015-01-01';

-- SELECT posts.title AS post_title, posts.url as post_url, comments.body AS comment_body
-- FROM comments
--     INNER JOIN posts on comments.postID = posts.postID
-- WHERE comments.body LIKE '%USB%';

-- SELECT posts.title AS post_title, users.first_name, users.last_name, comments.body AS comment_body
-- FROM comments
--     INNER JOIN users on users.userID = comments.userID
--     INNER JOIN posts on posts.postID = comments.postID
-- WHERE comments.body LIKE '%matrix%';

-- SELECT users.first_name, users.last_name, comments.body AS comment_body
-- FROM comments
--     INNER JOIN users on users.userID = comments.userID
--     INNER JOIN posts on posts.postID = comments.postID
-- WHERE comments.body LIKE '%SSL%' AND posts.content LIKE '%dolorum%';

-- SELECT users.first_name AS post_author_first_name, users.last_name AS post_author_last_name, posts.title AS post_title, users.username AS comment_author_username, comments.body AS comment_body
-- FROM comments
--     INNER JOIN users on users.userID = comments.userID
--     INNER JOIN posts on posts.postID = comments.postID
-- WHERE
-- ((comments.body LIKE '%SSL%') OR (comments.body LIKE '%firewall%')) AND posts.content LIKE '%nemo%';

SELECT users.first_name AS post_author_first_name, users.last_name AS post_author_last_name, posts.title AS post_title, users2.username AS comment_author_username, comments.body AS comment_body
FROM posts
    INNER JOIN users on users.userID = posts.userID
    INNER JOIN comments on comments.postID = posts.postID
    INNER JOIN users AS users2 on users2.userID = comments.userID
WHERE
((comments.body LIKE '%SSL%') OR (comments.body LIKE '%firewall%')) AND posts.content LIKE '%nemo%';