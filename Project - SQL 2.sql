-- Display all the tables and Write the queries for the followinG

USE library;
-- 1. Retrieve the book title, category, and rental price of all available books.
 
 SELECT book_title, category, rental_price 
FROM Books 
WHERE status = 'yes';

-- 2. List the employee names and their respective salaries in descending order of salary.

SELECT emp_name, salary 
FROM Employee 
ORDER BY salary DESC;

-- 3. Retrieve the book titles and the corresponding customers who have issued those books.

SELECT b.book_title, c.customer_name 
FROM Books b 
JOIN IssueStatus i ON b.isbn = i.isbn_book 
JOIN Customer c ON i.issued_cust = c.customer_id;

-- 4. Display the total count of books in each category.

SELECT category, COUNT(*) as total_books 
FROM Books 
GROUP BY category;

-- 5. Retrieve the employee names and their positions for the employees whose salaries are above Rs.50,000.

SELECT emp_name, position 
FROM Employee 
WHERE salary > 50000;

-- 6. List the customer names who registered before 2022-01-01 and have not issued any books yet

SELECT customer_name 
FROM Customer 
WHERE reg_date < '2022-01-01' 
AND customer_id NOT IN (SELECT issued_cust FROM IssueStatus);

-- 7. Display the branch numbers and the total count of employees in each branch.

SELECT b.branch_no, COUNT(*) as total_employees 
FROM Branch b 
JOIN Employee e ON b.branch_no = e.branch_no 
GROUP BY b.branch_no;

-- 8. Display the names of customers who have issued books in the month of June 2023.

SELECT c.customer_name 
FROM Customer c 
JOIN IssueStatus i ON c.customer_id = i.issued_cust 
WHERE MONTH(i.issue_date) = 6 AND YEAR(i.issue_date) = 2023;

-- 9. Retrieve book_title from book table containing history.

SELECT book_title 
FROM Books 
WHERE book_title LIKE '%history%';

-- 10. Retrieve the branch numbers along with the count of employees for branches having more than 5 employees.

SELECT b.branch_no, COUNT(*) as total_employees 
FROM Branch b 
JOIN Employee e ON b.branch_no = e.branch_no 
GROUP BY b.branch_no 
HAVING COUNT(*) > 5;

-- 11. Retrieve the names of employees who manage branches and their respective branch addresses.

SELECT e.emp_name, b.branch_address 
FROM Employee e 
JOIN Branch b ON e.emp_id = b.manager_id;

-- 12. Display the names of customers who have issued books with a rental price higher than Rs. 25.

SELECT c.customer_name 
FROM Customer c 
JOIN IssueStatus i ON c.customer_id = i.issued_cust 
JOIN Books b ON i.isbn_book = b.isbn 
WHERE b.rental_price > 25;





