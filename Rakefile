require 'nanoc3/tasks'
require 'fileutils'
require 'active_support/core_ext'
require 'active_support/multibyte'

namespace :create do
  @ymd = Time.now.to_s(:db).split(' ')[0]

  desc "Creates a new article"
  task :article do
    if !ENV['title']
      $stderr.puts "\t[error] Missing title argument.\n\tusage: rake create:article title='article title'"
      exit 1
    end

    title = ENV['title'].capitalize
    path, filename, full_path = calc_path(title)

    if File.exists?(full_path)
      $stderr.puts "\t[error] Exists #{full_path}"
      exit 1
    end

    # -2 for . and .. then + 1 since we're 1-based
    tiny = Dir.open(path).collect.length - 1

    template = <<TEMPLATE
---
title: "#{title.titleize}"
kind: article
tags: []
permalink: "/articles/#{title.parameterize('-')}.html"
tiny: /a/#{tiny}
location: Calgary
created_at: #{@ymd}
---

TODO: Add content to `#{full_path}.`
TEMPLATE

    FileUtils.mkdir_p(path) if !File.exists?(path)
    File.open(full_path, 'w') { |f| f.write(template) }
    $stdout.puts "\t[ok] Edit #{full_path}"
    # Symbolic link to make editing the current article easier
    `ln -f -s #{full_path} current_article`
  end

  def calc_path(title)
    path = 'content/articles/'
    filename = @ymd + "-" + title.parameterize('-') + ".md"
    [path, filename, path + filename]
  end
end


