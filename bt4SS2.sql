-- =========================================
-- 1. TẠO DATABASE
-- =========================================
CREATE DATABASE IF NOT EXISTS DemoTradeOff;
USE DemoTradeOff;

-- =========================================
-- 2. TẠO BẢNG USERS (SAI THIẾT KẾ BAN ĐẦU)
-- Phone đang là INT (gây lỗi mất số 0 đầu)
-- =========================================
CREATE TABLE USERS (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    phone INT
);

-- =========================================
-- 3. INSERT DỮ LIỆU MẪU
-- (giả lập số điện thoại có số 0 đầu)
-- =========================================
INSERT INTO USERS (name, phone) VALUES
('Nguyen Van A', 0981234567),
('Tran Thi B', 0909876543),
('Le Van C', 0123456789);

-- =========================================
-- 4. KIỂM TRA LỖI (bạn sẽ thấy mất số 0)
-- =========================================
SELECT * FROM USERS;

-- =========================================
-- 5. GIẢI PHÁP: MIGRATION AN TOÀN
-- =========================================

-- 5.1 Thêm cột mới đúng chuẩn
ALTER TABLE USERS
ADD phone_new VARCHAR(15);

-- 5.2 Copy dữ liệu từ INT -> VARCHAR
UPDATE USERS
SET phone_new = CAST(phone AS CHAR);

-- =========================================
-- 6. KIỂM TRA SAU KHI COPY
-- =========================================
SELECT * FROM USERS;

-- =========================================
-- 7. DROP CỘT CŨ + ĐỔI CỘT MỚI THÀNH CHÍNH THỨC
-- =========================================
ALTER TABLE USERS DROP COLUMN phone;

ALTER TABLE USERS CHANGE phone_new phone VARCHAR(15);

-- =========================================
-- 8. KIỂM TRA CUỐI CÙNG
-- =========================================
SELECT * FROM USERS;