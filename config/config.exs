use Mix.Config

config :merge_index,
  data_root: 'data/merge_index',
  buffer_rollover_size: 1_048_576,
  buffer_delayed_write_size: 524_288,
  buffer_delayed_write_ms: 2000,
  compact_mod_fun: {:mi_segment, :compact_by_average},
  compact_staleness_threshold: {1, :hours},
  max_compact_segments: 20,
  segment_query_read_ahead_size: 65536,
  segment_compact_read_ahead_size: 5_242_880,
  segment_file_buffer_size: 20_971_520,
  segment_delayed_write_size: 20_971_520,
  segment_delayed_write_ms: 10000,
  segment_full_read_size: 5_242_880,
  segment_block_size: 32767,
  segment_values_staging_size: 1000,
  segment_values_compression_threshold: 0,
  segment_values_compression_level: 1

# src/merge_index.app.src
# {application, merge_index,
#     [{description, "Merge-Index Data Store"},
#      {vsn, git},
#      {applications, [kernel,
#                      stdlib,
#                      sasl]},
#      {registered,[]},
#      {mod, {mi_app, []}},
#      {env, [
#             {data_root, "data/merge_index"},
#             {buffer_rollover_size, 1048576},
#             {buffer_delayed_write_size, 524288},
#             {buffer_delayed_write_ms, 2000},
#             {compact_mod_fun, {mi_segment, compact_by_average}},
#             {compact_staleness_threshold, {1, hours}},
#             {max_compact_segments, 20},
#             {segment_query_read_ahead_size, 65536},
#             {segment_compact_read_ahead_size, 5242880},
#             {segment_file_buffer_size, 20971520},
#             {segment_delayed_write_size, 20971520},
#             {segment_delayed_write_ms, 10000},
#             {segment_full_read_size, 5242880},
#             {segment_block_size, 32767},
#             {segment_values_staging_size, 1000},
#             {segment_values_compression_threshold, 0},
#             {segment_values_compression_level, 1}
#            ]}
# ]}.

config :lager,
  # Stop lager redirecting :error_logger messages
  error_logger_redirect: false,
  # Stop lager removing Logger's :error_logger handler
  error_logger_whitelist: [Logger.ErrorHandler],
  # Stop lager writing a crash log
  crash_log: false,
  # Use LagerLogger as lager's only handler.
  handlers: [{LagerLogger, [level: :debug]}]
