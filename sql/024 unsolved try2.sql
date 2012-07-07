with ns as (
  select cast(val as char(1)) n from integers(0, 9)
)
select ns.n || ns1.n || ns2.n || ns3.n || ns4.n || ns5.n || ns6.n || ns7.n || ns8.n || ns9.n
from ns
cross join ns ns1
cross join ns ns2
cross join ns ns3
cross join ns ns4
cross join ns ns5
cross join ns ns6
cross join ns ns7
cross join ns ns8
cross join ns ns9

where 
ns.n <> ns1.n and ns.n <> ns2.n and ns.n <> ns3.n and ns.n <> ns4.n and ns.n <>ns5.n and ns.n <> ns6.n and ns.n <> ns7.n and ns.n <> ns8.n and ns.n <> ns9.n
and ns1.n <> ns2.n and ns1.n <> ns3.n and ns1.n <> ns4.n and ns1.n <> ns5.n and ns1.n <> ns6.n and ns1.n <> ns7.n and ns1.n <> ns8.n and ns1.n <> ns9.n
and ns2.n <> ns3.n and ns2.n <> ns4.n and ns2.n <> ns5.n and ns2.n <> ns6.n and ns2.n <> ns7.n and ns2.n <> ns8.n and ns2.n <> ns9.n
and ns3.n <> ns4.n and ns3.n <> ns5.n and ns3.n <> ns6.n and ns3.n <> ns7.n and ns3.n <> ns8.n and ns3.n <> ns9.n
and ns4.n <> ns5.n and ns4.n <> ns6.n and ns4.n <> ns7.n and ns4.n <> ns8.n and ns4.n <> ns9.n
and ns5.n <> ns6.n and ns5.n <> ns7.n and ns5.n <> ns8.n and ns5.n <> ns9.n
and ns6.n <> ns7.n and ns6.n <> ns8.n and ns6.n <> ns9.n
and ns7.n <> ns8.n and ns7.n <> ns9.n
and ns8.n <> ns9.n
rows 999999 to 1000001
