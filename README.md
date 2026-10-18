#Bank_system SQL Project.sql

A MySQL project that analyzes banking data: customers, branches, accounts, transactions, loans, and loan payments. It covers database design, sample data, business analysis queries, and advanced SQL such as CTEs, window functions, views, and stored procedures.

## Database Schema

The database `Banking_Customer_Analytics` has 6 related tables:

| Table | Description | Sample Rows |
|-------|-------------|-------------|
| `customers` | Customer details: name, email, phone, city, date of birth, registration date | 12 |
| `branches` | Branch name, city, and manager | 6 |
| `accounts` | Customer accounts: type (Savings/Current), balance, opening date, status | 14 |
| `transactions` | Deposits and withdrawals with date, amount, and description | 32 |
| `loans` | Loan type, amount, interest rate, date, and status | 8 |
| `loan_payments` | Payments made toward each loan | 17 |

**Relationships (foreign keys):**
- `accounts.customer_id` → `customers.customer_id`
- `accounts.branch_id` → `branches.branch_id`
- `transactions.account_id` → `accounts.account_id`
- `loans.customer_id` → `customers.customer_id`
- `loans.branch_id` → `branches.branch_id`
- `loan_payments.loan_id` → `loans.loan_id`

## Analysis Covered

### 1. Data Validation
- Row counts for every table

### 2. Account Analysis
- Total and average bank balance
- Highest balance account and top 5 accounts
- Balance and account count by account type
- Accounts by status
- Customers holding multiple accounts
- Total balance by branch

### 3. Transaction Analysis
- Total deposits and withdrawals
- Transaction count and amount by type
- Monthly transaction trends
- Total deposits and withdrawals per customer
- Customers with no transactions (`LEFT JOIN`)

### 4. Loan Analysis
- Total, average, and count of loans
- Loans by type and by status
- High-value loans (above 10 lakh)
- Total loan amount by branch
- Total repaid per customer and loan
- Customers with both accounts and loans

### 5. Subqueries
- Accounts with above-average balance
- Customers with balance over 100,000
- Customers who have taken loans
- Loans above the average loan amount

### 6. Common Table Expressions (CTEs)
- Customer total balance
- Customers with balance over 200,000
- Customer total deposits
- Loan repayment summary

### 7. Window Functions
- `ROW_NUMBER()`, `RANK()`, `DENSE_RANK()` for balance ranking
- `NTILE(4)` to group accounts into quartiles
- `LAG()` and `LEAD()` for previous and next transaction amounts
- Running total with `SUM() OVER`
- Average transaction per account with `AVG() OVER`

### 8. Views
- `customer_account_view`
- `customer_balance_view`
- `customer_transaction_view`
- `customer_loan_view`
- `branch_performance_view`
- `active_accounts_view`
- `high_balance_accounts_view`
- `deposit_transactions_view`

### 9. Stored Procedures
- `GetCustomerDetails()` returns all customer details
- `GetCustomerBalance(customer_id)` returns total balance for a customer
- `GetAccountsByBranch(branch_id)` returns accounts for a branch

## SQL Concepts Used
- `CREATE DATABASE`, `CREATE TABLE`, primary keys, foreign keys, `AUTO_INCREMENT`, `UNIQUE`, `DEFAULT`
- `INSERT`, `SELECT`, `WHERE`, `ORDER BY`, `LIMIT`
- Aggregate functions: `COUNT`, `SUM`, `AVG`, `MAX`
- `GROUP BY` and `HAVING`
- `INNER JOIN`, `LEFT JOIN`, multi-table joins
- Subqueries and CTEs
- Window functions
- Views and stored procedures
- `COALESCE`, `DATE_FORMAT`

## Tools Used
- MySQL
- MySQL Workbench

## How to Run
1. Open MySQL Workbench (or any MySQL client).
2. Open `Banking_Customer_Analytics.sql`.
3. Run the script from top to bottom. It creates the database and tables, inserts sample data, and runs all the analysis queries.

## Files
- `Banking_Customer_Analytics.sql` – schema, sample data, analysis queries, views, and stored procedures

## Author
**Lefana Rose A**
GitHub: [lefanarose](https://github.com/lefanarose)
