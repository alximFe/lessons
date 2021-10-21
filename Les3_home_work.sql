-- ������� �������� �����, ����������� � �� vk, ������� ������� �� �������, 3 ����� ������� (� �������� �����, ��������� �������� � ������� ������)
USE vk;

-- �����
CREATE TABLE likes(
	id SERIAL,
	FOREIGN KEY (to_user_id) REFERENCES users (id) ON DELETE CASCADE,
	from_user_id BIGINT UNSIGNED NOT NULL,
	to_user_id BIGINT UNSIGNED NOT NULL,
	FOREIGN KEY (from_user_id) REFERENCES users (id) ON DELETE cascade,
	index(from_user_id),
	index(to_user_id));

INSERT INTO likes (from_user_id, to_user_id)
VALUES (1, 2), (1,2), (1,2);

SELECT * FROM likes;

-- ������� ���������� ������
SELECT count(*) AS likes_count FROM likes AS l WHERE l.to_user_id = 2;

-- ������
CREATE TABLE friends(
	id SERIAL,
	user_id Bigint UNSIGNED NOT NULL,
	friend_user_id Bigint UNSIGNED NOT NULL,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE,
	FOREIGN KEY (friend_user_id) REFERENCES users (id) ON DELETE CASCADE,
	index(user_id),
	index(friend_user_id));

INSERT INTO friends (user_id, friend_user_id)
VALUES (1, 2);

SELECT * FROM friends;

-- �����
CREATE TABLE board(
	id SERIAL,
	user_id Bigint UNSIGNED NOT NULL,
	created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
	media_type_id INT UNSIGNED, 
	content_id INT UNSIGNED, -- ��������� �� ������� ��������� media-������ ������������ ����
	comment text,
FOREIGN KEY (user_id) REFERENCES users (id) ON DELETE CASCADE,
FOREIGN KEY (media_type_id) REFERENCES  media_types(id),
INDEX (user_id, media_type_id, content_id));

INSERT INTO board (user_id, media_type_id, content_id,comment)
VALUES (1, 1, 1, '���������� ��������'), (1,NULL, NULL,'���� ������!');

SELECT * FROM board;






 