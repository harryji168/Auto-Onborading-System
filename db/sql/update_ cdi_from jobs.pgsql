/*update jobs set check_count=1 where linked_id='2810757193';*/

/*select * from jobs where company like 'CDI%' */
/*and check_count is null*/

/*update jobs set check_count=1  where company like 'CDI%' and check_count is null*/

-- select * from jobs where title like 'Work From Home%' and check_count is null

update jobs set check_count=1   where title like 'Work From%' and check_count is null

/*select * from jobs where title not like 'Work From Home%'  */

/*select * from jobs where company like 'Mastercard%'*/


-- update jobs set check_count=9  where company like 'Mastercard%' 