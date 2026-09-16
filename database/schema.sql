-- ==================================================
-- KS Portfolio
-- Database Schema
-- ==================================================

CREATE DATABASE IF NOT EXISTS portfolio_db
    CHARACTER SET utf8mb4
    COLLATE utf8mb4_0900_ai_ci;

USE portfolio_db;


-- ==================================================
-- works
-- ポートフォリオ作品
-- ==================================================

CREATE TABLE IF NOT EXISTS works (

    id INT AUTO_INCREMENT PRIMARY KEY,

    title VARCHAR(100) NOT NULL,

    technologies VARCHAR(255) NOT NULL,

    description TEXT NOT NULL,

    display_order INT NOT NULL DEFAULT 0,

    created_at TIMESTAMP
        DEFAULT CURRENT_TIMESTAMP,

    image_url VARCHAR(255),

    github_url VARCHAR(255),

    demo_url VARCHAR(255),

    features TEXT,

    development_point TEXT,

    challenge TEXT,

    development_period VARCHAR(100)

);


-- ==================================================
-- work_images
-- 作品ごとのスクリーンショット
-- ==================================================

CREATE TABLE IF NOT EXISTS work_images (

    id INT AUTO_INCREMENT PRIMARY KEY,

    work_id INT NOT NULL,

    image_path VARCHAR(255) NOT NULL,

    caption VARCHAR(100),

    display_order INT NOT NULL DEFAULT 0,

    CONSTRAINT fk_work_images_work
        FOREIGN KEY (work_id)
        REFERENCES works(id)
        ON DELETE CASCADE

);