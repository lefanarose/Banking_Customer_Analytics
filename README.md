# Banking Customer Analytics SQL Project

This project models a banking system using SQL. It includes tables for customers, branches, accounts, transactions, loans, and loan payments, along with sample data to support customer and account analytics.

## Tables

- **customers** — stores customer details (name, email, phone, city, date of birth, registration date)
- **branches** — stores branch details (name, city, manager)
- **accounts** — stores account details linked to customers and branches (account type, balance, opening date, status)
- **transactions** — records transactions made on accounts (transaction type, amount, date, description)
- **loans** — stores loan details linked to customers and branches (loan type, amount, interest rate, status)
- **loan_payments** — records payments made against loans (payment date, amount, status)

## Relationships

- `accounts.customer_id` → `customers.customer_id`
- `accounts.branch_id` → `branches.branch_id`
- `transactions.account_id` → `accounts.account_id`
- `loans.customer_id` → `customers.customer_id`
- `loans.branch_id` → `branches.branch_id`
- `loan_payments.loan_id` → `loans.loan_id`

## Sample Data

The script includes sample customer records to help test queries and relationships across tables.

## Tools Used

- MySQL

## How to Use

1. Run the script in MySQL Workbench or any MySQL client.
2. It creates the `Banking_Customer_Analytics` database and all related tables.
3. Sample data is inserted automatically — run queries to explore customer, account, transaction, and loan analytics.
