CREATE DATABASE Banking_Customer_Analytics;
USE Banking_Customer_Analytics;
SELECT DATABASE();

CREATE TABLE customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(15),
    city VARCHAR(50),
    date_of_birth DATE,
    registration_date DATE
);

CREATE TABLE branches (
    branch_id INT PRIMARY KEY AUTO_INCREMENT,
    branch_name VARCHAR(100) NOT NULL,
    city VARCHAR(50) NOT NULL,
    manager_name VARCHAR(100)
);

CREATE TABLE accounts (
    account_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    branch_id INT NOT NULL,
    account_type VARCHAR(30) NOT NULL,
    balance DECIMAL(15,2) DEFAULT 0,
    opening_date DATE NOT NULL,
    account_status VARCHAR(20) DEFAULT 'Active',

    FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id),

    FOREIGN KEY (branch_id)
        REFERENCES branches(branch_id)
);

CREATE TABLE transactions (
    transaction_id INT PRIMARY KEY AUTO_INCREMENT,
    account_id INT NOT NULL,
    transaction_date DATE NOT NULL,
    transaction_type VARCHAR(30) NOT NULL,
    amount DECIMAL(15,2) NOT NULL,
    description VARCHAR(200),

    FOREIGN KEY (account_id)
        REFERENCES accounts(account_id)
);

CREATE TABLE loans (
    loan_id INT PRIMARY KEY AUTO_INCREMENT,
    customer_id INT NOT NULL,
    branch_id INT NOT NULL,
    loan_type VARCHAR(50) NOT NULL,
    loan_amount DECIMAL(15,2) NOT NULL,
    interest_rate DECIMAL(5,2),
    loan_date DATE NOT NULL,
    loan_status VARCHAR(30) DEFAULT 'Active',

    FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id),

    FOREIGN KEY (branch_id)
        REFERENCES branches(branch_id)
);

CREATE TABLE loan_payments (
    payment_id INT PRIMARY KEY AUTO_INCREMENT,
    loan_id INT NOT NULL,
    payment_date DATE NOT NULL,
    payment_amount DECIMAL(15,2) NOT NULL,
    payment_status VARCHAR(30) DEFAULT 'Paid',

    FOREIGN KEY (loan_id)
        REFERENCES loans(loan_id)
);

INSERT INTO customers
(customer_name, email, phone, city, date_of_birth, registration_date)
VALUES
('Arun Kumar', 'arun.kumar@gmail.com', '9876543210', 'Chennai', '1998-05-12', '2024-01-15'),
('Priya Sharma', 'priya.sharma@gmail.com', '9876543211', 'Bangalore', '1997-08-20', '2024-02-10'),
('Rahul Verma', 'rahul.verma@gmail.com', '9876543212', 'Mumbai', '1995-03-18', '2024-02-25'),
('Sneha Raj', 'sneha.raj@gmail.com', '9876543213', 'Chennai', '1999-11-05', '2024-03-12'),
('Vijay Kumar', 'vijay.kumar@gmail.com', '9876543214', 'Hyderabad', '1996-07-22', '2024-03-28'),
('Anjali Nair', 'anjali.nair@gmail.com', '9876543215', 'Kochi', '1998-01-30', '2024-04-15'),
('Karthik S', 'karthik.s@gmail.com', '9876543216', 'Chennai', '1997-06-14', '2024-05-05'),
('Divya Menon', 'divya.menon@gmail.com', '9876543217', 'Bangalore', '2000-09-10', '2024-05-20'),
('Suresh Babu', 'suresh.babu@gmail.com', '9876543218', 'Coimbatore', '1994-12-25', '2024-06-08'),
('Meena Devi', 'meena.devi@gmail.com', '9876543219', 'Madurai', '1999-04-17', '2024-06-25'),
('Naveen Raj', 'naveen.raj@gmail.com', '9876543220', 'Chennai', '1993-10-09', '2024-07-12'),
('Lakshmi Priya', 'lakshmi.priya@gmail.com', '9876543221', 'Coimbatore', '1996-02-28', '2024-08-01');

