/* An introduction practice for 1.2 of Data lit course from the school of ai. */

/* Creating a table */
create table exercise_logs (
  id integer primary key autoincrement,
  type text,
  minutes integer,
  calories integer,
  heart_rate integer
);

/* Inserting exercise log data*/
insert into exercise_logs(type, minutes, calories, heart_rate) values ('biking', 30, 100, 110);

/* To select all records from a database */
select * from exercise_logs;

/* To find all the activities a user engaged in and the total amount of calories
 they burned doing that activity */
 select type, sum(calories) as total_calories
 from exercise_logs
 group by type;

/* Group the count of exercises by each heart rate zone */
select count(*),
 case
 when heart_rate > 220 - 30 then 'above max'
 when heart_rate > round(.9 * (220 - 30)) then 'above target'
 when heart_rate > round(.5 * (220 - 30)) then 'within target'
 else 'below target'
 end as 'heart_rate_zone'
 from exercise_logs
 group by heart_rate_zone;

 /* To dynamically grab data with a query and use that result in another query
  we have subqueries. For example, we could have a table called drs_favorites that
  holds doctor recommended activities */
  create table drs_favorites (
    id integer primary key, /* unique identifier */
    type text,             /* type of activity */
    reason text           /* reason why doctor recommends it */
  );
insert into drs_favorites
  (type, reason)
  values ('running', 'improves cardiovascular health.');

/* We would like to find all the activities in the exercise_logs table that doctors
 recommended for improving cardiovascular health */
SELECT * FROM exercise_logs WHERE type IN (SELECT type FROM drs_favorites WHERE reason LIKE "%cardiovascular%");
/* In between the parenthesis we have a subquery that selects all the records where
 the word “cardiovascular” is included somewhere in the reason the doctor recommends it */
