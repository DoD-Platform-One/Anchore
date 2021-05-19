# Anchore Metrics

## Anchore metrics

anchore_db_read_seconds_count

* Duration of the read processes conducted by anchore.

anchore_db_read_seconds_created

* Duration of the construction processes for read.

anchore_db_read_seconds_sum

* The sum of the duration of all read processes.

anchore_db_readwrite_seconds_count

* Duration of the readwrite processes conducted by anchore.

anchore_db_readwrite_seconds_created

* Duration of the construction processes for readwrite.

anchore-db_readwrite_seconds_sum

* The sum of the durations of all readwrite processes.

anchore_db_write_seconds_count

* Duration of the write processes conducted by anchore.

anchore_db_write_seconds_created

* Duration of the construction processes for write.

anchore_db_write_seconds_sum

* The sum of the duration of all write processes.

anchore_monitor_runtime_seconds_count

* Duration of the runtime monitor processes conducted by anchore.

anchore_monitor_runtime_seconds_created

* Duration of the construction processes for runtime monitor.

anchore_monitor_runtime_seconds_sum

* The sum of the duration of all monitor process.

anchore_queue_length

* Number of images pending analysis.

anchore_service_info

* Returns info and status on the 4 services of Anchore.

anchore_tmpspace_available_bytes

* Available space in the "tmp_dir" location of each container.

process_resident_memory_bytes

* Memory consumed by the instance

### API service

prometheus_api_remote_read_queries

* Returns number of queries coming from the remote stream.

### Engine

prometheus_engine_queries

* The number of concurrent queries that the engine is reading.

prometheus_engine_queries_concurrent_max

* The number of maximum concurrent queries that the engine can read.

prometheus_engine_query_duration_seconds_count

* Duration of the query processes conducted by prometheus.

prometheus_engine_query_duration_seconds

* Duration of each process
  * Differs from prometheus_engine_query_duration_seconds_count as the duration for every process is listed seperatly

prometheus_engine_query_duration_seconds_sum

* The sum of the duration of all engine query processes.

## Prometheus metric queries

promhttp_metric_handler_requests_in_flight

* The number of metric requests that are currently being processed.

promhttp_metric_handler_requests_total

* The total number of requests made.

### Troubleshooting

If you encounter an error running a query, see the list below for guidance on resolving errors.

Error executing query: invalid parameter 'query':

* This results whenever a syntax error is thrown when a query is parsed.
  * Make sure that you have no spaces in your query.
  * Make sure certain characters (e.g <>/;) are not interfering your query.

parse error: unknown function

* This error occurs when the query database parses a function that is not in the database
  * Make sure the function that you are running is part of the database

No data

* This results when the query is not in the list of available queries
  * Make sure your query is among ones that are listed.
  * Make sure that that your expression is spelled correctly.  
  * Make sure the app is integrated correctly
