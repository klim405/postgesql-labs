do $$
    DECLARE
        schema_name information_schema.sql_identifier := coalesce(current_setting('my.schema_name', true), 's327630');
        column_cnt int = 0;
        table_cnt int;
        new_col_name text;
        col_info record;
    BEGIN
        table_cnt := count(distinct table_name) from (
            SELECT table_name
            FROM information_schema.columns
            WHERE table_schema=schema_name and (column_name like E'%\'%' or column_name like '%"%')
            ) as res;
        FOR col_info IN
            SELECT table_name, column_name
            FROM information_schema.columns
            WHERE table_schema=schema_name and (column_name like E'%\'%' or column_name like '%"%')
        LOOP
            new_col_name := replace(col_info.column_name, E'\'', '');
            new_col_name := replace(new_col_name, E'"', '');
            EXECUTE format(
                    'ALTER TABLE %I.%I RENAME COLUMN %I TO %I',
                    schema_name, col_info.table_name, col_info.column_name, new_col_name);
            column_cnt := column_cnt + 1;
            end loop;
        RAISE NOTICE E'Схема: %\n Cтолбцов переименовано: %\n Таблиц изменено: %', schema_name, column_cnt, table_cnt;
    END
$$;
