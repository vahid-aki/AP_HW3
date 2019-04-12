-----q1
SELECT * FROM Users WHERE phone = '09120000001';

-----q2
UPDATE Users 
    SET email = 'apstudent2019@gmail.com' 
    WHERE phone = '09120000001';

-----q3
SELECT * 
    FROM ChannelMembership 
    WHERE user_id in (SELECT telegram_id 
                      FROM Users 
                      WHERE phone = '09120000001');

-----q4
SELECT COUNT(user_id)
    FROM ChannelMembership CM
    WHERE channel_id = '@aut_ap_2019';

-----q5
SELECT email FROM Users WHERE phone LIKE '0935%';

-----q6
SELECT phone 
FROM Users 
WHERE telegram_id in (
        SELECT blocked_user_id 
        FROM BlockUser
        WHERE blocker_user_id in (
                SELECT telegram_id 
                FROM Users 
                WHERE phone = '09120000001')
);


----q7
SELECT *
FROM Users 
WHERE (telegram_id in (
        SELECT creator_id 
        FROM Channel
        WHERE telegram_id in (
                SELECT channel_id 
                FROM ChannelMembership
 GROUP BY  ChannelMembership.channel_id
                Having COUNT(ChannelMembership.user_id) >= 3
)))
AND
(telegram_id in (
        SELECT creator_id 
        FROM Channel
        WHERE telegram_id in (
                SELECT channel_id 
                FROM ChannelMembership
                   WHERE user_id in (
                     SELECT telegram_id 
                     FROM Users 
                     WHERE email = 'apstudent2019@gmail.com')
)))
;

-----q8
SELECT message_text 
FROM Message 
WHERE (sender_id = '@sHDiV4RHs' AND 
       receiver_id = '@amir.jahanshahi') 
    OR 
       (sender_id = '@amir.jahanshahi' AND 
       receiver_id = '@sHDiV4RHs') 
ORDER BY id DESC 
LIMIT 10;

-----q9
SELECT phone
FROM Users 
WHERE telegram_id in ( 
    SELECT creator_id 
    FROM Channel 
    WHERE telegram_id in ( 
        SELECT channel_id 
        FROM ChannelMessage 
        WHERE updated_at < '2019-03-12')
);

