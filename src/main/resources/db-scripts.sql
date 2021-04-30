CREATE TABLE user_account (
	id BIGINT NOT NULL,
	username VARCHAR(30) UNIQUE NOT NULL,
	password VARCHAR(128) NOT NULL,
	first_name VARCHAR(40) NOT NULL,
	last_name VARCHAR(40) NOT NULL,
	active BOOLEAN,
	CONSTRAINT pk_user PRIMARY KEY (id)
);

CREATE SEQUENCE user_account_seq INCREMENT BY 1 START WITH 1;

CREATE TABLE privilege (
    username VARCHAR(30) NOT NULL,
    privilege VARCHAR(50) NOT NULL,
    CONSTRAINT pk_privilege PRIMARY KEY (username, privilege),
    CONSTRAINT fk_privilege_username FOREIGN KEY (username) REFERENCES user_account (username)
);

CREATE TABLE task (
	id BIGINT NOT NULL,
	title VARCHAR(40) NOT NULL,
	description VARCHAR(1000),
	due_date TIMESTAMP,
	status VARCHAR(40) NOT NULL,
	priority VARCHAR(40),
	created_by BIGINT NOT NULL,
	completed_by BIGINT,
	created_date TIMESTAMP NOT NULL,
	completed_date TIMESTAMP,
	CONSTRAINT pk_task PRIMARY KEY (id),
	CONSTRAINT fk_task_created_by FOREIGN KEY (created_by) REFERENCES user_account (id),
	CONSTRAINT fk_task_completed_by FOREIGN KEY (completed_by) REFERENCES user_account (id)
);

CREATE SEQUENCE task_seq INCREMENT BY 1 START WITH 1;
