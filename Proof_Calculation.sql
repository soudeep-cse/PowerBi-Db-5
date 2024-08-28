use protfolio

select *
from financial_loan

-- 1
select count(id) as total_loan_application from financial_loan

select count(id) as CM_application from financial_loan
where month(issue_date) = 12 and year(issue_date) = 2021

select count(id) as CM_application from financial_loan
where month(issue_date) = 11 and year(issue_date) = 2021

select cast( 
cast((count(case when month(issue_date)=12 and year(issue_date)=2021 then id end)-
count(case when month(issue_date)=11 and year(issue_date)=2021 then id end))
as decimal(10,3))
/ cast(count(case when month(issue_date)=11 and year(issue_date)=2021 then id end) as DECIMAL(10,3))
as decimal(10,3)) * 100 as MoM_application
from financial_loan

-- 2
select sum(loan_amount) as total_funded_amount from financial_loan

select sum(loan_amount) as CM_amount from financial_loan
where month(issue_date)=12 and year(issue_date)=2021

select sum(loan_amount) as CM_amount from financial_loan
where month(issue_date)=11 and year(issue_date)=2021

select cast(cast(sum(case when month(issue_date)=12 and year(issue_date)=2021 then loan_amount end)
- sum(case when month(issue_date)=11 and year(issue_date)=2021 then loan_amount end)
as decimal(10,2))
/cast(sum(case when month(issue_date)=11 and year(issue_date)=2021 then loan_amount end)
as decimal(10,2)) as decimal(10,3)) * 100 as MoM_loan_amount
from financial_loan

-- 3
select sum(total_payment) as total_amount_received from financial_loan

select sum(total_payment) as CM_payment from financial_loan
where month(issue_date)=12 and year(issue_date)=2021

select sum(total_payment) as PM_payment from financial_loan
where month(issue_date)=11 and year(issue_date)=2021

select
cast(cast((sum(case when month(issue_date)=12 and year(issue_date)=2021 then total_payment end)-
sum(case when month(issue_date)=11 and year(issue_date)=2021 then total_payment end))
as decimal(10,3)) / 
sum(case when month(issue_date)=11 and year(issue_date)=2021 then total_payment end)
as decimal(10,3)) *100 as Mom_payment
from financial_loan

-- 4
select round(avg(int_rate),4) as avg_intarest_rate from financial_loan

-- 5
select round(avg(dti),4) as avg_dti from financial_loan

-- DASHBOARD1 
-- 1
select cast( 
count(case when loan_status='Fully Paid' or loan_status='Current' then id end) * 100
/count(id) as decimal(10,2)) as PGL_application
from financial_loan

-- 2
select count(case when loan_status='Fully paid' or loan_status='Current' then id end)
as GL_application
from financial_loan

-- 3
select 
sum(case when loan_status='Fully paid' or loan_status='Current' then loan_amount end)
as GLF_amount
from financial_loan

-- 4
select 
sum(case when loan_status='Fully paid' or loan_status='Current' then total_payment end)
as GTR_amount
from financial_loan
















