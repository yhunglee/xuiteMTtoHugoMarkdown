# encoding: utf-8
# author: howardsun
# Date: 2019/12/16
# Transform exported M.T. file(Movable type file) of xuite blog to be markdown-type file of hugo static site generator with liva-hugo theme posts.

require 'reverse_markdown'

# load input file
input_file = File.open('./input/sample-input.txt_', "r")
raw_content = input_file.read
input_file.close
raw_content.prepend("--------\n")
puts raw_content #debug


# split meta and body
meta = Array.new
body = Array.new


# need append file first 8 bytes with "-" character

meta_match = raw_content.gsub(/(?<=\-{8}).*?(?=-{4})/um)
# puts "meta_match[]: " + meta_match.next
# puts "1==="
# puts "meta_match[]: " + meta_match.next
# puts "2==="
# puts "meta_match[]: " + meta_match.next
# puts "3==="



body_match = raw_content.gsub(/(?<=BODY:\s).*?(?=\-{5})/um)
# puts "body_match[]: " + body_match.next
# puts "1==="
# puts "body_match[]: " + body_match.next
# puts "2==="
# puts "body_match[]: " + body_match.next
# puts "3==="


# mapping meta to hugo post
=begin
 xuite article ------- hugo post
   meta :              : meta
   TITLE:              : title
  AUTHOR:                <NONE>
    DATE:              : date
 MM/DD/YYYY HH:mm:ss AM 
                      YYYY-MM-DDTHH:mm:ss+HH:mm

CATEGORY:              : categories
                         array

                       : image
                       : description


  STATUS:              : draft
publish/draft          true/false

                       : tags
                         array

                       : type
                       post/feature

                       : highlight
                          true/false

=end

=begin
    body transformation

    xuite article ------- hugo post
     BODY:                : --- and two newlines

=end

# tranform body to markdown content
# use reverse_markdown gem




# output every post a separated file
# output file name is test-timestamp.md

