SELECT version();

CREATE TABLE hello_cit406 (
  id integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
  student text NOT NULL,
  created_at timestamptz NOT NULL DEFAULT now()
);

INSERT INTO hello_cit406 (student) VALUES ('Manisha Pun');

SELECT * FROM hello_cit406;
