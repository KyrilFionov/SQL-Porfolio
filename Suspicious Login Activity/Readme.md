A company is investigating suspicious login activity on their platform.
Consecutive failed login attempts are considered suspicious once they reach a certain threshold, and the company wants to identify users who have reached this threshold.
Their platform logs login, logout, and login failed events for each user.

For the events below, identify the users who have login failed events at least five times in a row.
Keep only the user ID and their greatest number of consecutive failed login attempts.


The output should have a row for each user who meets this criterion, with the columns:
user_id
consecutive_failures as the greatest number of consecutive failed login attempts for the user

| event_id | user_id | event_datetime         | event_type      |
|----------|---------|------------------------|-----------------|
|        1 |       1 | 2024-01-01 11:00:00.000 | login           |
|        2 |       1 | 2024-01-01 12:00:00.000 | logout          |
|        3 |       1 | 2024-01-03 03:00:00.000 | login failed    |
|        4 |       1 | 2024-01-03 03:01:00.000 | login failed    |
|        5 |       1 | 2024-01-03 03:02:00.000 | login failed    |
|        6 |       1 | 2024-01-03 03:05:00.000 | login           |
|        7 |       2 | 2024-01-03 10:00:00.000 | login           |
|        8 |       2 | 2024-01-03 15:00:00.000 | logout          |
|        9 |       1 | 2024-01-03 23:00:00.000 | logout          |
|       10 |       2 | 2024-01-04 22:00:00.000 | login failed    |
|       11 |       2 | 2024-01-04 22:05:00.000 | login           |
|       12 |       3 | 2024-01-05 20:00:00.000 | login           |
|       13 |       3 | 2024-01-06 04:00:00.000 | logout          |
|       14 |       2 | 2024-01-09 15:00:00.000 | logout          |
|       15 |       3 | 2024-01-11 21:00:00.000 | login           |
|       16 |       1 | 2024-01-12 12:00:00.000 | login failed    |
|       17 |       1 | 2024-01-12 13:00:00.000 | login failed    |
|       18 |       1 | 2024-01-12 23:00:00.000 | login failed    |
|       19 |       2 | 2024-01-13 10:00:00.000 | login failed    |
|       20 |       2 | 2024-01-13 10:05:00.000 | login           |
|       21 |       2 | 2024-01-13 15:00:00.000 | logout          |
|       22 |       1 | 2024-01-13 23:00:00.000 | login failed    |
|       23 |       1 | 2024-01-13 23:01:00.000 | login failed    |
|       24 |       1 | 2024-01-13 23:02:00.000 | login failed    |
|       25 |       2 | 2024-01-14 22:00:00.000 | login           |
|       26 |       3 | 2024-01-15 20:00:00.000 | login           |
|       27 |       3 | 2024-01-16 04:00:00.000 | logout          |
|       28 |       2 | 2024-01-19 15:00:00.000 | logout          |
|       29 |       3 | 2024-01-21 21:00:00.000 | login           |
|       30 |       1 | 2024-01-22 12:00:00.000 | login failed    |
|       31 |       1 | 2024-01-22 12:05:00.000 | password reset  |
|       32 |       1 | 2024-01-22 12:10:00.000 | login           |
|       33 |       1 | 2024-01-22 13:00:00.000 | logout          |
|       34 |       1 | 2024-01-23 03:00:00.000 | login           |
|       35 |       2 | 2024-01-23 10:00:00.000 | login           |
|       36 |       2 | 2024-01-23 15:00:00.000 | logout          |
|       37 |       1 | 2024-01-23 23:00:00.000 | logout          |
|       38 |       2 | 2024-01-24 22:00:00.000 | login           |
|       39 |       3 | 2024-01-25 20:00:00.000 | login           |
|       40 |       3 | 2024-01-26 04:00:00.000 | logout          |
|       41 |       2 | 2024-01-29 15:00:00.000 | logout          |
|       42 |       3 | 2024-01-30 21:00:00.000 | login failed    |
|       43 |       3 | 2024-01-30 21:01:00.000 | login failed    |
|       44 |       3 | 2024-01-30 21:02:00.000 | login failed    |
|       45 |       3 | 2024-01-30 21:03:00.000 | login failed    |
|       46 |       3 | 2024-01-30 21:04:00.000 | login failed    |
|       47 |       3 | 2024-01-30 21:05:00.000 | password reset  |
|       48 |       3 | 2024-01-30 21:06:00.000 | password reset  |
|       49 |       3 | 2024-01-30 21:07:00.000 | password reset  |
|       50 |       3 | 2024-01-30 21:08:00.000 | password reset  |
|       51 |       3 | 2024-01-30 21:09:00.000 | password reset  |
|       52 |       3 | 2024-01-30 21:10:00.000 | password reset  |
|       53 |       3 | 2024-01-31 23:55:00.000 | login failed    |
|       54 |       3 | 2024-01-31 23:56:00.000 | login failed    |
|       55 |       3 | 2024-01-31 23:57:00.000 | login failed    |
|       56 |       3 | 2024-01-31 23:58:00.000 | login failed    |
|       57 |       3 | 2024-01-31 23:59:00.000 | login failed    |
|       58 |       3 | 2024-02-01 00:00:00.000 | login failed    |
|       59 |       3 | 2024-02-01 00:01:00.000 | login failed    |
|       60 |       3 | 2024-02-01 00:02:00.000 | login failed    |


Output: 

|user_id|consecutive_failures|
|-------|--------------------|
|      3|                   8|
