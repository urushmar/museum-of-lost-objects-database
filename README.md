# Museum of Lost Objects — Database

A PostgreSQL database for a small museum that collects, preserves and exhibits
lost or donated everyday items. It records the objects, who donated them, the
employees who care for them, the exhibitions they appear in, the restoration
work done on them, and the tickets sold to visitors.

Covers the full design: domain analysis, conceptual and relational schemas,
DDL, sample data, and a set of 29 queries.

## Domain

Each object has a name or type, a physical condition and a short description of
its story. Objects belong to categories such as clothing, documents, toys or
personal accessories, and each is stored in a numbered room within a section of
the building.

Some objects are donated by a known donor; others arrive anonymously, so an
object does not require a donor.

Employees have an ID, an address including country, and a salary. Because the
museum is small, one employee can hold several roles at once — curator,
restorer, guide.

Exhibitions have a name, theme, start and end dates and a visitor capacity. An
object can appear in many exhibitions over time, but never in two at the same
time. Visitors buy tickets, each recording a price and the day it was sold.

Restorations link an object, the employee who performed the work, and the date.

## Conceptual Schema
<img width="1770" height="998" alt="conceptuals chema" src="https://github.com/user-attachments/assets/8ff2ab29-dfbc-4a39-a51b-04e675b13828" />

## Relational Schema
<img width="682" height="852" alt="image" src="https://github.com/user-attachments/assets/c4bd4193-1885-483a-9680-91fb3faa286f" />

## Contents

- `01_create.sql` — table definitions
- `02_insert.sql` — sample data, generated with Mockaroo
- `03_queries.sql` — 29 queries covering inner, outer and cross joins, set
  operations (UNION, INTERSECT, EXCEPT), aggregation with GROUP BY and HAVING,
  nested and correlated subqueries, views, and INSERT, UPDATE and DELETE driven
  by nested selects

## Tools

PostgreSQL, DataGrip, Mockaroo for sample data. All data in this repository is
synthetic.
