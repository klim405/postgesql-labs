DROP TABLE IF EXISTS test1;

CREATE TABLE test1 (
    "'hello" integer,
    "world''" integer
);

INSERT INTO test1 VALUES (1, 5), (1, 8);
