# A syntax highlighter for JSON files using regex expressions.
#
# Gabriel Cordova
# 2023-05-31

defmodule SyntaxHighlighter do
  
  # Function to highlight a JSON file and generate an HTML output
  def highlight_json_file(input_path, output_path) do
    input_path
    |> File.read!()
    |> parse_json()
    |> write_to_html(output_path)

    write_css_file("css.css")
  end
  
  # Function to parse the JSON content and replace it with HTML tags for highlighting
  defp parse_json(json) do
    json
    |> replace_with_tags()
  end

  # Function to replace specific JSON patterns with corresponding HTML tags
  defp replace_with_tags(json) do
    patterns = %{
      ~r/(:|,)(?![^<]*>|[^<>]*<\/)/ => "<span class='punctuation'>\\g{0}</span>",
      ~r/"([^"]*)"\s*(?=\s*:)|(?!)/ => "<span class='key'>\\g{0}</span>",
      ~r/"(\s*[^" ])*"(?!<)|(?!)/ => "<span class='string'>\\g{0}</span>",
      ~r/-?\b\d+(\.\d+)?([eE][-+]?\d+)?\b(?!.*")/ => "<span class='number'>\\g{0}</span>",
      ~r/(\[|\])(?![^<]*>|[^<>]*<\/)/ => "<span class='bracket'>\\g{0}</span>",
      ~r/(\{|\})(?![^<]*>|[^<>]*<\/)/ => "<span class='brace'>\\g{0}</span>",
      ~r/(\[)(.*?)(\])(?![^<]*>|[^<>]*<\/)/ => "<span class='array'>\\g{0}</span>",
      ~r/(null|true|false)/ => "<span class='reserved'>\\g{0}</span>"
    }

    Enum.reduce(patterns, json, fn {regex, tag}, acc ->
      Regex.replace(regex, acc, tag)
    end)
  end

  # Function to write the CSS styling to a file
  defp write_css_file(css_path) do
    css = """
    body {
      background-color: #252525;
      tab-size: 10px;
      -moz-tab-size: 4;      
      -o-tab-size: 4;
      tab-size: 4
    }

    pre {
      font-family: Monospace;
      font-size: 20px;
    }

    .bracket {
      color: White;
    }

    .brace {
      color: White;
    }

    .number {
      color: LightSkyBlue;
    }

    .float {
      color: Green;
    }

    .string {
      color: #6497b1;
    }

    .key {
      color: #c792ea;
    }

    .reserved {
      color: CornflowerBlue;
    }

    .punctuation {
      color: White;
    }
    """

    File.write(css_path, css)

  end  

  # Function to write the highlighted JSON content to an HTML file
  defp write_to_html(content, output_path) do
    html = """
    <!DOCTYPE html>
    <html>
    <head>
        <link rel="stylesheet" type="text/css" href="css.css">
    </head>
    <body>
    <pre>
    #{content}
    </pre>
    </body>
    </html>
    """
    File.write!(output_path, html)
  end
end

# Calling main function with the json file to parse and the output file.
SyntaxHighlighter.highlight_json_file("Tests/4.json", "output.html")
