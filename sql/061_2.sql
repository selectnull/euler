select p3.val triangle, p4.val square, p5.val pentagonal, p6.val hexagonal, p7.val heptagonal, p8.val octagonal, p3.n n3, p4.n n4, p5.n n5, p6.n n6, p7.n n7, p8.n n8
from polygonals p3
cross join polygonals p4 
cross join polygonals p5 
cross join polygonals p6 
cross join polygonals p7 
cross join polygonals p8 

where p3.polygonal = 3 and p4.polygonal = 4 and p5.polygonal = 5 and p6.polygonal = 6 and p7.polygonal = 7 and p8.polygonal = 8
and
  (right(p3.val, 2) = left(p4.val, 2) or right(p3.val, 2) = left(p5.val, 2) or right(p3.val, 2) = left(p6.val, 2) or 
    right(p3.val, 2) = left(p7.val, 2) or right(p3.val, 2) = left(p8.val, 2))
and
  p3.n <> p4.n and p3.n <> p5.n and p3.n <> p6.n and p3.n <> p7.n and p3.n <> p8.n 