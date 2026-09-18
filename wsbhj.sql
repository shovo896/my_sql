create table Tweets {
id uuid not null primary key ,
context text not null } 


alter table tweets 
alter column create_at  data not null default now();

insert into Tweets  (id ,content) values {gen_random_uuid ,'hello 2'}



SELECT id, content, reply_count
FROM tweets

INSERT INTO public.tweets (id, content)
VALUES (
    '550e8400-e29b-41d4-a716-446655440000',
    'এটি আমার নতুন tweet'
);


SELECT id, content
FROM public.INSERT INTO public.tweets (id, content)
VALUES (
    '550e8400-e29b-41d4-a716-446655440000',
    'এটি আমার নতুন tweet'
);

SELECT id, content
FROM public.tweets
WHERE content ILIKE '%search text%';

SELECT id, content
FROM public.tweets
ORDER BY id;


select * from tweets


update tweets 
--set reply_count = 5 

set create_at= "2026-09-6"
where id ='550e8400-e29b-41d4-a716-446655440000'




select 
    t.id as ID , 
    t_reply_count as COUNT except 

    
 
    
    
    
    
select * 
from tweets t

where t.reply_count = 25 



select 

from tweets t 
limit 2 


select * 

from tweets t 


limit 2 

offset 0 




select * 

from tweets t  


where t."content" like "#do%"























