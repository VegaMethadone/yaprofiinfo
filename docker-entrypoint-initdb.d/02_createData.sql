INSERT INTO roles (role) VALUES
('admin'),
('user'),
('partner');


INSERT INTO users (login, password, role_id, phone, mail) VALUES
('admin_user', 'adminpass', 1, '79101234567', 'admin@example.com'),
('regular_user', 'userpass', 2, '79107654321', 'user@example.com'),
('partner_user', 'partnerpass', 3, '79109876543', 'partner@example.com');


INSERT INTO payment_method (method) VALUES
('Credit Card'),
('PayPal'),
('Bank Transfer');


INSERT INTO cashback (name, description, is_partner, season, start_date, end_date) VALUES
('Winter Cashback', 'Get cashback on winter purchases', FALSE, 1, '2023-12-01 00:00:00', '2024-02-28 23:59:59'),
('Summer Cashback', 'Get cashback on summer purchases', FALSE, 2, '2024-06-01 00:00:00', '2024-08-31 23:59:59'),
('Partner Cashback', 'Special cashback for partners', TRUE, 1, '2023-12-01 00:00:00', '2024-02-28 23:59:59');


INSERT INTO season_cashback (season_name) VALUES
('Winter 2023-2024'),
('Summer 2024');


INSERT INTO transaction (user_id, payment_method, date, status) VALUES
(2, 1, '2023-12-15 14:30:00', 1),
(3, 2, '2024-01-20 10:15:00', 1),
(2, 3, '2024-07-05 18:45:00', 1);

INSERT INTO transaction_cashback (transaction_id, cashback_id) VALUES
(1, 1),
(2, 3),
(3, 2);

INSERT INTO active_cashback (user_id, cashback_id) VALUES
(2, 1),
(3, 3);

INSERT INTO rewards (user_id, transaction_id, reward_amount, reward_date) VALUES
(2, 1, 15.00, '2023-12-15 14:30:00'),
(3, 2, 20.00, '2024-01-20 10:15:00'),
(2, 3, 10.00, '2024-07-05 18:45:00');