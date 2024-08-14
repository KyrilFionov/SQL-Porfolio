Table: Trips

<img width="227" alt="Screenshot 2024-08-14 at 08 55 49" src="https://github.com/user-attachments/assets/96827b61-40cd-457b-a6c0-c3c6556d7617">

id is the primary key (column with unique values) for this table.
The table holds all taxi trips. Each trip has a unique id, while client_id and driver_id are foreign keys to the users_id at the Users table.
Status is an ENUM (category) type of ('completed', 'cancelled_by_driver', 'cancelled_by_client').
 

Table: Users

<img width="230" alt="Screenshot 2024-08-14 at 08 56 37" src="https://github.com/user-attachments/assets/8a3f3374-72fd-4b6a-9302-cea77bb7369e">

users_id is the primary key (column with unique values) for this table.
The table holds all users. Each user has a unique users_id, and role is an ENUM type of ('client', 'driver', 'partner').
banned is an ENUM (category) type of ('Yes', 'No').
 


The cancellation rate is computed by dividing the number of canceled (by client or driver) requests with unbanned users by the total number of requests with unbanned users on that day.

Write a solution to find the cancellation rate of requests with unbanned users (both client and driver must not be banned) each day between "2013-10-01" and "2013-10-03". Round Cancellation Rate to two decimal points.

Return the result table in any order.

The result format is in the following example.

 

Example 1:

Input: 
Trips table:

<img width="650" alt="Screenshot 2024-08-14 at 08 57 36" src="https://github.com/user-attachments/assets/bedb2073-6297-4f5c-8ea9-015d23f2c5dd">

Output: 

<img width="294" alt="Screenshot 2024-08-14 at 08 58 38" src="https://github.com/user-attachments/assets/0a0d0fb0-b0fb-453c-9ebe-32ddfc4a72d4">

Explanation: 
On 2013-10-01:
  - There were 4 requests in total, 2 of which were canceled.
  - However, the request with Id=2 was made by a banned client (User_Id=2), so it is ignored in the calculation.
  - Hence there are 3 unbanned requests in total, 1 of which was canceled.
  - The Cancellation Rate is (1 / 3) = 0.33
On 2013-10-02:
  - There were 3 requests in total, 0 of which were canceled.
  - The request with Id=6 was made by a banned client, so it is ignored.
  - Hence there are 2 unbanned requests in total, 0 of which were canceled.
  - The Cancellation Rate is (0 / 2) = 0.00
On 2013-10-03:
  - There were 3 requests in total, 1 of which was canceled.
  - The request with Id=8 was made by a banned client, so it is ignored.
  - Hence there are 2 unbanned request in total, 1 of which were canceled.
  - The Cancellation Rate is (1 / 2) = 0.50
