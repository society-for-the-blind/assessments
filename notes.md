## 2019-09-01_1241 unique constraint on role

At this point it is  possible to add (allowed) roles
multiple  times (i.e.,  `admin` or  `instructor`). A
constraint could be added in the database
(see [this](https://dba.stackexchange.com/questions/161313/creating-a-unique-constraint-from-a-json-object)),
or it  could be made  sure during update  and insert
that  this won't  be the  case, but  in the  end, it
doesn't really matter.

On  the  other hand,  if  the  roles are  structured
hierarchically,  there won't  even be  a need  for a
list.
