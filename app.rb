require 'sinatra'
require 'redcarpet'

get '/' do
  @files = Dir.glob('**/*.md')
  erb :index
end

get '/:filename/' do
  markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, tables: true)
  md = File.open( params[:filename] + '.md').read()
  markdown.render( md )
end