SELECT * FROM customers;

INSERT INTO branches
(branch_name, city, manager_name)
VALUES
('Chennai Main Branch', 'Chennai', 'Ramesh Kumar'),
('Bangalore Central Branch', 'Bangalore', 'Sanjay Rao'),
('Mumbai Central Branch', 'Mumbai', 'Amit Shah'),
('Hyderabad Main Branch', 'Hyderabad', 'Vikram Reddy'),
('Kochi Main Branch', 'Kochi', 'Nithin Joseph'),
('Coimbatore Branch', 'Coimbatore', 'Prakash Kumar');

SELECT * FROM branches;

INSERT INTO accounts
(customer_id, branch_id, account_type, balance, opening_date, account_status)
VALUES
(1, 1, 'Savings', 85000.00, '2024-01-20', 'Active'),
(2, 2, 'Savings', 120000.00, '2024-02-15', 'Active'),
(3, 3, 'Current', 250000.00, '2024-03-01', 'Active'),
(4, 1, 'Savings', 65000.00, '2024-03-20', 'Active'),
(5, 4, 'Savings', 95000.00, '2024-04-05', 'Active'),
(6, 5, 'Savings', 150000.00, '2024-04-20', 'Active'),
(7, 1, 'Current', 180000.00, '2024-05-10', 'Active'),
(8, 2, 'Savings', 72000.00, '2024-05-25', 'Active'),
(9, 6, 'Savings', 110000.00, '2024-06-15', 'Active'),
(10, 1, 'Savings', 55000.00, '2024-07-01', 'Active'),
(11, 1, 'Savings', 135000.00, '2024-07-20', 'Active'),
(12, 6, 'Current', 200000.00, '2024-08-10', 'Active'),
(1, 1, 'Current', 175000.00, '2024-09-05', 'Active'),
(3, 3, 'Savings', 90000.00, '2024-10-12', 'Active');

SELECT * FROM accounts;

INSERT INTO transactions
(account_id, transaction_date, transaction_type, amount, description)
VALUES
(1, '2025-01-05', 'Deposit', 50000.00, 'Salary Credit'),
(1, '2025-01-10', 'Withdrawal', 5000.00, 'ATM Withdrawal'),
(1, '2025-02-05', 'Deposit', 45000.00, 'Salary Credit'),

(2, '2025-01-15', 'Deposit', 60000.00, 'Salary Credit'),
(2, '2025-02-15', 'Withdrawal', 10000.00, 'Online Shopping'),
(2, '2025-03-15', 'Deposit', 55000.00, 'Salary Credit'),

(3, '2025-01-20', 'Deposit', 100000.00, 'Business Revenue'),
(3, '2025-02-10', 'Withdrawal', 25000.00, 'Business Expense'),
(3, '2025-03-20', 'Deposit', 125000.00, 'Business Revenue'),

(4, '2025-02-05', 'Deposit', 30000.00, 'Salary Credit'),
(4, '2025-03-05', 'Withdrawal', 5000.00, 'ATM Withdrawal'),

(5, '2025-01-25', 'Deposit', 40000.00, 'Salary Credit'),
(5, '2025-02-25', 'Withdrawal', 8000.00, 'Bill Payment'),

(6, '2025-01-10', 'Deposit', 75000.00, 'Salary Credit'),
(6, '2025-02-10', 'Deposit', 65000.00, 'Salary Credit'),
(6, '2025-03-10', 'Withdrawal', 15000.00, 'ATM Withdrawal'),

(7, '2025-01-18', 'Deposit', 90000.00, 'Business Revenue'),
(7, '2025-02-18', 'Withdrawal', 20000.00, 'Business Expense'),

(8, '2025-02-12', 'Deposit', 35000.00, 'Salary Credit'),
(8, '2025-03-12', 'Withdrawal', 7000.00, 'Online Purchase'),

