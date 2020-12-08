result = File.read(ARGV[0]).tr('"', "'")
endpoint = "api.github.com/repos/#{ARGV[2]}/issues/#{ARGV[1]}/comments"
url = "https:/#{endpoint}"
json = "{\"body\":\"textlint でエラーがあったようです。\n~~~#{result}~~~\"}"
puts "[POST] : #{endpoint} : #{json.inspect}"
`curl -X POST -H 'Content-Type:application/json' -H 'Authorization: token #{ARGV[3]}' -d #{json.inspect} #{url}`
