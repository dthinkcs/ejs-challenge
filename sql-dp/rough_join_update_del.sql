insert into accident values(501,TO_DATE('05-feb-2018', 'dd-mm-yy'),'ring road');
insert into accident values(502, TO_DATE('21-mar-2019', 'dd-mm-yy'),'peenya');
insert into accident values(503,TO_DATE('10-aug-2018', 'dd-mm-yy'),'tumkur');
insert into accident values(12,TO_DATE('29-sep-2019', 'dd-mm-yy'),'mysore');
insert into accident values(20,TO_DATE('01-jun-2010', 'dd-mm-yy'),'hebbal');

  update ud
       set assid = (
            select sale.assid
            from sale
            where sale.udid = ud.id
       )
   where exists (
        select *
        from sale
        where sale.udid = ud.id
   );
  MySQL:

  update ud u
  inner join sale s on
      u.id = s.udid
  set u.assid = s.assid
  SQL Server:

  update u
  set u.assid = s.assid
  from ud u
      inner join sale s on
          u.id = s.udidrough
  Oracle:

  update
      (select
          u.assid as new_assid,
          s.assid as old_assid
      from ud u
          inner join sale s on
              u.id = s.udid) up
  set up.new_assid = up.old_assid
  SQLite:

  update ud
       set assid = (
            select sale.assid
            from sale
            where sale.udid = ud.id
       )
   where RowID in (
        select RowID
        from ud
        where sale.udid = ud.id
   );


   update table_name
   set column_b = case
                   when column_a = 1 then 'Y'
                   else null
                  end,
   set column_c = case
                   when column_a = 2 then 'Y'
                   else null
                  end,
   set column_d = case
                   when column_a = 3 then 'Y'
                   else null
                  end
 where
  conditions