(9, '2025-01-22', 'Deposit', 50000.00, 'Salary Credit'),
(9, '2025-02-22', 'Deposit', 45000.00, 'Salary Credit'),

(10, '2025-02-15', 'Deposit', 25000.00, 'Salary Credit'),
(10, '2025-03-15', 'Withdrawal', 4000.00, 'ATM Withdrawal'),

(11, '2025-01-30', 'Deposit', 55000.00, 'Salary Credit'),
(11, '2025-02-28', 'Withdrawal', 12000.00, 'Rent Payment'),

(12, '2025-01-12', 'Deposit', 80000.00, 'Business Revenue'),
(12, '2025-02-12', 'Withdrawal', 30000.00, 'Business Expense'),

(13, '2025-01-08', 'Deposit', 70000.00, 'Salary Credit'),
(13, '2025-02-08', 'Withdrawal', 10000.00, 'ATM Withdrawal'),

(14, '2025-03-01', 'Deposit', 45000.00, 'Salary Credit'),
(14, '2025-03-20', 'Withdrawal', 5000.00, 'Bill Payment');

SELECT * FROM transactions;

INSERT INTO loans
(customer_id, branch_id, loan_type, loan_amount, interest_rate, loan_date, loan_status)
VALUES
(1, 1, 'Personal Loan', 300000.00, 10.50, '2024-06-15', 'Active'),
(2, 2, 'Home Loan', 2500000.00, 8.50, '2024-07-10', 'Active'),
(3, 3, 'Business Loan', 1500000.00, 9.25, '2024-08-05', 'Active'),
(5, 4, 'Car Loan', 800000.00, 9.00, '2024-08-20', 'Active'),
(6, 5, 'Personal Loan', 400000.00, 10.75, '2024-09-15', 'Active'),
(7, 1, 'Business Loan', 2000000.00, 9.50, '2024-10-01', 'Active'),
(9, 6, 'Home Loan', 3000000.00, 8.25, '2024-10-15', 'Active'),
(11, 1, 'Car Loan', 600000.00, 9.25, '2024-11-10', 'Closed');

SELECT * FROM loans;

INSERT INTO loan_payments
(loan_id, payment_date, payment_amount, payment_status)
VALUES
(1, '2025-01-10', 25000.00, 'Paid'),
(1, '2025-02-10', 25000.00, 'Paid'),

(2, '2025-01-05', 45000.00, 'Paid'),
(2, '2025-02-05', 45000.00, 'Paid'),
(2, '2025-03-05', 45000.00, 'Paid'),

(3, '2025-01-15', 55000.00, 'Paid'),
(3, '2025-02-15', 55000.00, 'Paid'),

(4, '2025-01-20', 30000.00, 'Paid'),
(4, '2025-02-20', 30000.00, 'Paid'),

(5, '2025-01-25', 22000.00, 'Paid'),
(5, '2025-02-25', 22000.00, 'Paid'),

(6, '2025-01-10', 60000.00, 'Paid'),
(6, '2025-02-10', 60000.00, 'Paid'),

(7, '2025-01-15', 50000.00, 'Paid'),
(7, '2025-02-15', 50000.00, 'Paid'),

(8, '2025-01-20', 35000.00, 'Paid'),
(8, '2025-02-20', 35000.00, 'Paid');

SELECT * FROM loan_payments;

SELECT COUNT(*) AS total_customers FROM customers;

SELECT COUNT(*) AS total_branches FROM branches;

SELECT COUNT(*) AS total_accounts FROM accounts;

SELECT COUNT(*) AS total_transactions FROM transactions;

SELECT COUNT(*) AS total_loans FROM loans;

SELECT COUNT(*) AS total_loan_payments FROM loan_payments;

SELECT COUNT(*) AS total_customers
FROM customers;

SELECT COUNT(*) AS total_accounts
FROM accounts;

