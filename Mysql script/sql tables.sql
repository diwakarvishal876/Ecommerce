create database ecom_database;
use ecom_database;
show tables;
CREATE TABLE users (
    user_id         INT PRIMARY KEY AUTO_INCREMENT,
    full_name       VARCHAR(100) NOT NULL,
    email           VARCHAR(255) UNIQUE NOT NULL,
    phone_number    VARCHAR(15) UNIQUE,
    password_hash   VARCHAR(255) NOT NULL,
    address         TEXT,
    city            VARCHAR(100),
    state           VARCHAR(100),
    country         VARCHAR(100),
    postal_code     VARCHAR(20),
    profile_image   VARCHAR(255),  -- URL to profile picture
    user_role       ENUM('customer', 'admin', 'vendor') DEFAULT 'customer',
    is_enabled TINYINT(1) DEFAULT 0, -- 1 = Active, 0 = Inactive
    created_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
drop table users;
CREATE TABLE `authorities` (
  `user_id` INT NOT NULL unique,
  `authority` varchar(50) NOT NULL,
  UNIQUE KEY `authorities_idx_1` (`user_id`,`authority`),
  FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
drop table authorities;
select * from users;
show tables;


INSERT INTO `users` (full_name,password_hash,email,is_enabled)
VALUES 
('john','{noop}test123','john@gmail.com',1),
('mary','{noop}test123','mary@gmail.com',1),
('susan','{noop}test123','susan@gmail.com',1);

CREATE TABLE order_details (
    order_id        INT PRIMARY KEY AUTO_INCREMENT,
    user_id         INT NOT NULL,
    Item_id		INT NOT NULL,
    Item_count INT NOT NULL constraint check(Item_count>0),
    total_amount    DECIMAL(10,2) NOT NULL,
    payment_status  ENUM('pending', 'paid', 'failed', 'refunded') DEFAULT 'pending',
    order_status    ENUM('processing', 'shipped', 'delivered', 'cancelled', 'returned') DEFAULT 'processing',
    shipping_address TEXT NOT NULL,
    created_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at      TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(user_id) ON DELETE CASCADE
);
