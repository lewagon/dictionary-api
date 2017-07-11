require 'pstore'
$store = PStore.new("counter.pstore")
$store.transaction do
  $store[:counter] = 1 unless $store[:counter]
  $store.commit
end