SELECT 
    SUM(balance) AS total_bank_balance
FROM accounts;

SELECT 
    AVG(balance) AS average_account_balance
FROM accounts;

SELECT
    account_id,
    customer_id,
    balance
FROM accounts
ORDER BY balance DESC
LIMIT 1;

SELECT
    account_type,
    SUM(balance) AS total_balance
FROM accounts
GROUP BY account_type
ORDER BY total_balance DESC;

SELECT
    account_type,
    COUNT(*) AS total_accounts
FROM accounts
GROUP BY account_type;

SELECT
    account_status,
    COUNT(*) AS total_accounts
FROM accounts
GROUP BY account_status;

SELECT
    SUM(amount) AS total_deposits
FROM transactions
WHERE transaction_type = 'Deposit';

SELECT
    SUM(amount) AS total_withdrawals
FROM transactions
WHERE transaction_type = 'Withdrawal';

SELECT
    transaction_type,
    COUNT(*) AS transaction_count,
    SUM(amount) AS total_amount
FROM transactions
GROUP BY transaction_type;

SELECT
    DATE_FORMAT(transaction_date, '%Y-%m') AS transaction_month,
    COUNT(*) AS total_transactions,
    SUM(amount) AS total_amount
FROM transactions
GROUP BY DATE_FORMAT(transaction_date, '%Y-%m')
ORDER BY transaction_month;

SELECT
    account_id,
    customer_id,
    account_type,
    balance
FROM accounts
ORDER BY balance DESC
LIMIT 5;

SELECT
    customer_id,
    COUNT(*) AS account_count
FROM accounts
GROUP BY customer_id
HAVING COUNT(*) > 1;

SELECT
    branch_id,
    SUM(balance) AS total_balance
FROM accounts
GROUP BY branch_id
ORDER BY total_balance DESC;

SELECT
    COUNT(*) AS total_loans,
    SUM(loan_amount) AS total_loan_amount,
    AVG(loan_amount) AS average_loan_amount
FROM loans;

SELECT
    loan_type,
    COUNT(*) AS number_of_loans,
    SUM(loan_amount) AS total_loan_amount,
    AVG(loan_amount) AS average_loan_amount
FROM loans
GROUP BY loan_type
ORDER BY total_loan_amount DESC;

SELECT
    loan_status,
    COUNT(*) AS loan_count,
    SUM(loan_amount) AS total_loan_amount
FROM loans
GROUP BY loan_status;

SELECT
    SUM(payment_amount) AS total_payments
FROM loan_payments
WHERE payment_status = 'Paid';

SELECT
    loan_id,
    customer_id,
    loan_type,
    loan_amount
FROM loans
WHERE loan_amount > 1000000
ORDER BY loan_amount DESC;

SELECT
    c.customer_id,
    c.customer_name,
    a.account_id,
    a.account_type,
    a.balance,
    a.account_status
FROM customers c
INNER JOIN accounts a
    ON c.customer_id = a.customer_id;
    
SELECT
    c.customer_name,
    a.account_id,
    a.account_type,
    b.branch_name,
    b.city
FROM customers c
INNER JOIN accounts a
    ON c.customer_id = a.customer_id
INNER JOIN branches b
    ON a.branch_id = b.branch_id;
    
SELECT
    c.customer_id,
    c.customer_name,
    SUM(a.balance) AS total_balance
FROM customers c
INNER JOIN accounts a
    ON c.customer_id = a.customer_id
GROUP BY
    c.customer_id,
    c.customer_name
ORDER BY total_balance DESC;

SELECT
    b.branch_name,
    b.city,
    SUM(a.balance) AS total_balance
FROM branches b
INNER JOIN accounts a
    ON b.branch_id = a.branch_id
GROUP BY
    b.branch_id,
    b.branch_name,
    b.city
ORDER BY total_balance DESC;

SELECT
    c.customer_name,
    a.account_id,
    t.transaction_id,
    t.transaction_date,
    t.transaction_type,
    t.amount,
    t.description
