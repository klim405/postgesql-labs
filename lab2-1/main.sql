do $$
    DECLARE
        schema_name information_schema.sql_identifier := coalesce(current_setting('my.schema_name', true), 's327630');
        column_cnt int = 0;
        table_cnt int;
        new_col_name text;
        col_info record;
    BEGIN
        table_cnt := count(distinct table_name) from (
            select a.table_name
            from information_schema.columns as a
            JOIN information_schema.role_table_grants as b
            ON a.table_schema = b.table_schema and a.table_name = b.table_name and b.privilege_type = 'UPDATE'
            WHERE a.table_schema=schema_name and (a.column_name like E'%\'%' or a.column_name like '%"%')
            ) as res;

        FOR col_info IN
            SELECT a.table_name, a.column_name
            FROM information_schema.columns as a
            JOIN information_schema.role_table_grants as b
            ON a.table_schema = b.table_schema and a.table_name = b.table_name and b.privilege_type = 'UPDATE'
            WHERE a.table_schema=schema_name and (a.column_name like E'%\'%' or a.column_name like '%"%')
        LOOP
            new_col_name := replace(col_info.column_name, E'\'', '');
            new_col_name := replace(new_col_name, '"', '');
            if length(new_col_name) = 0 then
                new_col_name := 'kavichka';
            end if;
            WHILE
                (select count(*) from information_schema.columns where table_schema=schema_name and table_name=col_info.table_name and column_name=new_col_name) > 0
            LOOP
                new_col_name := concat(new_col_name, '_renamed');
            END LOOP;
            EXECUTE format(
                    'ALTER TABLE %I.%I RENAME COLUMN %I TO %I',
                    schema_name, col_info.table_name, col_info.column_name, new_col_name);
            column_cnt := column_cnt + 1;
            end loop;
        RAISE NOTICE E'Схема: %\n Cтолбцов переименовано: %\n Таблиц изменено: %', schema_name, column_cnt, table_cnt;
    END
$$;
