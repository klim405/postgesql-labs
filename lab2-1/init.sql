DROP TABLE IF EXISTS test1;

CREATE TABLE test1 (
    "'hello" integer,
    "''hello" integer,
    "world''" integer,
    """" integer
);

INSERT INTO test1 VALUES (1, 5, 12, 12), (1, 8, 12, 12);