FROM customers c
INNER JOIN accounts a
    ON c.customer_id = a.customer_id
INNER JOIN transactions t
    ON a.account_id = t.account_id
ORDER BY t.transaction_date;

SELECT
    c.customer_name,
    SUM(t.amount) AS total_deposits
FROM customers c
INNER JOIN accounts a
    ON c.customer_id = a.customer_id
INNER JOIN transactions t
    ON a.account_id = t.account_id
WHERE t.transaction_type = 'Deposit'
GROUP BY
    c.customer_id,
    c.customer_name
ORDER BY total_deposits DESC;

SELECT
    c.customer_name,
    SUM(t.amount) AS total_withdrawals
FROM customers c
INNER JOIN accounts a
    ON c.customer_id = a.customer_id
INNER JOIN transactions t
    ON a.account_id = t.account_id
WHERE t.transaction_type = 'Withdrawal'
GROUP BY
    c.customer_id,
    c.customer_name
ORDER BY total_withdrawals DESC;

SELECT
    c.customer_id,
    c.customer_name
FROM customers c
LEFT JOIN accounts a
    ON c.customer_id = a.customer_id
LEFT JOIN transactions t
    ON a.account_id = t.account_id
WHERE t.transaction_id IS NULL;

SELECT
    c.customer_name,
    l.loan_id,
    l.loan_type,
    l.loan_amount,
    l.interest_rate,
    l.loan_status
FROM customers c
INNER JOIN loans l
    ON c.customer_id = l.customer_id
ORDER BY l.loan_amount DESC;

SELECT
    c.customer_name,
    a.account_id,
    a.balance,
    l.loan_id,
    l.loan_type,
    l.loan_amount
FROM customers c
INNER JOIN accounts a
    ON c.customer_id = a.customer_id
INNER JOIN loans l
    ON c.customer_id = l.customer_id
ORDER BY l.loan_amount DESC;

SELECT
    b.branch_name,
    b.city,
    SUM(l.loan_amount) AS total_loan_amount
FROM branches b
INNER JOIN loans l
    ON b.branch_id = l.branch_id
GROUP BY
    b.branch_id,
    b.branch_name,
    b.city
ORDER BY total_loan_amount DESC;

SELECT
    c.customer_name,
    l.loan_id,
    l.loan_type,
    SUM(lp.payment_amount) AS total_paid
FROM customers c
INNER JOIN loans l
    ON c.customer_id = l.customer_id
INNER JOIN loan_payments lp
    ON l.loan_id = lp.loan_id
GROUP BY
    c.customer_id,
    c.customer_name,
    l.loan_id,
    l.loan_type
ORDER BY total_paid DESC;

SELECT
    account_id,
    customer_id,
    account_type,
    balance
FROM accounts
WHERE balance > (
    SELECT AVG(balance)
    FROM accounts
)
ORDER BY balance DESC;

SELECT
    customer_id,
    customer_name
FROM customers
WHERE customer_id IN (
    SELECT customer_id
    FROM accounts
    WHERE balance > 100000
);

SELECT
    account_id,
    customer_id,
    balance
FROM accounts
WHERE balance = (
    SELECT MAX(balance)
    FROM accounts
);

SELECT
    customer_id,
    customer_name
FROM customers
WHERE customer_id IN (
    SELECT customer_id
    FROM loans
);

SELECT
    loan_id,
    customer_id,
    loan_type,
    loan_amount
FROM loans
WHERE loan_amount > (
    SELECT AVG(loan_amount)
    FROM loans
)
ORDER BY loan_amount DESC;


SELECT
    c.customer_name,
    cb.total_balance
FROM customers c
INNER JOIN customer_balance cb
    ON c.customer_id = cb.customer_id
ORDER BY cb.total_balance DESC;

WITH customer_balance AS (
    SELECT
        customer_id,
        SUM(balance) AS total_balance
    FROM accounts
    GROUP BY customer_id
)
SELECT *
FROM customer_balance;

