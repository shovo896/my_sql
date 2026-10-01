CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL
);





select * 
from tweets t


select * 
from users u 

SELECT *
FROM public.users AS u;
 
INSERT INTO public.users (id, name, email)
VALUES ('ofkoldoikoazjgnhum21', 'karim', 'aaba@gmail.com');


SELECT *
FROM public.users AS u;
 
INSERT INTO public.users (id, name, email)

VALUES ('ofkoldoikoazjgnjgfm', 'cps', 'aaa@gmail.com'); 


SELECT *
FROM public.tweets;


select u.name,u.email,t.content
from tweets t 
left join users u 
      on t.author_id = u.id 
      
      
select ,u.id ,u."name"  count (t.id)
from users u 
full outer join tweets t 
   on u.id = t.author_id 
   
   
   
group by u.id ,u.name

where t.id is not null 


select * 
from users u 


select * 
from tweets t 
     



   


select * 
from likes l


insert into likes(id,author_id,tweet_id)  values ('adaefhbxha','tabe','wqhgyhw@gmail.com')


select * 
from users u 
where u.id in (select l.author_id from likes)



create table follows (
id uuid primary key , 
follow_id uuid  not null , 
followeee_id uuid not null 



)

select * 
from follows f 

insert into  likes(id,follow_id,followe_id)  values ('adaefhbxha','tabe','wqhgyhw@gmail.com')



select *
     u."name"
     (
     select 
     
     from follows f 
     
     where f.follow_id = u.id 
     
     
     )


from users u 
