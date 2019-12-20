# encoding: utf-8
# author: howardsun
# Date: 2019/12/16
# Transform exported M.T. file(Movable type file) of xuite blog to be markdown-type file of hugo static site generator with liva-hugo theme posts.

require 'reverse_markdown'
require 'date'
require 'yaml'

# load input file
# Notice: need to save input file as LF as line separator. If it is CRLF, convert it to LF.
input_file = File.open('./input/xuite_blog_export_2008876.txt_', "r")
#input_file = File.open('./input/sample-input.txt_', "r")
raw_content = input_file.read
input_file.close

# need append file first 8 bytes with "-" character
raw_content.prepend("--------\n")


# split meta and body
meta = Array.new
body = Array.new



# extract meta from raw file content
meta_match = raw_content.gsub(/(?<=\-{8}).*?(?=-{4})/um)
# meta_match.with_index { |content, idx|
#     puts "index #{idx} is #{content}" #debug
# }



# extract body of post from raw file content
body_match = raw_content.gsub(/(?<=BODY:\s).*?(?=\-{5})/um)
# body_match.with_index { |a,index|
#     puts "index #{index} is #{a}" #debug
# }




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

tmpHash = Hash.new

meta_match.with_index { |meta, idx| 

    # create a new hash for each post
    tmpHash[idx] = Hash.new

    # TITLE to title
    tmpHash[idx]["title"] = /(?<=TITLE:\s).+/u.match(meta).to_s

    # DATE to date
    tmpHash[idx]['date'] = DateTime.strptime(/(?<=DATE:\s).+/u.match(meta).to_s.concat(' +08'), '%m/%d/%Y %I:%M:%S %p %z').to_s

    # CATEGORY to categories
    tmpHash[idx]['categories'] = [/(?<=CATEGORY:\s).+/u.match(meta).to_s]

    # gen image meta
    tmpHash[idx]['image'] = ''

    # gen description meta
    tmpHash[idx]['description'] = tmpHash['title']

    # gen draft meta
    tmpDraft = /(?<=STATUS:\s).+/u.match(meta).to_s
    tmpHash[idx]['draft'] = (tmpDraft.casecmp('publish') === 0)? false : true

    # gen tags meta
    tmpHash[idx]['tags'] = []

    # gen type meta
    tmpHash[idx]['type'] = 'post'

    # gen highlight meta
    tmpHash[idx]['highlight'] = false


}

=begin
    body transformation

    xuite article ------- hugo post
     BODY:                : --- and two newlines

=end

# tranform body to markdown content
# use reverse_markdown gem
tmpContent = Hash.new
body_match.with_index {|content, idx|

    tmpContent[idx] = ReverseMarkdown.convert content

}



# output every post a separated file
# output file name is test-timestamp.md
# Notice: f.puts \-{3} and two newline
meta_match.with_index { |_, index|
    File.open("./output/#{index}.md", "w") { |f|
        f.write(tmpHash[index].to_yaml)
        f.puts("---", "", "", tmpContent[index])
    }
}