WITH customer_balance AS (
    SELECT
        customer_id,
        SUM(balance) AS total_balance
    FROM accounts
    GROUP BY customer_id
)
SELECT
    c.customer_name,
    cb.total_balance
FROM customers c
INNER JOIN customer_balance cb
    ON c.customer_id = cb.customer_id
WHERE cb.total_balance > 200000
ORDER BY cb.total_balance DESC;

WITH customer_deposits AS (
    SELECT
        a.customer_id,
        SUM(t.amount) AS total_deposits
    FROM accounts a
    INNER JOIN transactions t
        ON a.account_id = t.account_id
    WHERE t.transaction_type = 'Deposit'
    GROUP BY a.customer_id
)
SELECT
    c.customer_name,
    cd.total_deposits
FROM customers c
INNER JOIN customer_deposits cd
    ON c.customer_id = cd.customer_id
ORDER BY cd.total_deposits DESC;

SELECT
    account_id,
    customer_id,
    account_type,
    balance
FROM accounts
WHERE balance > (
    SELECT AVG(balance)
    FROM accounts
)
ORDER BY balance DESC;

SELECT
    customer_id,
    customer_name
FROM customers
WHERE customer_id IN (
    SELECT customer_id
    FROM accounts
    WHERE balance > 100000
);

SELECT
    account_id,
    customer_id,
    balance
FROM accounts
WHERE balance = (
    SELECT MAX(balance)
    FROM accounts
);

SELECT
    customer_id,
    customer_name
FROM customers
WHERE customer_id IN (
    SELECT customer_id
    FROM loans
);

SELECT
    loan_id,
    customer_id,
    loan_type,
    loan_amount
FROM loans
WHERE loan_amount > (
    SELECT AVG(loan_amount)
    FROM loans
)
ORDER BY loan_amount DESC;

WITH customer_balance AS (
    SELECT
        customer_id,
        SUM(balance) AS total_balance
    FROM accounts
    GROUP BY customer_id
)
SELECT *
FROM customer_balance;

WITH customer_balance AS (
    SELECT
        customer_id,
        SUM(balance) AS total_balance
    FROM accounts
    GROUP BY customer_id
)
SELECT
    c.customer_name,
    cb.total_balance
FROM customers c
INNER JOIN customer_balance cb
    ON c.customer_id = cb.customer_id
WHERE cb.total_balance > 200000
ORDER BY cb.total_balance DESC;

WITH customer_deposits AS (
    SELECT
        a.customer_id,
        SUM(t.amount) AS total_deposits
    FROM accounts a
    INNER JOIN transactions t
        ON a.account_id = t.account_id
    WHERE t.transaction_type = 'Deposit'
    GROUP BY a.customer_id
)
SELECT
    c.customer_name,
    cd.total_deposits
FROM customers c
INNER JOIN customer_deposits cd
    ON c.customer_id = cd.customer_id
ORDER BY cd.total_deposits DESC;

WITH loan_payment_summary AS (
    SELECT
        loan_id,
        SUM(payment_amount) AS total_paid
    FROM loan_payments
    GROUP BY loan_id
)
SELECT
    l.loan_id,
    l.loan_type,
    l.loan_amount,
    COALESCE(lps.total_paid, 0) AS total_paid
FROM loans l
LEFT JOIN loan_payment_summary lps
    ON l.loan_id = lps.loan_id;
    
SELECT
    account_id,
    customer_id,
    account_type,
    balance,
    ROW_NUMBER() OVER (
        ORDER BY balance DESC
    ) AS row_num
FROM accounts;

SELECT
    account_id,
    customer_id,
    balance,
    RANK() OVER (
        ORDER BY balance DESC
    ) AS balance_rank
FROM accounts;

SELECT
    account_id,
    customer_id,
    balance,
    DENSE_RANK() OVER (
        ORDER BY balance DESC
    ) AS balance_rank
