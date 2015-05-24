-- first create a state_avgstar table for interactive bubble plot
create table state_avgstar
  as (select state, avg(stars) from business group by state);

-- this is the reviewText table which contains review texts from AZ, NV, PA, and NC (About 30K total)
create table state_reviewText  
  as (select state, text from review inner join business on review.business_id = business.business_id);
commit;

-- review distribution
select state, count(*) from  STATE_REVIEWTEXT group by state;

-- create AZ_reviewText table (18075 records)
create table AZ_reviewText
  as (select * from state_reviewText where state = 'AZ');
  
-- create NV_reviewText table (10214 records)
create table NV_reviewText
  as (select * from state_reviewText where state = 'NV');
  
-- create PA_reviewText table
create table PA_reviewText
  as (select * from state_reviewText where state = 'PA');
  
-- create NC_reviewText table (1130 records)
create table NC_reviewText
  as (select * from state_reviewText where state = 'NC');

commit;




