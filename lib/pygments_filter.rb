def codify(str, lang)
    lang ||= 'ruby'
    html_coded = ""

    # Use pygmentize, it's very nice
    open("|/usr/bin/pygmentize3 -f html -l #{lang}", "w+") do |f|
        # Write the code to standard input of pygmentize.
        f.puts(str)

        # Close standard input so that we get some output.
        f.close_write

        # Read the output of pygmentize.
        html_coded = f.read
    end

    if html_coded.empty?
        html_coded = '<pre><code>' + str.strip + '</code></pre>'
    end

    html_coded.strip
end

def copy_text_to_file(str, identifier, dir)
    File.open(File.join(dir, identifier), 'w+') do |f|
        f.write(str)
        puts "*** Wrote plaintext file '#{File.join(dir, identifier)}'"
    end
    File.join(dir, identifier)
end

class PygmentsFilter < Nanoc3::Filter
    identifier :pygments
    def run(content, params={})
        while content =~ %r{((<pre>\s*)?(<code lang="(\w+)"( file="(.+?[^"])")?>(.+?[^(</code>)])</code>)(\s*</pre>)?)}m
            orginal, code, lang, filename = $1, $7, $4, $6
            
            # Create a plaintext file version to.
            #if filename
            #   code_path = File.join(config[:output_dir], page.path, 'code')
            #   url = page.path + 'code/' + filename
            #   FileUtils.mkdir_p(code_path)
            #   copy_text_to_file(code, filename, code_path)
            #   page.content.gsub!(orginal, %{<a class="file" href="#{url}">#{filename}</a>\n} + orginal)
            #nd

            # Substitute the un-highlighted code with the highlighted code from
            # pygmentize.
            content.gsub!(orginal, codify(code, lang))
        end
        content
    end
end

