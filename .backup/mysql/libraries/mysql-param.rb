module MysqldParam
  # スレッド バッファ
  PARAM_MAX_ALLOWED_PACKET  = 8         # クライアントが実行できるSQL文の最大長 目安：16MB
  PARAM_SORT_BUFFER_SIZE = 1024         # ファイルソートを実行するときに使うメモリ上の領域. 超過した分はテンポラリファイルに書き出され、ソートが実行される
  PARAM_READ_BUFFER_SIZE = 1024         # インデックスを使わないテーブルスキャンに使うメモリ上の領域
  PARAM_READ_RND_BUFFER_SIZE  = 512     # インデックスによるソートを実行するとき、ソートしたレコードの読み出しに使うメモリ上の領域

  # グローバル バッファ
  PARAM_TABLE_OPEN_CACHE    = 256       # 接続終了後もテーブルをメモリ上に維持しておき、次の接続時に再利用するための領域 目安：400個
  PARAM_MAX_CONNECTIONS     = 1024      # 最大同時接続数は一般ユーザーが同時に接続できる最大数
  PARAM_MAX_CONNECT_ERRORS  = 1000      # 1つのホストから連続したエラーが発生した場合、そのホストをブロックする
  PARAM_THREAD_CACHE        = 256       # 接続終了後のサーバースレッドを解放せず. 最大同時接続数が多い場合、このパラメータを大きくすると再接続時のオーバーヘッドが軽減される
  PARAM_MAX_HEAP_TABLE_SIZE = 64        # メモリ上に作成されるテーブルの最大値を設定する
  PARAM_TMP_TABLE_SIZE      = 64        # heapと同じ大きさにする. heap テーブルのサイズが tmp_table_size を超えた場合、MySQL はディスクベースの MyISAM に切り替える
  PARAM_QUERY_CACHE_TYPE = 0            # 0:キャッシュを行わない。またはキャッシュした結果の読み出しを行わない。
  PARAM_QUERY_CACHE_SIZE = 0            # テーブルの更新が少なく、かつ同じクエリを繰り返す場合、このパラメータを大きくするとクエリの解析と実行をスキップできる

  def get_mysql_params(items)
    items["max_allowed_packet"] = PARAM_MAX_ALLOWED_PACKET.to_s + "M"
    items["table_open_cache"]   = PARAM_TABLE_OPEN_CACHE.to_s
    items["max_connections"]    = PARAM_MAX_CONNECTIONS.to_s
    items["max_connect_errors"] = PARAM_MAX_CONNECT_ERRORS.to_s
    items["sort_buffer_size"]   = PARAM_SORT_BUFFER_SIZE.to_s + "M"
    items["read_buffer_size"]     = PARAM_READ_BUFFER_SIZE.to_s + "M"
    items["thread_cache"]         = PARAM_THREAD_CACHE.to_s
    items["query_cache_size"]     = PARAM_QUERY_CACHE_SIZE.to_s
    items["query_cache_type"]     = PARAM_QUERY_CACHE_TYPE.to_s
    items["tmp_table_size"]       = PARAM_TMP_TABLE_SIZE.to_s      + "M"
    items["max_heap_table_size"]  = PARAM_MAX_HEAP_TABLE_SIZE.to_s + "M"
  end
end