FROM accounts;

SELECT
    customer_id,
    total_balance,
    RANK() OVER (
        ORDER BY total_balance DESC
    ) AS customer_rank
FROM (
    SELECT
        customer_id,
        SUM(balance) AS total_balance
    FROM accounts
    GROUP BY customer_id
) AS customer_summary;

SELECT
    customer_id,
    account_id,
    account_type,
    balance,
    ROW_NUMBER() OVER (
        PARTITION BY customer_id
        ORDER BY balance DESC
    ) AS account_number
FROM accounts;

SELECT
    account_id,
    customer_id,
    balance,
    NTILE(4) OVER (
        ORDER BY balance DESC
    ) AS balance_group
FROM accounts;

SELECT
    transaction_id,
    account_id,
    transaction_date,
    transaction_type,
    amount,
    LAG(amount) OVER (
        PARTITION BY account_id
        ORDER BY transaction_date
    ) AS previous_amount
FROM transactions;

SELECT
    transaction_id,
    account_id,
    transaction_date,
    transaction_type,
    amount,
    LEAD(amount) OVER (
        PARTITION BY account_id
        ORDER BY transaction_date
    ) AS next_amount
FROM transactions;

SELECT
    transaction_id,
    account_id,
    transaction_date,
    amount,
    SUM(amount) OVER (
        PARTITION BY account_id
        ORDER BY transaction_date
    ) AS running_total
FROM transactions;

SELECT
    transaction_id,
    account_id,
    transaction_date,
    amount,
    AVG(amount) OVER (
        PARTITION BY account_id
    ) AS average_transaction_amount
FROM transactions;

CREATE VIEW customer_account_view AS
SELECT
    c.customer_id,
    c.customer_name,
    a.account_id,
    a.account_type,
    a.balance,
    a.account_status
FROM customers c
INNER JOIN accounts a
    ON c.customer_id = a.customer_id;
    
SELECT *
FROM customer_account_view;

CREATE VIEW customer_balance_view AS
SELECT
    c.customer_id,
    c.customer_name,
    SUM(a.balance) AS total_balance
FROM customers c
INNER JOIN accounts a
    ON c.customer_id = a.customer_id
GROUP BY
    c.customer_id,
    c.customer_name;
    
SELECT *
FROM customer_balance_view
ORDER BY total_balance DESC;

CREATE VIEW customer_transaction_view AS
SELECT
    c.customer_id,
    c.customer_name,
    t.transaction_id,
    t.transaction_date,
    t.transaction_type,
    t.amount,
    t.description
FROM customers c
INNER JOIN accounts a
    ON c.customer_id = a.customer_id
INNER JOIN transactions t
    ON a.account_id = t.account_id;
    
SELECT *
FROM customer_transaction_view;

CREATE VIEW customer_loan_view AS
SELECT
    c.customer_id,
    c.customer_name,
    l.loan_id,
    l.loan_type,
    l.loan_amount,
    l.interest_rate,
    l.loan_date,
    l.loan_status
FROM customers c
INNER JOIN loans l
    ON c.customer_id = l.customer_id;
    
SELECT *
FROM customer_loan_view
ORDER BY loan_amount DESC;

CREATE VIEW branch_performance_view AS
SELECT
    b.branch_id,
    b.branch_name,
    b.city,
    COUNT(DISTINCT a.account_id) AS total_accounts,
    COALESCE(SUM(a.balance), 0) AS total_balance,
    COUNT(DISTINCT l.loan_id) AS total_loans,
    COALESCE(SUM(l.loan_amount), 0) AS total_loan_amount
FROM branches b
LEFT JOIN accounts a
    ON b.branch_id = a.branch_id
LEFT JOIN loans l
    ON b.branch_id = l.branch_id
GROUP BY
    b.branch_id,
    b.branch_name,
    b.city;
    
