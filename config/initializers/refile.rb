require "refile/s3"

aws = {
  access_key_id: ENV["AWS_ACCESS_KEY_ID"],
  secret_access_key: ENV["AWS_SECRET_ACCESS_KEY"],
  region: "us-east-2",
  bucket: "cat-app-refile",
  s3_endpoint: "s3-us-east-2.amazonaws.com"
}
Refile.cache = Refile::S3.new(prefix: "cache", **aws)
Refile.store = Refile::S3.new(prefix: "store", **aws)
