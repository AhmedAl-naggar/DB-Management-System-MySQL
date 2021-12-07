CREATE view view1 AS (SELECT count(id) as name_donner FROM donner);
SELECT  count (B.id) AS beneficiaries, 
       	   name_donner AS donner
FROM beneficiary B, view1;


SELECT B.fname, B.mid_name, B.lname, B.phone, B.income
FROM beneficiary B
WHERE B.income<1000; 


SELECT B.fname AS "beneficiary ",
       F.name AS "family member",
       F.relationship,   
       F.job
FROM `family member` F JOIN beneficiary B ON (B.id=F.id) 
      AND F.job LIKE '%student%';


SELECT B.fname AS beneficiary ,
       F.name  AS family_member,
       F.relationship,
       FS.type AS sikness_TYPE
FROM `family member` F LEFT OUTER JOIN beneficiary B 
      ON (B.id=F.id),
      `family member_has_sikness` FS 
WHERE  FS.id = F.id; 


SELECT B.fname AS beneficiary ,
       COUNT (F.id) AS family_members
FROM `family member` F LEFT OUTER JOIN beneficiary B ON (B.id=F.id) 
GROUP BY B.id
ORDER BY 2 DESC;


SELECT SUM (amount) AS TOTAL_MONEY
FROM mony;

SELECT 
    b.fname AS parent,
    b.job AS perant_jop,
    f.name AS member,
    f.job AS member_job,
    f.relationship AS relation
FROM
    beneficiary b,
    family_member f
WHERE
    b.id = f.id;

CREATE VIEW perant_sikness AS
    SELECT 
        p.id,
        p.fname AS parent_name,
        p.phone AS phone,
        s.type AS sickness,
        s.medicine AS medicine
    FROM
        beneficiary p,
        beneficiary_has_sikness ps,
        sickness s
    WHERE
        p.id = ps.id AND ps.type = s.type;
        
        
SELECT 
    *
FROM
    perant_sikness;


CREATE VIEW member_sikness AS
    SELECT 
        f.id ,
        f.name AS name_of_member,
        f.job AS jop_of_member,
        m.type AS sikness,
        s.medicine
    FROM
        `family member` f,
       `family member_has_sikness` m,
        sickness s
    WHERE
        f.id = m.id AND m.type = s.type;
    
    
    SELECT 
    *
FROM
    member_sikness ;
    
    
SELECT 
    y.id,
    y.fname,
    y.mid_name,
    y.lname,
    y.phone,
    y.income,
    SUM(m.amount) AS sum_of_mony,
    p.name AS name_of_opj,
    p.quantity
FROM
    beneficiary y,
    benefit t,
    `physical kind b` p,
    `mony b` m
WHERE
    y.id = t.id AND t.id = p.id
        AND t.id = m.id;


SELECT 
    d.id,
    d.fname,
    d.mid_name,
    d.lname,
    d.phone,
    k.name AS name_of_opj,
    k.quantity
FROM
    donner d,
    donner_has_donation h,
    donation n,
    kind k
WHERE
    d.id = h.id
        AND h.`code of donation` = n.`code of donation`
        AND n.`code of donation` = k.`donation_code of donation`;
        
        
select  n.occasion,sum(m.amount)as TheSumOfAmountgetfromdonner 

from    donation n,mony m 

where   n.`code of donation` =m.`code of donation`

group by  n.occasion;


select  b.fname  as beneficiaryname ,b.income, b.job  as beneficiaryjop , ben.occasion, ben.date,p.name,mb.amount,p.quantity
from beneficiary b,benefit ben, `mony b` mb,`physical kind b` p
where b.id=ben.id and ben.id=mb.id and  ben.id= p.id ;


select b.fname as beneficiaryname,f.name as familyname,f.job as familyjob,f.income,f.costs,f.relationship,f.`birth date`as familybirthdate
from beneficiary b, `family member` f
where b.id=f.id;


select  b.fname as beneficiaryname,b.income,b.job as beneficiaryjob,s.type as type_of_disease
 ,s.medicine as treatment_of_disease
from beneficiary b,sickness s,beneficiary_has_sikness bs
where b.id=bs.id and  bs.type=s.type  ;


select  b.fname as beneficiaryname,b.income,b.job as beneficiaryjob,s.type as type_of_disease
 ,s.medicine as treatment_of_disease
from beneficiary b,sickness s,beneficiary_has_sikness bs
where b.id=bs.id and  bs.type=s.type  ;


select b.fname as Beneficiary_name,f.name as familyname,f.job as familyjob,f.income,f.costs,f.relationship,s.type ,s.medicine as treatment_of_disease

from beneficiary b,`family member` f, sickness s,`family member_has_sikness` fs
where b.id=f.id and f.id=fs.id and f.name=fs.name and fs.type=s.type;


select b.fname as beneficiaryname, f.relationship,f.name as familyname_IS_Not_suffering_from_any_disease
from `family member` f, beneficiary b
where b.id=f.id and (f.name) NOT IN (  
select f.name as familyname 
from `family member` f, sickness s,`family member_has_sikness` fs
where f.id=fs.id and f.name=fs.name and fs.type=s.type);


select  k.name as kindName, sum(k.quantity)as theSumofamountGetFromdonner,kb.name,sum(kb.quantity)as theSumOfAmountGivetobeneficiary
from kind  k ,`physical kind b` kb
group by k.name;



select b.fname as beneficiaryname,p.name,sum(p.quantity) as TheSumOfQuantityToEveryBinficiary,sum(mb.amount)as TheSumOfAmountToEveryBinficiary
 from beneficiary b,benefit ben, `mony b` mb,`physical kind b` p
where b.id=ben.id and ben.id=mb.id and  ben.id= p.id 
group by p.name;


select d. fname,d.mid_name,d.lname,d.address,n.occasion,n. date,m. amount
from   donner d, donner_has_donation o , donation n ,mony m
where d.id=o.id and o. `code of donation`=n.`code of donation` and  n.`code of donation`= m.`code of donation` ;