CREATE VIEW active_accounts_view AS
SELECT
    account_id,
    customer_id,
    branch_id,
    account_type,
    balance,
    opening_date
FROM accounts
WHERE account_status = 'Active';

SELECT *
FROM active_accounts_view;

CREATE VIEW high_balance_accounts_view AS
SELECT
    account_id,
    customer_id,
    account_type,
    balance
FROM accounts
WHERE balance > 100000;

SELECT *
FROM high_balance_accounts_view
ORDER BY balance DESC;


CREATE VIEW customer_balance_view AS
SELECT
    c.customer_id,
    c.customer_name,
    SUM(a.balance) AS total_balance
FROM customers c
JOIN accounts a
    ON c.customer_id = a.customer_id
GROUP BY
    c.customer_id,
    c.customer_name;
    
SELECT *
FROM customer_balance_view
ORDER BY total_balance DESC;

DROP VIEW IF EXISTS active_accounts_view;

CREATE VIEW active_accounts_view AS
SELECT
    account_id,
    customer_id,
    branch_id,
    account_type,
    balance,
    opening_date
FROM accounts
WHERE account_status = 'Active';

SELECT *
FROM active_accounts_view;

DROP VIEW IF EXISTS high_balance_accounts_view;

CREATE VIEW high_balance_accounts_view AS
SELECT
    account_id,
    customer_id,
    account_type,
    balance
FROM accounts
WHERE balance > 100000;

SELECT *
FROM high_balance_accounts_view
ORDER BY balance DESC;

SELECT *
FROM customer_balance_view
ORDER BY total_balance DESC;



DROP VIEW IF EXISTS customer_loan_view;

CREATE VIEW customer_loan_view AS
SELECT
    c.customer_id,
    c.customer_name,
    l.loan_id,
    l.loan_type,
    l.loan_amount,
    l.interest_rate,
    l.loan_date,
    l.loan_status
FROM customers c
INNER JOIN loans l
    ON c.customer_id = l.customer_id;

SELECT *
FROM customer_loan_view
ORDER BY loan_amount DESC;



DROP VIEW IF EXISTS deposit_transactions_view;

CREATE VIEW deposit_transactions_view AS
SELECT
    t.transaction_id,
    t.account_id,
    t.transaction_date,
    t.amount,
    t.description
FROM transactions t
WHERE t.transaction_type = 'Deposit';

SELECT *
FROM deposit_transactions_view
ORDER BY transaction_date;

DELIMITER //

CREATE PROCEDURE GetCustomerDetails()
BEGIN
    SELECT
        customer_id,
        customer_name,
        email,
        phone
    FROM customers;
END //

DELIMITER ;

CALL GetCustomerDetails();

DELIMITER //

CREATE PROCEDURE GetCustomerBalance(IN p_customer_id INT)
BEGIN
    SELECT
        c.customer_id,
        c.customer_name,
        SUM(a.balance) AS total_balance
    FROM customers c
    JOIN accounts a
        ON c.customer_id = a.customer_id
    WHERE c.customer_id = p_customer_id
    GROUP BY
        c.customer_id,
        c.customer_name;
END //

DELIMITER ;


CALL GetCustomerBalance(1);


DELIMITER //

CREATE PROCEDURE GetAccountsByBranch(IN p_branch_id INT)
BEGIN
    SELECT
        a.account_id,
        a.customer_id,
        a.account_type,
        a.balance,
        a.opened_date
    FROM accounts a
    WHERE a.branch_id = p_branch_id;
END //

DELIMITER ;


CALL GetAccountsByBranch(1);

DROP PROCEDURE IF EXISTS GetAccountsByBranch;


DELIMITER //

CREATE PROCEDURE GetAccountsByBranch(IN p_branch_id INT)
BEGIN
    SELECT
        a.account_id,
        a.customer_id,
        a.account_type,
        a.balance
    FROM accounts a
    WHERE a.branch_id = p_branch_id;
END //

DELIMITER ;

CALL GetAccountsByBranch(1);