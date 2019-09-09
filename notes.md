## 2019-08-31_0513 `null: false` on referencing rows

From the [PostgreSQL docs on constraints](https://www.postgresql.org/docs/current/ddl-constraints.html):

> If you  don’t want  referencing rows  to be  able to
> avoid satisfying the foreign key constraint, declare
> the referencing column(s) as NOT NULL.

In  other words,  one cannot  create a  `credential`
record  for  example,  if  there  is  no  associated
`user`, so no dangling pointers.

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
