INSERT INTO metadata (id, date_created, date_updated) VALUES
(1, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(2, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP),
(3, CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

INSERT INTO users (metadata_id, email, password, is_new, pin, quotes, email_validation, language, profile_photo) VALUES
(1, 'adi@email.com', 'password1', true, '1234', 'Rose is red', true, 'en', 'adi.jpg'),
(2, 'budi@email.com', 'password2', false, '5678', 'Violet is purple', true, 'en', 'budi.jpg');

INSERT INTO wallets (account_number, users_id, metadata_id, name, amount, is_used) VALUES
('ACC123456', 1, 1, 'Main Wallet', 1500.00, true),
('ACC789101', 2, 2, 'Savings Wallet', 3000.00, true);

INSERT INTO pocket (user_id, metadata_id, name, amount, description) VALUES
(1, 1, 'Groceries', 200.00, 'Monthly grocery budget'),
(2, 2, 'Travel', 500.00, 'Travel to Bali');

INSERT INTO goals (user_id, metadata_id, name, amount, document) VALUES
(1, 1, 'New Laptop', 1000.00, 'laptop.pdf'),
(2, 2, 'Vacation Fund', 1500.00, 'vacation.pdf');

INSERT INTO transaction_types (id, label) VALUES
(1, 'income'),
(2, 'expense');

INSERT INTO transaction (user_id, pocket_id, metadata_id, transaction_types_id, name, amount, document, goals_id) VALUES

(1, 1, 1, 2, 'Bought groceries', 50.00, 'receipt1.pdf', NULL),
(2, 2, 2, 2, 'Flight booking', 300.00, 'receipt2.pdf', NULL),

(1, NULL, 1, 1, 'Saved for laptop', 300.00, 'goal_receipt.pdf', 1),
(2, NULL, 2, 1, 'Vacation top-up', 200.00, NULL, 2);

INSERT INTO notifications (id, user_id, metadata_id, title, description, status) VALUES
(1, 1, 1, 'Transaction Alert', 'You spent 50 on groceries.', 'queued'),
(2, 1, 1, 'Goal Progress', 'You have saved 50% toward your laptop goal.', 'read'),
(3, 2, 2, 'Transaction Alert', 'You spent 300 on travel.', 'queued');