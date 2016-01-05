require 'yaml'

widgets = YAML.load_file('widgets.yml')

for widget in widgets do
  system("echo 'installing' #{widget}")
  system("dashing install #{widget}")
end
