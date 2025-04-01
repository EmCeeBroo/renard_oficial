CREATE DATABASE IF NOT EXISTS api_nodejs;

USE api_nodejs;

CREATE TABLE user_status(
    User_status_id INT(11) NOT NULL AUTO_INCREMENT,
    User_status_name VARCHAR(20) NOT NULL,
    User_status_description VARCHAR(80) NOT NULL,
    Created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (User_status_id)
)

CREATE TABLE role(
    Role_id INT(11) NOT NULL AUTO_INCREMENT,
    Role_name VARCHAR(20) NOT NULL,
    Role_description VARCHAR(20) NOT NULL,
    Created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (Role_id)
)

CREATE TABLE user(
    User_id INT(11) NOT NULL AUTO_INCREMENT,
    User_user VARCHAR(60) NOT NULL,
    User_password VARCHAR(255) NOT NULL,
    User_status_fk INT(11) NOT NULL,
    Role_fk INT(11) NOT NULL,
    Created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (User_id),
    FOREIGN KEY (User_status_fk) REFERENCES user_status(User_status_id),
    FOREIGN KEY (Role_fk) REFERENCES role(Role_id)
)

CREATE TABLE document_type (
    Document_type_id int(11) NOT NULL,
    Document_type_name varchar(20) NOT NULL,
    Document_type_description varchar (80) NOT NULL,
    PRIMARY KEY (Document_type_id)
)

CREATE TABLE profile (
    Profile_id int(11) NOT NULL AUTO_INCREMENT,
    Profile_name varchar(20)NOT NULL,
    Profile_last_name varchar(20)NOT NULL,
    Profile_document varchar(11)NOT NULL,
    Profile_email varchar(30)NOT NULL,
    Profile_phone varchar(11)NOT NULL,
    Profile_photo varchar(100)NOT NULL,
    Profile_address int(11)NOT NULL,
    Document_type_fk int(11)NOT NULL,
    User_fk INT(11) NOT NULL,
    Created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    Update_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (Profile_id),
    FOREIGN KEY (Document_type_fk) REFERENCES document_type(Document_type_id),
    FOREIGN KEY (User_fk) REFERENCES user(User_id)
)

CREATE TABLE api_user(
    Api_user_id INT(11) NOT NULL AUTO_INCREMENT,
    Api_user VARCHAR(60) NOT NULL,
    Api_password VARCHAR(255) NOT NULL,
    Api_role ENUM(admin, read-only) NOT NULL,
    PRIMARY KEY (Api_user_id)
)