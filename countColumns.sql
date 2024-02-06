SELECT COUNT(*) AS column_count
FROM information_schema.columns
WHERE table_schema = 'cadmus_db'  -- Replace with your actual database name
  AND table_name = 'reports';       -- Replace with your actual table name
