result = File.read(ARGV[0]).tr('"', "'")
pr_num = ARGV[1]
if pr_num =~ /^pr/
  endpoint = "api.github.com/repos/#{ARGV[2]}/issues/#{pr_num.tr('pr/','')}/comments"
  url = "https:/#{endpoint}"
  json = "{\"body\":\"textlint でエラーがあったようです。\n~~~#{result}~~~\"}"
  puts "[POST] : #{endpoint} : #{json.inspect}"
  `curl -X POST -H 'Content-Type:application/json' -H 'Authorization: token #{ARGV[3]}' -d #{json.inspect} #{url}`
end
