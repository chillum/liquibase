# frozen_string_literal: true

IMAGE    = 'chillum/liquibase'
LB_VER   = '3.10.3'
LB_TAR   = "liquibase-#{LB_VER}.tar.gz"
JDBC_VER = '42.2.18'
JDBC     = "postgresql-#{JDBC_VER}.jar"

require 'open-uri'

task default: :build

desc "Build Docker image: #{IMAGE}:#{LB_VER}"
task build: :download do
  sh "docker build -t #{IMAGE} ."
  sh "docker tag #{IMAGE} #{IMAGE}:#{LB_VER}"
end

def download(url)
  file = File.basename(url)
  return if File.exist?(file)

  puts "Downloading #{file}"
  IO.copy_stream(URI.open(url), file)
end

desc "Download #{LB_TAR} and #{JDBC}"
task :download do
  download "https://github.com/liquibase/liquibase/releases/download/v#{LB_VER}/#{LB_TAR}"
  download "https://jdbc.postgresql.org/download/#{JDBC}"
end

desc 'Clean up working directory (use this if you switch Liquibase or JDBC driver versions)'
task :clean do
  Dir.glob('*.{jar,tar.gz}').each { |file| rm(file) }
end
